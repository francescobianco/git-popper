

build:
	@echo "Building..."
	@mush build --release

push:
	@git add .
	@git commit -am "New release!" || true
	@git push


test-init: build
	@cd tests/fixtures/simple-local && ../../../bin/git-popper init

test-sync: build
	@rm -fr $$HOME/.git-popper/cache || true
	@cd tests/fixtures/simple-local && ../../../bin/git-popper sync
	@tree $$HOME/.git-popper/cache
