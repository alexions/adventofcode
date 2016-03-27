import sys

file_path = sys.argv[1]

file = open(file_path)
content = file.read()

level, basemant = 0, 0

for index, char in enumerate(content):
	if char not in ('(', ')'):
		continue

	level = level + 1 if char == '(' else level - 1
	if not basemant and level < 0:
		basemant = index + 1

print('Level: {}\nBasemant: {}'.format(level, basemant))