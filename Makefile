build:
	ocamlopt -o morgue morgue.ml
	rm -rf morgue.o morgue.cmx morgue.cmi
