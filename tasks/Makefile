include common.mk

day-%:
	@mkdir -p $@/erlang $@/golang $@/nodejs $@/php $@/python
	@touch $@/README.md $@/input.txt
	@touch $@/erlang/main.erl $@/golang/main.go $@/nodejs/index.coffee $@/php/index.php $@/python/main.py
	@echo "include ../common.mk" > $@/Makefile