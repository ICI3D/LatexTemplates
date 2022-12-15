## This is LatexTemplates, a screens project directory

current: target
-include target.mk

# include makestuff/perl.def

######################################################################

vim_session:
	bash -cl "vmt"

Sources += $(wildcard *.tex)

Sources += eight.jpg bar.pdf sponsors.pdf top.pdf

example.pdf: example.tex

######################################################################

## Make a sponsor bar by cropping the template file
Sources += template.pdf

Ignore += newsponsors.pdf
newsponsors.pdf: template.pdf Makefile
	pdfjam --landscape $< 4 -o /dev/stdout | \
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

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
