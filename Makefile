test:
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
