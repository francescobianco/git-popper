## =====
## Build
## =====

build:
	@echo "Building..."
	@mush build --release

install: build
	@mush install --path .

## =======
## Release
## =======

push: build
	@git add .
	@git commit -am "New release!" || true
	@git push

release: push

## =====
## Tests
## =====

test-init: build
	@bash tests/bare/init-test.sh

test-sync: build
	@rm -fr $$HOME/.git-popper/cache || true
	@cd tests/fixtures/simple-local && ../../../bin/git-popper sync
	@tree $$HOME/.git-popper/cache
