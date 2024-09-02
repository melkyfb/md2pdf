#!/usr/bin/env python3

import sys
import argparse
import markdown
from weasyprint import HTML
import os

def parse_arguments():
    parser = argparse.ArgumentParser(description="Convert Markdown to PDF")
    parser.add_argument("-i", "--input_file", help="Path to the input Markdown file", required=True)
    parser.add_argument("-o", "--output_file", help="Path to the output PDF file (default: input_file_name.pdf)")
    args = parser.parse_args()
    
    if not args.input_file.lower().endswith('.md'):
        raise ValueError("Input file must be a Markdown file with .md extension")
    
    if args.output_file is None:
        input_name = os.path.splitext(args.input_file)[0]
        args.output_file = f"{input_name}.pdf"
    
    return args

def read_markdown_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        return f.read()

def convert_markdown_to_html(markdown_content):
    return markdown.markdown(markdown_content)

def create_full_html(html_content):
    return f"""
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        {html_content}
    </body>
    </html>
    """

def convert_html_to_pdf(html_content, output_file):
    script_dir = os.path.dirname(os.path.abspath(__file__))
    css_file = os.path.join(script_dir, 'style.css')
    
    if os.path.exists(css_file):
        HTML(string=html_content).write_pdf(output_file, stylesheets=[css_file])
    else:
        print(f"Warning: style.css not found in {script_dir}. Proceeding without custom styles.")
        HTML(string=html_content).write_pdf(output_file)


def main():
    args = parse_arguments()
    markdown_content = read_markdown_file(args.input_file)
    html_content = convert_markdown_to_html(markdown_content)
    full_html = create_full_html(html_content)
    convert_html_to_pdf(full_html, args.output_file)
    print(f"PDF file created: {args.output_file}")

if __name__ == "__main__":
    main()
