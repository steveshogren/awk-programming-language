BEGIN {
    fcnCnt = split("close system atan2 sin cos rand srand match sub gsub" , fcns)
    varCnt = split( "ARGC ARGV FNR RSTART RLENGTH SUBSEP", vars)
    keyCnt = split("do delete function return", keys)
}
     { line = $0 }
/"/  { gsub(/"([^"]|\\")*"/ , "", line)  }
/\// { gsub(/\/([^\/]|\\\/)+\//, "", line) }
/#/  { sub(/#.*/, "", line) }

{
    # n = split(line, words, "[^A-Za-z0-9_]+") # into words
    for ( i = 1; i <= fcnCnt; i++) {
        if (line ~ fcns[i])
            warn(fcns[i] " is now a built-in function")
    }
    for ( i = 1; i <= varCnt; i++) {
        if (line ~ vars[i])
            warn(vars[i] " is now a built-in variable")
    }
    for ( i = 1; i <= keyCnt; i++) {
        if (line ~ keys[i])
            warn(keys[i] " is now a keyword")
    }
}
function warn(s) {
    sub(/^[ \t]*/, "")
    printf("file %s, line %d: %s\n\t%s\n", FILENAME, FNR, s, $0)
}
