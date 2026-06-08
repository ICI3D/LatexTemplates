# This is LatexTemplates, a screens project directory

current: target
-include target.mk

######################################################################

vim_session:
	bash -ic "vmt"

Sources += $(wildcard *.tex)

Sources += eight.jpg bar.pdf top.pdf

######################################################################

## this is old and intended for others
example.pdf: example.tex

## dushoff examples are called setup and are in individual talk directories, which seems silly, maybe link back to here

mirrors += resources

## included in ici3dClose.tex
Ignore += sponsors.pdf
## pdfinfo resources/cariTemplate.pdf
## Page size:       720 x 540 pts

resources/sponsors.pdf: resources/cariTemplate.pdf
	pdfjam --landscape $< 8 -o $@

######################################################################

## Make a sponsor bar by cropping the template file
Sources += template.pdf

######################################################################

## This is slightly wrong (because I have make rules and shouldn't need to commit)
Sources += rights.png noncom.png attrib.png

rights.png:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/CC_some_rights_reserved_new_2.svg/1000px-CC_some_rights_reserved_new_2.svg.png"

noncom.png:
	wget -O $@ "http://creativecommons.org.nz/wp-content/uploads/2014/04/nc.large_.png"

attrib.png:
	wget -O $@ "http://creativecommons.org.nz/wp-content/uploads/2014/04/by.large_1-150x150.png"

######################################################################

### Curate commands that I like

Sources += comments.tex

######################################################################

## Workshop settings

Sources += mmed.txt.format daidd.txt.format qmee.txt.format plain.txt.format

######################################################################

### Makestuff

Sources += Makefile README.md

## Sources += content.mk
## include content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

ms = makestuff
-include makestuff/os.mk

-include makestuff/mirror.mk
-include makestuff/texj.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
