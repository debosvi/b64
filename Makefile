SHELL?=/bin/bash 

all: all_src all_base64 all_examples

clean: clean_src clean_base64 clean_include clean_examples
	rm -f *~ *.bak

clean_include:
	rm -f include/b64/*~
		
distclean: clean distclean_src distclean_base64 distclean_examples
strip: strip_src strip_base64 strip_examples
depend: depend_src depend_base64 depend_examples

all_%:
	$(MAKE) -C $(subst all_,,$@) all;

depend_%:
	$(MAKE) -C $(subst depend_,,$@) depend;

clean_%:
	$(MAKE) -C $(subst clean_,,$@) clean;

distclean_%:
	$(MAKE) -C $(subst distclean_,,$@) distclean;

strip_%: all
	$(MAKE) -C $(subst strip_,,$@) strip;

