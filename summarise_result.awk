$1 == "p:" {printf "%f ", $2}
$1 == "altruist_count:" {printf "%d ", $2}
$1 == "ip_vars:" {printf "%d ", $2}
$1 == "total_score:" {printf "%f\n", $2}
