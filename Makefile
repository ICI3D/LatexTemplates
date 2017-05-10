# LatexTemplates
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget gptarget acrtarget: example.pdf 

##################################################################


# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.tex)

Sources += eight.jpg ICI3D_logo.png AIMS.jpg uga.png sacema.png

example.pdf: example.tex

example.pdf: bulletspace.tex ici3dClose.tex ici3dTemplate.tex ici3dTitle.tex

## This is slightly wrong, but very convenient
Sources += rights.png noncom.png attrib.png

rights.png:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/CC_some_rights_reserved_new_2.svg/1000px-CC_some_rights_reserved_new_2.svg.png"

noncom.png:
	wget -O $@ "http://creativecommons.org.nz/wp-content/uploads/2014/04/nc.large_.png"

attrib.png:
	wget -O $@ "http://creativecommons.org.nz/wp-content/uploads/2014/04/by.large_1-150x150.png"

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
-include $(ms)/newlatex.mk
