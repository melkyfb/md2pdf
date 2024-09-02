# Makefile for compiling md2pdf.py to a Linux command

# Set the Python interpreter
PYTHON := python3

# Set the source file
SRC := md2pdf.py

# Set the requirements file
REQ := requirements.txt

# Set the output directory (adjust this path as needed)
INSTALL_DIR := /usr/local/bin

# Set the output executable name
EXEC := md2pdf

# Default target
all: install

# Install the script and requirements
install:
	@echo "Installing md2pdf..."
	@which pip3 > /dev/null || (echo "Installing pip..." && sudo apt-get update && sudo apt-get install -y python3-pip)
	@if [ -f /etc/debian_version ]; then \
		echo "Installing dependencies for Debian-based systems..."; \
		sudo apt-get install -y libpango1.0-dev libcairo2-dev libgdk-pixbuf2.0-dev libglib2.0-dev; \
	elif [ -f /etc/fedora-release ]; then \
		echo "Installing dependencies for Fedora-based systems..."; \
		sudo dnf install -y pango-devel cairo-devel gdk-pixbuf2-devel glib2-devel; \
	elif [ "$(uname)" = "Darwin" ]; then \
		echo "Installing dependencies for macOS..."; \
		brew install pango cairo gdk-pixbuf; \
	else \
		echo "Unsupported system. Please install the required dependencies manually."; \
	fi
	@$(PYTHON) -m pip install -r $(REQ)
	@$(PYTHON) -m py_compile $(SRC)
	@mkdir -p $(INSTALL_DIR)
	@cp $(SRC) $(INSTALL_DIR)/$(EXEC)
	@cp style.css $(INSTALL_DIR)/
	@echo "Copied style.css to $(INSTALL_DIR)"
	@chmod +x $(INSTALL_DIR)/$(EXEC)
	@sed -i '1s|^|#!/usr/bin/env python3\n|' $(INSTALL_DIR)/$(EXEC)
	@echo "Installation complete. You can now use 'md2pdf' command."

# Uninstall the script
uninstall:
	@echo "Uninstalling md2pdf..."
	@rm -f $(INSTALL_DIR)/$(EXEC)
	@echo "Uninstallation complete."

# Clean compiled Python files
clean:
	@echo "Cleaning up..."
	@rm -f *.pyc
	@rm -rf __pycache__

.PHONY: all install uninstall clean
