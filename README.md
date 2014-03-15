Chromium Windows Build
======================

Build chromium browser on Windows

Description
----

Building chromium can be time consuming. The process itself (fetching code and building) takes about 5 hours. 
But setting up source code is not simple task espessially after moving from svn to git and depricating svn instructions.  
You can spend several days trying to figure out how it works. Official insturction are not guarantee of the success.

This script automates instructions listed in 
* [Chromium build instructions Windows](http://www.chromium.org/developers/how-tos/build-instructions-windows)
* [How to get the code using git](http://dev.chromium.org/developers/how-tos/get-the-code)
* [Using the Ninja build system ](http://code.google.com/p/chromium/wiki/NinjaBuild)

This script is tested under Windows 8 with Visual Studio 2013 Ultimate


Goals
---

There are four goals of this project

1. Build automatically Chromium most recent stable release.
1. Involve to this project developers from Chromium community.
1. Influence on [official](http://www.chromium.org/developers/how-tos/build-instructions-windows)  [instructions](http://dev.chromium.org/developers/how-tos/get-the-code). Make them more straightforward and predictable.
2. Keep these scripts as simple as possible. Preserve maximum readability. No weird loops, gotos, etc.


Depencies
----

1. Before run this script [install depot tools](http://dev.chromium.org/developers/how-tos/install-depot-tools) 
1. Before run this script install visual studio 2013 to default folder
1. Before run this script [Windows SDK for Windows 8](http://msdn.microsoft.com/en-us/windows/hardware/hh852363.aspx) to default folder
1. Before run this script [this git distribution](http://git-scm.com/download/win) to default folder

Using
----

Run this script from windows command prompt without any parameters.
