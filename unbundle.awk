$1 != prev { close(prev); prev = $1 }
           { print substr($0, index($0, " ") + 1) > $1}
