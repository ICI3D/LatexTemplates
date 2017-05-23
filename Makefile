# LatexTemplates
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget gptarget acrtarget: example.pdf 

##################################################################

# make files

Sources = Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.tex)

Sources += eight.jpg bar.pdf sponsors.pdf top.pdf

example.pdf: example.tex

## This is slightly wrong (because I have make rules and shouldn't need to commit)
Sources += rights.png noncom.png attrib.png

rights.png:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/CC_some_rights_reserved_new_2.svg/1000px-CC_some_rights_reserved_new_2.svg.png"

noncom.png:
	wget -O $@ "http://creativecommons.org.nz/wp-content/uploads/2014/04/nc.large_.png"

attrib.png:
	wget -O $@ "http://creativecommons.org.nz/wp-content/uploads/2014/04/by.large_1-150x150.png"

######################################################################

## Weirdness

# Want things to work here, but they need to be set up to work when this is a subdirectory

## Why is this sort of chaining and sort of not?
LatexTemplates/%: % LatexTemplates 
	$(copy)

LatexTemplates:
	$(mkdir)

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
-include $(ms)/flextex.mk
