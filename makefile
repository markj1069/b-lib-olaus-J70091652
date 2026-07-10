
FILENAMESLIB := lib

OLSLIST := makefile $(addprefix $(FILENAMESLIB)/, \
           is_csv.sh is.sh ols_begin.sh ols_bmp_tstno.sh ols_bmp_tstno.sh \
		   ols_def.sh ols_end.sh ols_err.sh ols_num.sh ols_rd_excode.sh ols_rd_tstno.sh \
		   ols_set_excode.sh ols_tap_print_assertion.sh ols_tap_print.sh ols_tap_print_version.sh \
		   ols_wt_excode.sh ols_wt_tstno.sh test_plan.sh )
OLSTARGET := lib/olslib
OLSDIR := lib
INSTALL_DIR := $(HOME)/.local/lib
INSTALL_LIB := $(INSTALL_DIR)/olslib

.SUFFIXES:
.SUFFIXES: .bash .t

default: lib

# Targets


# Installation Support Targets

.PHONY: check
.PHONY: clean                # Remove all files in current directory normally created by building program
.PHONY: install              # Install package.
.PHONY: installcheck         # Run installation checks.
.PHONY: installdirs          # Create installation directories if required.
.PHONY: install-html         # Install HTML documentation.
.PHONY: install-dvi          # Install dvi documentation.
.PHONY: install-pdf          # Install PDF documentation.
.PHONY: install-ps           # Install postscript documentation.
.PHONY: install-strip        # Install and strip executables of debug info.
.PHONY: uninstall            # Uninstall all install and install-* files.

# Development Suport Targets

.PHONY: test                 # Run development tests.
.PHONY: TAGS                 # Regenerate program TAGS
.PHONY: dvi                  # Generate dvi documentation.
.PHONY: info                 # Generate info documentation.
.PHONY: lib                  # Generate Olaus Bash Shell Library, default target.
.PHONY: newlib               # Copy newlib to $(OLSTARGET)
.PHONY: html                 # Generate HTML documentation.
.PHONY: pdf                  # Generate PDF documentation.
.PHONY: ps                   # Generate postscript documentation.
.PHONY: mostlyclean          # Like clean but leave files most people don't want to recompile.
.PHONY: realclean            # Delete derived files
.PHONY: maintainer-clean     # Delete almost everything that can be reconstructed by this makefile.




# Distribution Support Targets

.PHONY: ci                   # Runs $(CI) and $(RCS_LABEL) on MANIFEST files.
.PHONY: dist                 # Creates distribution. Defaults to tardist.
.PHONY: distcheck            # Report files missing from MANIFEST file.
.PHONY: distclean            # Run realclean then distcheck.
.PHONY: distdir              # Copies MANIFEST files to $(DISTNAME)-$(VERSION).
.PHONY: disttest             # Creates tarfile. See MakeMaker.
.PHONY: manifest             # Rewrites MANIFEST file with remaining files.
.PHONY: shdist               # Run distdir then create a shar archive.
.PHONY: skipcheck            # Report skipped files from MANIFEST.SKIP file.
.PHONY: tardist              # Creates tarfile. See ExtUtils::MakeMaker.
.PHONY: uutardist            # Run tardist then uuencodes the tarfile.
.PHONY: veryclean            # Run realclean then removes backup files.
.PHONY: zipdist              # Run distdir then create a $(ZIP) zipfile.

.PHONY: newlib
.PHONY: cpnewlib
.PHONY: olslib

#

newlib lib/newlib: $(OLSLIST)
	bin/build-lib.sh

olslib lib/olslib: lib/newlib
	cp lib/newlib lib/olslib


#lib/olslib: lib/newlib
#	bin/build-lib.sh

olstst:
	bin/build-tst

olslst:
	bin/build-lst

	olslst

install: $(OLSTARGET)
	cp $(OLSTARGET) $(NSTALL_DIR)/$(INSTALL_LIB)

uninstall:
	rm $(INSTALL_DIR)/$(INSTALL_LIB)

install-strip:
	echo "install-strip:"

clean:
	-rm --force bin/core
	-rm --force bin/*.stackdump
	-rm --force bin/*.tmp
	-rm --force bin/tmp.*
	-rm --force doc/*.html
	-rm --force doc/*.docx
	-rm --force doc/*.gfm
	-rm --force doc/*.stackdump
	-rm --force doc/*.tmp
	-rm --force lib/*.html
	-rm --force lib/*.stackdump
	-rm --force lib/*.tmp
	-rm --force lib/tmp.*
	-rm --force lib/ols_lib/*.html
	-rm --force lib/ols_lib/*.stackdump
	-rm --force lib/ols_lib/*.tmp
	-rm --force lib/ols_lst/*.html
	-rm --force lib/ols_lst/*.stackdump
	-rm --force lib/ols_lst/*.tmp
	-rm --force lib/ols_tmp/*.html
	-rm --force lib/ols_tmp/*.stackdump
	-rm --force lib/ols_tmp/*.tmp
	-rm --force lib/ols_tst/*.html
	-rm --force lib/ols_tst/*.stackdump
	-rm --force lib/ols_tst/*.tmp
	-rm --force t/*.stackdump
	-rm --force t/*.tmp
	-rm --force t/tmp.*
	-rm --force core
	-rm --force *.stackdump
	-rm --force *.tmp
	-rm --force *.html
	-rm --force *.docx
	-rm --force *.gfm
	-rm --force tmp.*	

distclean:
	echo "distclean:"

mostlyclean:
	echo "mostlyclean:"

realclean:
	echo "realclean:"

maintainer-clean:
	echo "maintainer-clean:"

TAGS:
	echo "TAGS:"

info:
	echo "info:"

lib: lib/olslib
	bin/build-lib.sh $(OLSDIR)/newlib
	cp $(OLSDIR)/newlib $(OLSTARGET)

cpnewlib:
	cp $(OLSDIR)/newlib $(OLSTARGET)

dvi:
	echo "dvi:"

dist:
	echo "dist:"

check:
	echo "check:"

installcheck:
	echo "installcheck:"

installdirs:
	echo "installdirs:"

test:
	prove xt t

testxt: lib/newlib
	prove xt                          # Test the development tests in the xt directory.

testt:
	prove t

distcheck:
	echo "distcheck:"

veryclean:
	echo "veryclean:"

manifest:
	echo "manifest:"

distdir:
	echo "distdir:"

disttest:
	echo "disttest:"

tardist:
	echo "tardist:"

uutardist:
	echo "uutardist:"

shdist:
	echo "shdist:"

zipdist:
	echo "zipdist:"

ci:
	echo "ci:"

skipcheck:
	echo "skipcheck:"

install-html:
	echo "install-html:"

install-dvi:
	echo "install-dvi:"

install-pdf:
	echo "install-pdf:"

install-ps:
	echo "install-ps:"

html:
	echo "html:"

pdf:
	echo "pdf:"

ps:
	echo "ps:"
