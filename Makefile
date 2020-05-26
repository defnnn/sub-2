# Copyright 2020 Authors of sub
# SPDX-License-Identifier: Apache-2.0

SHELL := /bin/bash

.PHONY: test

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\w+-]+):[^#]+#\s(.+)$$}' Makefile

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
