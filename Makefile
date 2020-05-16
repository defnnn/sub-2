SHELL := /bin/bash

.PHONY: docs

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

all: # Run everything except build
	$(MAKE) fmt
	$(MAKE) lint
	$(MAKE) docs

fmt: # Format drone fmt
	@echo
	drone exec --pipeline $@

lint: # Run drone lint
	@echo
	drone exec --pipeline $@

docs: # Build docs
	@echo
	drone exec --pipeline $@

edit: # Live edit docs
	docker-compose -f docker-compose.docs.yml pull docs
	docker-compose -f docker-compose.docs.yml run --rm docs

test: # Run tests
	@env PATH="$(PATH):$(PWD)/bin:$(PWD)/exec" $(MAKE) test-inner

test-inner:
	@time bin/example
	@time bin/example -n defn
	@time bin/example --name defn
	@time bin/example --help
	@time bin/example a
	@time bin/example a b
	@time bin/example a b comment
	@time bin/example a b --help
