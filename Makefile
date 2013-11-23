all:
	coffee -c -w -b -m $$(find js -name '*.coffee')
