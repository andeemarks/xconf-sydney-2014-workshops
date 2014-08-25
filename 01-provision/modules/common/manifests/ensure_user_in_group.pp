define common::ensure_user_in_group($user, $group) {
  exec { "Ensure user '${user}' is in group '${group}'":
    command => "/usr/sbin/usermod -a -G ${group} ${user}",
    onlyif => "/usr/bin/groups ${user}",
    unless => "/usr/bin/groups ${user} | /bin/grep -E ' ${group}( |$)'",
  }
}
