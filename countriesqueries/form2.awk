# Prevent printing the regular line if the prev doesn't match
# and only print the Continent
BEGIN {
    FS=":"
    printf("%-15s %-10s %10s %7s %12s \n", "CONTINENT", "COUNTRY", "POPULATION", "AREA", "POP. DEN.")
}
{
    if ($1 != prev) {
        print $1
        prev = $1
    } else {
        $1 = ""
        printf("%-15s %-10s %7d %10d %10.1f\n", $1,$2,$3,$4,$5)
    }
}
