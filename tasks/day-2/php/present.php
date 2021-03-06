<?php

class Present
{
    protected $length = 0;
    protected $width = 0; 
    protected $height = 0;

    function __construct(int $length, int $width, int $height)
    {
        $this->length = $length;
        $this->width = $width;
        $this->height = $height;
    }

    public function getSquare(): int
    {
        $side_a = $this->length * $this->width;
        $side_b = $this->width * $this->height;
        $side_c = $this->height * $this->length;

        $min_side = min($side_a, $side_b, $side_c);

        return 2 * ($side_a + $side_b + $side_c) + $min_side;
    }

    public function getRibonLenght(): int
    {
        $sides = [$this->length, $this->width, $this->height];
        sort($sides);

        $bow = $this->length * $this->width * $this->height;
        $ribon = ($sides[0] + $sides[1]) * 2;

        return $bow + $ribon;
    }
}