; vim: filetype=clojure
;
; calculate the number hosts from whom we are receiving events
(let [index (default :ttl 300 (update-index (index)))]
  (with :service "distinct hosts"
    ; combine each host and service into a stream
    (coalesce
      (smap (fn [events]
        (let [c (count events)] (riemann.common/event {:metric c :host "all" :service "host count" })))
          index))))
