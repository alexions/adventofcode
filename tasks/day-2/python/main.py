import sys, present

file_path = sys.argv[1]
total_square_feets, ribon_length = 0, 0

with open(file_path, 'r') as presents:
    for present_params in presents:
        length, width, height = map(int, present_params.split('x'))
        p = present.Present(length, width, height)
        
        total_square_feets += p.get_square()
        ribon_length += p.get_ribon_lenght()

print('Total square feets: {}\nRibon length: {}'.format(total_square_feets, ribon_length))