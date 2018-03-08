BEGIN {
    asplit("close system atan2 sin cos rand srand " \
            "match sub gsub" \
           "ARGC ARGV FNR RSTART RLENGTH SUBSEP"    \
           "do delete function return END BEGIN printf gsub", keys)
}
     { line = $0 }
     /"/  { gsub(/"([^"]|\\")*"/ , "", line)  }
     /\// { gsub(/\/([^\/]|\\\/)+\//, "", line) }
     /#/  { sub(/#.*/, "", line) }

{
    n = split(line, words, "[^A-Za-z0-9_]+") # into words
    unusedVar = 1
    varCounts["a"] = 1
    for ( i = 1; i <= n; i++) {
        if ((!(words[i] in keys)) && words[i] !~ /[0-9]+/)
            varCounts[words[i]]++
    }
}

END {
    for ( i in varCounts) {
        # printf("varCounts[%s] = %d\n", i, varCounts[i])
        if (varCounts[i] == 1)
            warn(i " is unused")
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
    printf("%s\n\t\n", s)
}


function unusedFun() {
    return 1
}
