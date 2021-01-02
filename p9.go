package main

import (
    "fmt"
    "io/ioutil"
    "strconv"
    "strings"
    "math"
)

func part1() {
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

func part2() {
    var lines []int
    var magicN int = 1398413738 //127

    dat, _ := ioutil.ReadFile("in.9")

    for _, item := range strings.Split(string(dat), "\n") {
        item, _ := strconv.Atoi(item)
		lines = append(lines, item)
	}

    var l int = 0
    var u int = 1
    var sum int =  lines[l] + lines[u]

    for (sum != magicN) {
        if (sum < magicN) {
            u += 1
            sum += lines[u]
        } else if (sum > magicN) {
            sum -= lines[l]
            l += 1
        }
    }

    var min float64 = float64(magicN)
    var max float64 = 0

    for i := l; i < u; i++ {
        min = math.Min(min, float64(lines[i]))
        max = math.Max(max, float64(lines[i]))
    }

    fmt.Println(min)
    fmt.Println(max)
    fmt.Println(int(min + max))
}

func main() {
    part1()
    part2()
}
