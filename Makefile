
VERSION=3

help:
	venv/bin/python toml_union.py -h


build:
	docker build --target toml_union -t toml-union "."

run:
	docker run -it --rm toml-union

push:
	docker tag toml-union pasaopasen/toml-union:latest
	docker push pasaopasen/toml-union:latest
	docker tag toml-union pasaopasen/toml-union:$(VERSION)
	docker push pasaopasen/toml-union:$(VERSION)

test:
	cd examples; bash docker-test.sh

pytest:
	venv/bin/python -m pytest ./tests
