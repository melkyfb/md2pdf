# md2pdf - Markdown to PDF Converter

md2pdf is a command-line tool that converts Markdown files to PDF format. It's designed to be simple, efficient, and easy to use for developers and writers who prefer working with Markdown but need PDF output.

## Features

- Convert Markdown files to PDF with a single command
- Maintain formatting and structure of the original Markdown
- Support for basic Markdown syntax
- Cross-platform compatibility (Linux, macOS, Windows)

## Installation

### Installation

#### Using Makefile

To install md2pdf using the provided Makefile, follow these steps:

1. Ensure you have `make` installed on your system. You can check by running:
   ```
   make --version
   ```

2. Open a terminal and navigate to the md2pdf directory:
   ```
   cd path/to/md2pdf
   ```

3. Run the installation command:
   ```
   sudo make
   ```

   This command will:
   - Install necessary system dependencies
   - Install Python requirements
   - Compile the Python script
   - Copy the executable to /usr/local/bin
   - Make the script executable

4. After installation, you can use md2pdf from anywhere in your terminal:
   ```
   md2pdf -i input.md -o output.pdf
   ```

Note: The installation requires sudo privileges to install system dependencies and copy the executable to /usr/local/bin.

#### Manual
1. Clone the repository:
   ```
   git clone https://github.com/melkyfb/md2pdf.git
   cd md2pdf
   ```

2. Install the required dependencies:
   ```
   pip install -r requirements.txt
   ```

3. Make the script executable:
   ```
   chmod +x md2pdf.py
   ```

4. (Optional) Add the script to your PATH for easier access:
   ```
   sudo cp md2pdf.py /usr/local/bin/md2pdf
   ```

   Or, for macOS users:
   ```
   sudo cp md2pdf.py /usr/local/bin/md2pdf
   ```

Now you can use the `md2pdf` command from anywhere in your terminal.



## Usage

To use md2pdf, follow these steps:

1. Open your terminal.

2. Navigate to the directory containing your Markdown file.

3. Run the following command:

   ```
   md2pdf -i input.md -o output.pdf
   ```

   Replace `input.md` with the name of your Markdown file, and `output.pdf` with your desired output PDF filename.

4. If you want to use the default output filename (same as input but with .pdf extension), you can omit the `-o` option:

   ```
   md2pdf -i input.md
   ```

5. For more information on available options, use the help command:

   ```
   md2pdf --help
   ```

This will display all available options and their descriptions.

Note: Make sure you have installed md2pdf correctly before using these commands. If you encounter any issues, please refer to the installation instructions above.


