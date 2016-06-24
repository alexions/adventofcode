package main

import (
    "fmt"
    "os"
    "io/ioutil"
    c "./character"
)

func main() {
    file_path := os.Args[1]
    content, _ := ioutil.ReadFile(file_path)

    santa := c.NewCharacter()

    for _, direction := range content {
        santa.Move(string(direction))
    }

    fmt.Printf("Houses with presents (only Santa): %d\n", len(santa.GetMap()))

    santa, robot := c.NewCharacter(), c.NewCharacter()
    for i, direction := range content {
        if i % 2 == 0 {
            santa.Move(string(direction))
        } else {
            robot.Move(string(direction))
        }
    }

    santa_map := santa.GetMap()
    robot_map := robot.GetMap()
    for k, v := range robot_map {
        santa_map[k] = v
    }

    fmt.Printf("Houses with presents (Santa with robot): %d\n", len(santa_map))
}
