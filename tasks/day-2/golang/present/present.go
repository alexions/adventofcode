package present

import (
    "sort"
)

type Present struct {
    Length, Width, Height int
}

func (p Present) GetSquare() int {
    side_a := p.Length * p.Width
    side_b := p.Width * p.Height
    side_c := p.Height * p.Length
    
    sides := []int{side_a, side_b, side_c}
    sort.Ints(sides)
    
    return 2 * (side_a + side_b + side_c) + sides[0]
}

func (p Present) GetRibonLenght() int {
    sides := []int{p.Length, p.Width, p.Height}
    sort.Ints(sides)
 
    ribon := 2 * (sides[0] + sides[1])
    bow := p.Length * p.Width * p.Height
    
    return bow + ribon
}