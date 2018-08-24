
# sorts : as separator, +0 -1 uses first column for primary sort +4rn uses fifth column as secondary
BEGIN { FS = "\t" }
{ printf("%s:%s:%d:%d:%.1f\n", $4, $1, $3, $2, 1000*$3/$2) | "sort -t: +0 -1 +4rn" }
