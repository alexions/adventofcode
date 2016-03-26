package main

import (
    "fmt"
    "os"
    "io/ioutil"
)

func main() {
    var level, basemant_level int
    file_path := os.Args[1]
    content, _ := ioutil.ReadFile(file_path)

    for index, elm := range content {
        if elm == '(' {
            level++
        } else if elm == ')' {
            level--
        }

        if level < 0 && basemant_level == 0 {
            basemant_level = index + 1
        }
    }

    fmt.Printf("Level: %d\nBasemant: %d\n", level, basemant_level)
}