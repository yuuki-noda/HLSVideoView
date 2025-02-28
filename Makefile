PRODUCT_FILE_NAME := SwiftTraining.xcodeproj
.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":[^#]*? #| #"}; {printf "%-42s%s\n", $$1 $$3, $$2}'

.PHONY: setup
setup: # Install dependencies and prepared development configuration
	$(MAKE) install-brew
	$(MAKE) install-mint

.PHONY: install-brew
install-brew: # Install brew dependencies
	brew bundle

.PHONY: install-mint
install-mint: # Install mint
	mint bootstrap --overwrite y

.PHONY: format
format:
	mint run swiftformat .