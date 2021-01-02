# Advent of Code
This is my attempt to solve as many problems from the 2020 AoC in as many languages as possible, as a form of advanced "Hello World!"

> Advent of Code is an Advent calendar of small programming puzzles for a variety of skill sets and skill levels that can be solved in any programming language you like.
https://adventofcode.com/2020/

Each program is self-contained. The language chosen, the presumed website, and some thoughts on the language are included below.

## P1: Souffle [https://souffle-lang.github.io/]
    Some unnecessary processing going on here.
    Definitely don't know enough about logic or Souffle to tighten it up
---

## P2: Python 2.7 [https://www.python.org/]
    Wrote this while tired, not sure why the ^ works here
    Unsure if I should allow myself Python3 as a "different" language
---

## P3: Nim [https://nim-lang.org/]
    Pythonish with compiled speed? So far really liking it
    Run with `nim -c --run`.
---

## P4: Bash [https://www.gnu.org/software/bash/]
    Good ol' ugly bash.
    Something wrong in the regex, but it passed all my tests
---

## P5: F# [https://fsharp.org/]
    Functional, but at what cost?
    So many bad practices here, but F# is still my favourite functional lang
---
 
## P6: Javascript [https://www.javascript.com/ ?? Is this the official site? looks like URL squatting spam]
    Not bad, but incredibly inconsistent function names (eg length, vs size)
    Unhelpful error messages most of the time
---

## P7: AWK + Prolog [https://www.gnu.org/software/gawk/] [https://www.swi-prolog.org/]
    AWK was more painful than it should have been due to some recursion
    Prolog was hacked together, and then refined with a blog post I found. I take no credit, especially for part2
---

## P8: Kotlin [https://kotlinlang.org/]
    Used Vim, so definitely suboptimal. Hoping this is the multi-day challenge so that I can reuse Kotlin some more
    Brute-forced part 2 - I still believe there is an elegant solution out there
---

## P9: Go [https://golang.org/]
    Honestly made me hate golang. I could see this being okay for a proper project, but probably the worst thing for iterative on-the-fly development
    Part 2 was different enough that I split the program, however it probably could probably be done easier with sorting
---

## P10: Dart [https://dart.dev/]
    Really enjoyed this - nothing special, just a nice contrast to Go. Motivated me to look at Flutter for future projects.
    Part 2 was a neat little DP problem - classical path addition
---

## P11: Ruby [https://www.ruby-lang.org/]
    Straightforward, but I actually miss some punctuation. Similar to Python, and I can see why it's so popular.
    Did Part2 the really slow brute-force way, however when I tried the smart way I was debugging for 20 minutes trying to find some subtle bug, so I probably came out even in the end..
---    

## P12: Swift [https://swift.org/]
    Some really weird edge cases and argument requirements Used Swift 5 and all the online documentation/forums are for 2/3, leading to a lot of headaches. Also managed to get a core dump (I suspect by multiplying two too large numbers together). The error was unhelpful, plus setting up vim syntax highlighting was way more difficult than it should have been.
    Overall not totally happy - Dart was more fun
---

## P13: C [?? old enough that there isnt a website lol https://en.wikipedia.org/wiki/C_(programming_language)]
    C is better to write than GoLang - gcc gives amazing warning/error messages these days. At least that's how I found it - after not touching it since university it was actually really nice to do it again.
    Skipped part2 - the brute-force method is too slow, and I'm too lazy to work out the LCM or factorisation or whatever the actual solution entails
---

## P14: PHP [https://www.php.net/]
    The PHP documentation gives instructions on how to install PHP5; the current version is 8. I think that tells you all you need to know about PHP. After using it I can see why it once dominated the Web, but $man, do $those $variables $get $tiring.
    Still have to come back to part2 - should probably build a prefix tree to solve it but laaazy
---



