# Generate PDF of document using command specified in $lualatex variable
$pdf_mode = 4;
# LuaLaTeX command
$lualatex = 'lualatex --shell-escape --interaction=nonstopmode --halt-on-error --file-line-error %O %S';

# Set maximum number of runs to 10 
$max_repeat = 10;

# Only delete .bbl files if .bib files are present
# $bibtex_use = 1;

# Additional files to delete when issuing -C
$clean_full_ext = "slnc lol loalg lolst aux* tdo for*";