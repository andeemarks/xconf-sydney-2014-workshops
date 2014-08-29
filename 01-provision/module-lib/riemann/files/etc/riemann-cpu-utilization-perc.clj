(let [index (default :ttl 300 (update-index (index)))]
  (where (service #"^cpu-0")
    ; split them by host - for each host
    (by :host
      ; combine host and service and send a vector of events out every 60 seconds
      (coalesce
        ; map the the events to a new cpu-utilization event stream given smap function
        (smap (fn [events]
          ; Given a list of events, sum up the total cpu utilization time and calculate percentage over idle
          (let [cpu-util (/(* 100 (:metric (riemann.folds/sum (filter #(not= "cpu-0/cpu-idle" (:service %)) events))))
                           (reduce + (map #(:metric %) events)))
            host (:host (first events)) ]
            (riemann.common/event {:metric cpu-util :service "cpu utilization" :host host }))) index)))))
