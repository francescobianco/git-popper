

build:
	@echo "Building..."
	@mush build --release

push:
	@git add .
	@git commit -am "New release!"
	@git push


test-init: build
	@cd tests/fixtures/simple-local && ../../../bin/git-popper init
