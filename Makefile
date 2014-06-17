all:
	mkdir -p lua/lgm
	cd src; moonc -t ../lua/lgm .
	cd lua; lua lgm/lgm-test.lua
