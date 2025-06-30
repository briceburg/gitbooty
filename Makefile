INSTALL_DIR := /usr/local/bin
BIN_DIR := $(CURDIR)/bin

install:
	@for f in $(BIN_DIR)/*; do \
        name=$$(basename $$f); \
        ln -sf "$$f" "$(INSTALL_DIR)/$$name"; \
        echo "Linked $$f -> $(INSTALL_DIR)/$$name"; \
    done