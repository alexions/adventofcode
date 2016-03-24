.PHONY: all run

all:
	@echo "'make input' - Create the input.txt file."
	@echo "'make run ENV' - Run specified env"
	@echo "    ENV = erlang | golang | nodejs | php | python"
	@echo "'make run all' - Run all envs"

input:
	@echo "Paste your text and press 'Enter' and 'Ctrl + D' then to save the file"
	@cat > input.txt

run: run-$(word 2, $(MAKECMDGOALS))

run-php:
	@if [ ! -f input.txt ]; then\
		$(MAKE) input;\
	fi
	php php/index.php $(shell pwd)/input.txt

run-erlang:
	@echo "Run Erlang"

%:
	@: