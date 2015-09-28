nodebob
---

nodebob is a **build tool** for **NW.js** written in Windows batch script.

Write your NW.js project inside the ```sources``` folder and build your native Windows application in just one click!

* nodebob creates the folder ```release``` that contains all the necessary files to build a standalone application without dependencies
* you can also add your custom application icon in ```source/icon.ico```
    
**NW.js** is an app runtime based on ```Chromium``` and ```node.js```.

> You can write native apps in HTML and JavaScript with NW.js. It also lets you call Node.js modules directly from the DOM and enables a new way of writing native applications with all Web technologies.

>**Features**

>* Apps written in modern HTML5, CSS3, JS and WebGL.
* Complete support for node.js APIs and all its third party modules.
* Good performance: Node and WebKit runs in the same thread: Function calls are made straightforward;
* objects are in the same heap and can just reference each other.
* Easy to package and distribute apps.
* Available on Linux, Mac OSX and Windows

> [source] [1]

Tech
-
nodebob uses a number of open source projects to work properly:

* [7-zip] - a lightware file archiver, v9.20
* [Anolis Resourcer] - a windows resource editor, v0.9.0
* [NW.js] - v1.2.0-win64

Version
-
0.1

Windows versions
-
Tested on `Windows 7 64-bit, Windows 10 64-bit`.

Quick start
-

**Install**

`git clone https://github.com/Varjelus/nodebob.git nodebob`

**Run**

Execute `nodebob/build.bat`

License
-
MIT

[node-webkit]: http://nwjs.io/
[7-zip]: http://www.7-zip.org/
[Anolis Resourcer]: http://anolis.codeplex.com/
[1]: https://github.com/nwjs/nw.js#introduction
