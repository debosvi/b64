SHELL?=/bin/bash 
CC?=gcc
export INSTALL_BIN?=install
export INSTALL_PREFIX?=/usr/local

all: all_src all_base64 all_examples

clean: clean_src clean_base64 clean_include clean_examples
	rm -f *~ *.bak

clean_include:
	rm -f include/b64/*~

install_include:
	$(INSTALL_BIN) -d $(INSTALL_PREFIX)/include/b64
	$(INSTALL_BIN) -c include/b64/*.h $(INSTALL_PREFIX)/include/b64

uninstall_include:
	@rm -rf $(INSTALL_PREFIX)/include/b64
		
distclean: clean distclean_src distclean_base64 distclean_examples
strip: strip_src strip_base64 strip_examples
depend: depend_src depend_base64 depend_examples
install: strip install_src install_base64 install_examples install_include
uninstall: uninstall_src uninstall_base64 uninstall_examples uninstall_include

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

install_%: 
	$(MAKE) -C $(subst install_,,$@) install;

uninstall_%: 
	$(MAKE) -C $(subst uninstall_,,$@) uninstall;

