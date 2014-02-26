all:
	mkdir -p lua
	cd src; moonc -t ../lua .
	cd lua; lua lgm-test.lua
