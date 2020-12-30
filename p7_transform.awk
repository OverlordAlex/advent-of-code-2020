BEGIN {
    ## HEAVILY relied on this site to fix my shitty prolog, awk is all me (+google)
    # https://medium.com/musedev/advent-of-code-day-7-in-prolog-bf4e0db5f103
} {
    match($0, /(.+) bags contain no other bags/, empty)
   
    if (empty[0]) {
        gsub(/ /, "_", empty[1])
        print "contains(" empty[1] ", [])."
    } else {
        str=$0

        match(str, /(.+) bags contain .+/, parsed)
        gsub(/ /, "_", parsed[1])
        finalstr = "contains(" parsed[1] ", ["

        sub(/(.+ bags?) contain /, "", str)
        match(str, / ?([0-9]+) ([a-z ]+) bags?[.,]/, bags)
        while (bags[0]) {
            sub(/ ?[0-9]+ [a-z ]+ bags?[.,]/, "", str)
            
            gsub(/ /, "_", bags[2])
            finalstr = finalstr bags[2]
            for (i = 2; i <= bags[1]; i += 1) {
                finalstr = finalstr ", " bags[2]
            }

            match(str, / ?([0-9]+) ([a-z ]+) bags?[.,]/, bags)
            if (bags[0]) {
                finalstr = finalstr ", "
            }
        }

        finalstr = finalstr "])."
        print finalstr
    }
}
END {
    print "bag_contains(X, Y) :- contains(X, Z), member(Y, Z)."
    print ":- table transitive_contains/2."
    print "transitive_contains(X, Y) :- bag_contains(X, Y)."
    print "transitive_contains(X, Y) :- bag_contains(X, Z), transitive_contains(Z, Y)."
#   findall(X, transitive_contains(X, shiny_gold), Solutions).
#   findall(X, transitive_contains(X, shiny_gold), Solutions), length(Solutions, Len).
    print "expand([], [])."
    print "expand(BagList, BagListContents) :-"
    print "     BagList = [Bag|RestOfBagList],"
    print "     expand(RestOfBagList, RestOfBagListContents),"
    print "     contains(Bag, BagContents),"
    print "     append(BagContents, RestOfBagListContents, BagListContents)."
    print "tracing_transitive_expand(X, [], []) :- expand(X, [])."
    print "tracing_transitive_expand(X, Y, TRACE) :-"
    print "     expand(X, Z),"
    print "     tracing_transitive_expand(Z, Y, TRACE1),"
    print "     append(Z, TRACE1, TRACE)."
    print "size(X, Z) :-"
    print "     tracing_transitive_expand(X, [], TRACE),"
    print "     length(TRACE, Z)."
#   size([shiny_gold], result).
}
