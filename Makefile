# Copyright (C) 2021-2023 Jim Porter

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.

# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.

PACKAGE_NAME := bfg9000-mode
PACKAGE_MAIN := $(PACKAGE_NAME).el
AUTOLOADS := $(PACKAGE_NAME)-autoloads.el
GEN_SRCS := bfg9000-keywords.el
SRCS := $(filter-out $(AUTOLOADS), $(sort $(wildcard *.el) $(GEN_SRCS)))
OBJS := $(patsubst %.el,%.elc,$(SRCS))

EMACS ?= emacs

.PHONY: all
all: compile autoloads

.PHONY: compile
compile: $(OBJS)

.PHONY: autoloads
autoloads: $(AUTOLOADS)

$(AUTOLOADS): GENERATE_AUTOLOADS = '$\
  (package-generate-autoloads "$(PACKAGE_NAME)" default-directory)'
$(AUTOLOADS): $(SRCS)
	@echo AUTOLOAD $@
	@$(EMACS) -Q --batch \
	  --eval '(package-initialize)' \
	  --eval $(GENERATE_AUTOLOADS)

bfg9000-keywords.el:
	$(eval TMP := $(shell mktemp -dt bfg9000-mode.XXXXXXXXXX))
	bfg9000 configure-into scripts $(TMP) --file=$(abspath $@) \
	  --toolchain=scripts/toolchain.bfg
	@rm -rf $(TMP)

%.elc: %.el
	@echo ELC $@
	@$(EMACS) -Q --batch \
	  $(if $(STRICT),--eval '(setq byte-compile-error-on-warn t)') \
	  -L . --funcall batch-byte-compile $<

.PHONY: run
run: all
	$(EMACS) -Q -L . \
	  --eval '(load "$(AUTOLOADS)")'

.PHONY: lint
lint:
	@$(MAKE) --always-make STRICT=1 compile

.PHONY: check
check:
	@echo TEST $(patsubst %.el,%,$(TESTS))
	@$(EMACS) -Q --batch \
	  -L . $(patsubst %.el,-l %,$(TESTS)) \
	  --eval '(ert-run-tests-batch-and-exit t)'

.PHONY: clean
clean:
	rm -f *.elc $(AUTOLOADS)

.PHONY: really-clean
really-clean:
	rm -f *.elc $(AUTOLOADS) $(GEN_SRCS)
