.PHONY: all run

INPUT_FILE = $(shell pwd)/input.txt

all:
	@echo "'make input' - Create the input.txt file."
	@echo "'make run ENV' - Run specified env"
	@echo "    ENV = erl | go | node | php | python"
	@echo "'make run all' - Run all envs"

check-input:
	@if [ ! -f input.txt ]; then\
		$(MAKE) input;\
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

%:
	@: