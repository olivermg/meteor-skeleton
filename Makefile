LESS=$(shell which lessc)
COFFEE=$(shell which coffee)

all: coffee less

coffee: public/js/*.coffee
	$(COFFEE) -c public/js/*.coffee

less: public/css/*.less
	for IF in $^; do \
		OF=$$(dirname $$IF)/$$(basename -s .less $$IF).css; \
		$(LESS) $$IF >$$OF; \
	done

