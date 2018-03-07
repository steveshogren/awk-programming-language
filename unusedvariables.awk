BEGIN {
    asplit("close system atan2 sin cos rand srand " \
            "match sub gsub" \
           "ARGC ARGV FNR RSTART RLENGTH SUBSEP"    \
           "do delete function return", keys)
}
     { line = $0 }
     /"/  { gsub(/"([^"]|\\")*"/ , "", line)  }
     /\// { gsub(/\/([^\/]|\\\/)+\//, "", line) }
     /#/  { sub(/#.*/, "", line) }

{
    n = split(line, words, "[^A-Za-z0-9_]+") # into words
    for ( i = 1; i <= n; i++) {
        if (words[i] in keys)
            varCounts[words[i]]++
    }
    for ( i = 1; i <= length(varCounts); i++) {
        if (varCounts[i] == 1)
            warn(varCounts[i] " is unused")
    }
}

function asplit(str, arr) { # make an assoc array from str
    n = split(str, temp)
    for (i = 1; i <= n; i++)
        arr[temp[i]]++
    return n
}

function warn(s) {
    sub(/^[ \t]*/, "")
    printf("file %s, line %d: %s\n\t%s\n", FILENAME, FNR, s, $0)
}


function unused() {
    return 1
}
