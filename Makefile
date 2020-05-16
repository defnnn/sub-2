test:
	@env PATH="$(PATH):$(PWD)/bin:$(PWD)/exec" bin/example --help

test-inner:
	@bin/example
	@bin/example -n defn
	@bin/example --name defn
	@bin/example --help
	@bin/example a
	@bin/example a b
	@bin/example a b comment
