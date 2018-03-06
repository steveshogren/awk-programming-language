BEGIN {
    asplit("close system atan2 sin cos rand srand " \
           "match sub gsub" , fcns)
    asplit( "ARGC ARGV FNR RSTART RLENGTH SUBSEP", vars)
    asplit("do delete function return", keys)
}
     { line = $0 }
/"/  { gsub(/"([^"]|\\")*"/ , "", line)  }
/\// { gsub(/\/([^\/]|\\\/)+\//, "", line) }
/#/  { sub(/#.*/, "", line) }

{
    n = split(line, words, "[^A-Za-z0-9_]+") # into words
    for ( i = 1; i <= n; i++) {
        if (words[i] in fcns)
            warn(words[i] " is now a built-in function")
        if (words[i] in vars)
            warn(words[i] " is now a built-in variable")
        if (words[i] in keys)
            warn(words[i] " is now a keyword")
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
