Lua Geometry Module (LGM)
-------------------------

LGM is a module for Lua applications providing a *"good enough"* implementation of basic computational geometry techniques for 2D drawing like **vectors**, **segment intersections** and **distance** computations.

LGM is written in [Moonscript](http://moonscript.org/), a language which compiles to Lua. The generated lua code can be used without constraints in Lua projects.

# Installation

* Clone the repository
* Run the Makefile (require Moonscript to be installed)
* Copy the content the newly generated `lua/` folder somewhere accessible (e.g. `$workdir$/lib/lgm/`)
* Declare `LGM = require("lgm")` where you want to use the library
