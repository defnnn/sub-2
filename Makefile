test:
	@env PATH="$(PATH):$(PWD)/bin:$(PWD)/exec" $(MAKE) test-inner

test-inner:
	@bin/example
	@bin/example a
	@bin/example a b
	@bin/example a b comment
