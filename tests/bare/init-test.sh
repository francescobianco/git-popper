#!/usr/bin/env bash

echo "===> Test: init-test"

rm -f tests/fixtures/fresh-local/.gitpopper
rm -fr tests/fixtures/fresh-remote
git pull --no-rebase
git add .
git commit -am "test"
git push

cd tests/fixtures/fresh-local || exit 1
../../../bin/git-popper pull
rm -f .gitpopper

{
  echo "https://francescobianco@github.com/francescobianco/git-popper"
  echo "tests/fixtures/fresh-remote"
} | ../../../bin/git-popper init

echo "ADD test.txt" >> .gitpopper

../../../bin/git-popper sync
