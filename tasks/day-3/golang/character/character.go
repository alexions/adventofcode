package character

type position struct {
    x, y int
}

type Character struct {
    Position position
    Map map[position]bool
    Directions map[string]position
}

func NewCharacter() *Character {
    c := new(Character)
    c.Map = make(map[position]bool)
    c.Position = position{x: 0, y: 0}
    c.Directions = map[string]position{
        "^": {x: 0, y: -1},
        "v": {x: 0, y: 1},
        "<": {x: -1, y: 0},
        ">": {x: 1, y: 0},
    }

    return c
}

func (c *Character) Move(direction string) {
    c.Position.x += c.Directions[direction].x
    c.Position.y += c.Directions[direction].y
    c.Map[c.Position] = true
}

func (c *Character) GetMap() map[position]bool {
    return c.Map
}
