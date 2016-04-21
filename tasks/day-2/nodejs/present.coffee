class Present
    constructor: (@length, @width, @height) ->
        
    getSquare: ->
        side_a = @length * @width
        side_b = @width * @height
        side_c = @length * @height
        
        min_side = Math.min(side_a, side_b, side_c)
        
        (side_a + side_b + side_c) * 2 + min_side
    
    getRibonLength: ->
        sides = [@length, @width, @height]
        [side_a, side_b] = sides.sort((a, b) -> a - b)
        
        (side_a + side_b) * 2 + @length * @width * @height  

module.exports =
    "Present": Present