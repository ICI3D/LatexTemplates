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
## resources/cariTemplate.pdf

## This is terrible (keeps banner)
Ignore += sponsors.pdf
sponsors.pdf: resources/cariTemplate.pdf Makefile
	pdfjam --papersize '{29.7cm,21cm}' $< 8 --outfile $@
## resources/sponsors.png

######################################################################

## Make a sponsor bar by cropping the template file
Sources += template.pdf

## 2025 Template not usable, suppress the bottom part from ici3dClose.tex
## If template is updated, put new template here and grab the bottom of the correct page
Ignore += newsponsors.pdf
newsponsors.pdf: template.pdf Makefile
	pdfjam --landscape $< 3 -o /dev/stdout | \
	pdfcrop -margins "0 -542 0 0" - $@

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
