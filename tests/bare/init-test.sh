#!/usr/bin/env bash

echo "===> Test: init-test"

cd tests/fixtures/fresh-local || exit 1
rm -f .gitpopper

{
  echo "https://francescobianco@github.com/francescobianco/git-popper"
  echo "tests/fixtures/fresh-remote"
} | ../../../bin/git-popper init

#../../../bin/git-popper sync

