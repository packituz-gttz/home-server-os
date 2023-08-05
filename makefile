# Wraps common operations for project

# Set more sensible defaults
SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules


ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

# Target configs
.DEFAULT_GOAL := help

build: ## Builds box and uploads.
> @packer build --force .

check:  ## Validates and formats packer file.
> @packer validate . && packer fmt .

help:  ## Displays help.
> @grep -E '^[a-zA-Z_-]+[0-9]*:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
