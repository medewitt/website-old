
.PHONY: all

# Usually, only these lines need changing
RDIR= .
#DOCS= ./docs

# List files for dependencies
#DOCS_RFILES := $(wildcard $(DOCS)/*.html)
DOCS_RFILES := $(wildcard $(RDIR)/*.html)
RMD_FILES := $(wildcard $(RDIR)/*.Rmd)

# Indicator files to show R file has run
DOCS_OUT_FILES:= $(DOCS_RFILES:.Rmd=.html)

# Run everything
all: $(DOCS_OUT_FILES) 

# Compile Report
$(RDIR)/%.html: $(RDIR)/%.Rmd
	@echo compiling report
	-Rscript -e  'rmarkdown::render_site("$<")'

build:
	-Rscript -e  'purrr::map(fs::dir_ls( glob = "*.Rmd"), rmarkdown::render_site)'
	Rscript -e 'source("_add_banner.R")'