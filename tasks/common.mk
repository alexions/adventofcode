.PHONY: all run

INPUT_FILE = $(shell pwd)/input.txt

all:
	@echo "'make input' - Create the input.txt file."
	@echo "'make run ENV' - Run specified env"
	@echo "    ENV = erl | go | node | php | python"
	@echo "'make run all' - Run all envs"

clean:
	find . -type f -name "*.dump" -exec rm -f {} \;
	find . -type f -name "*.beam" -exec rm -f {} \;

check-input:
	@if [ ! -f input.txt ]; then\
		echo >&2 "Input file was no found. Create input.txt first.";\
		false;\
	fi

input:
	@echo "Paste your text and press 'Enter' and 'Ctrl + D' then to save the file"
	@cat > input.txt

run: check-input run-$(word 2, $(MAKECMDGOALS))

run-php:
	php php/index.php $(INPUT_FILE)

run-erl:
	erlc -o erlang erlang/*.erl
	erl -pa erlang -noshell -s main start $(INPUT_FILE) -s init stop

run-go:
	go run golang/main.go $(INPUT_FILE)

run-node:
	coffee nodejs/index.coffee $(INPUT_FILE)

run-python:
	python3 python/main.py $(INPUT_FILE)

%:
	@: