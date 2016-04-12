package main

import (
    "fmt"
    "os"
    "io/ioutil"
    "./present"
    "strings"
    "strconv"
)

func main() {
    var total_square_feets, ribon_length int

    file_path := os.Args[1]
    content, _ := ioutil.ReadFile(file_path)
    dimensions := strings.Split(string(content), "\n")

    for _, dimension := range dimensions {
        size := strings.Split(string(dimension), "x")
        width, _ := strconv.Atoi(size[0])
        length, _ := strconv.Atoi(size[1])
        height, _ := strconv.Atoi(size[2])
        pres := present.Present{width, length, height}
        ribon_length += pres.GetRibonLenght()
        total_square_feets += pres.GetSquare()
    }

    fmt.Printf("total square feets: %d\nRibon length: %d\n", total_square_feets, ribon_length)
}