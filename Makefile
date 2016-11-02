.PHONY: help clean build image run release image docker

APP_NAME ?= distillery-test
VERSION ?= `cat mix.exs | grep "version:" | cut -d '"' -f2`

help:
	@echo "$(APP_NAME):$(VERSION)"
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

clean: ## Clean build artifacts
	mix clean

build: ## Build the app
	mix compile

run: ## Run the app
	mix run --no-halt

release: ## Build release of the app
	MIX_ENV=prod mix release --verbose --env=prod

image: ## Build docker image
	rm -rf deps/distillery
	rm -rf deps/conform
	cp -R ../distillery deps/distillery
	cp -R ../conform deps/conform
	docker build --force-rm --rm -t $(APP_NAME):$(VERSION) -f Dockerfile.alpine .

docker: ## Build docker image and run it
	docker run --rm -p 5000:5000 -it $(APP_NAME):$(VERSION)
