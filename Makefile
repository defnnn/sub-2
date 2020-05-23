# Copyright 2020 Authors of sub
# SPDX-License-Identifier: Apache-2.0

SHELL := /bin/bash

.PHONY: docs test

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
	@env PATH="$(PWD)/bin:$(PWD)/test:$(PATH)" $(MAKE) test-inner

test-inner:
	@time example
	@time example -n defn
	@time example --name defn
	@time example --help
	@echo
	@time example a
	@echo
	@time example a b
	@echo
	@time example a b c
	@echo
	@time example a b c d
	@time example a b c d comment
	@time example a b c d --help
