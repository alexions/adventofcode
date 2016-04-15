class Present:
    def __init__(self, length, width, height):
        self.length, self.width, self.height = length, width, height

    def get_square(self):
        side_a = self.length * self.width
        side_b = self.width * self.height
        side_c = self.height * self.length

        min_side = min(side_a, side_b, side_c)

        return 2 * (side_a + side_b + side_c) + min_side;

    def get_ribon_lenght(self):
        sides = [self.length, self.width, self.height]
        sides.sort();

        bow = self.length * self.width * self.height
        ribon = (sides[0] + sides[1]) * 2

        return bow + ribon