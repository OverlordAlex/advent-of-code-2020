package main

import (
    "fmt"
    "io/ioutil"
    "strconv"
    "strings"
)

func main() {
    var lines []int
    var preamble int = 25

    dat, _ := ioutil.ReadFile("in.9")

    for _, item := range strings.Split(string(dat), "\n") {
        item, _ := strconv.Atoi(item)
		lines = append(lines, item)
	}

    var last []int
    var cache map[int]int
    cache = make(map[int]int)

    last, lines = lines[:preamble], lines[preamble:]

    for i := 0; i < preamble; i++ {
        cache[last[i]] = last[i]
	}

    for _, item := range lines {
        var found bool = false
        for _, potential := range last {
            var diff int = potential - item
            if (diff < 0) {
                diff = -diff
            }
            _, ok := cache[diff]
            if (ok) {
                found = true
                break
            }
        }

        if (!found) {
            // part1
            fmt.Println(item)
            break
        }

        cache[item] = item
        delete(cache, last[0])
        last = append(last[1:], item)
    }
}
