Joomla! API - Generic RESTful API framework for Joomla! 2.5
================================

What is it?
---------------------------------------
The Joomla! API is an extension that provides a framework for creating a RESTful API for a Joomla! 2.5 site.  It is infinitely extendable through the use of the standard Joomla! plugin system.

Goals
--------------

The following are the goals of the project:

* **`RESTful Joomla! Interface`**: The purpose of this extension is to provide a standardized interface for creating RESTful API's for Joomla! sites.  Existing extensions can easily expose data by creating simple plugins.

* **`Simplicity`**: This extension's libraries and class hierarchies have been written to handle the nitty-gritty aspects of API interaction so that developers can focus solely on making their extensions accessible.

* **`Flexibility`**: The framework will allow developers to implement varying degrees of RESTful concepts in their interfaces while also giving them the flexibility to override some core functionality.

If you want to make it better
-----------------------------
Please feel free to make suggestions for ways to make this framework better or more flexible.  It is already in use on a couple live sites and I plan to keep actively developing for as long as it make sense.  I built it to my own specifications, but I would definitely be interested in suggestions for better ways of doing things. I also plan on porting it to J! 2.5 when I get a chance, so any help with that would be appreciated.


How do I use it?
-----------------------------
There are a few ways you can install this on your site.

**`Phing`**: If you don't have Phing installed, get it *[here](http://phing.info/trac/)*. From the repository root:

	phing -f phing/build.xml
	
That should create a folder at phing/packages with an installable zip.

**`Symbolic Link`**: On a *NIX system, run the following command from the repository root:

	./scripts/symlink.sh
	
It will then ask you for the full path to your site root.  You will then need to run the SQL found in administrator/components/com_jm/install.mysql.sql on your site database.

**`Manual Install`**: This is the same concept as using the symlink, except you'll need to copy the component files to your site (or run your site from within the "code" folder) and then run install.mysql.sql.

Roadmap
-----------------------------
- API/Method documentation
- A fully working API Plugin (probably com_content)
- Viewable logs
- Plugin SEF URL's
- Automatic XML generation
- Backend API key check-in/check-out
- Per API key request limiting


