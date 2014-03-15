chromium-windows-build
======================

Build chromium browser Windows

Description
----

Building chromium can be time consuming. The process itself (fetching code and building) takes about 5 hours. 
But setting up source code is not simple task espessially after moving to git and depricating svn instructions.  
You can spend several days trying to figure out how it works. Official insturction are not guarantee of the success.

This script automates instructions listed in 
* [Chromium build instructions Windows](http://www.chromium.org/developers/how-tos/build-instructions-windows)
* [How to get the code using git](http://dev.chromium.org/developers/how-tos/get-the-code)
* [Using the Ninja build system ](http://code.google.com/p/chromium/wiki/NinjaBuild)

This script is tested under Windows 8 and Visual Studio 2013 Ultimate


Goal
---

There are two goals of this project

1. Build automatically Chromium recent stable release.
1. Involve to this project developers from Chromium comminity.
1. Influence on official build instruction make them more simplier and predictable.


Depencies
----

1. Before run this script install depot tools manually http://dev.chromium.org/developers/how-tos/install-depot-tools
1. Before run this script install visual studio 2013
1. Before run this script install http://git-scm.com/download/win

Using
----

Run this script from windows command prompt
