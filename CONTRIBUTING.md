Contributing to DrMIPS
======================

The simulator is licensed under the GPLv3, so you are free to use it, modify it
and improve it.
Here are some ways to contribute:


## Translating

The simulator needs to be translated to more languages. You are welcome to
translate it to yours, then send the translation through a pull request or
through the [issue tracker][issues].

There are several files and folders containing translatable string:

*   Strings of the PC version: these are Java properties files and are located
    in `src/pc/DrMIPS/lang/*.properties`.
*   Strings of the Android version: these are XML files and are located in
    `src/android/DrMIPS/app/src/main/res/values*/strings.xml`.
    Some strings appear in both PC and Android versions, so please keep them
    consistent.
*   Custom component descriptions in the CPU files: these are JSON files and are
    located in `src/simulator/DrMIPSSimulator/cpu/*.cpu`.
    The custom descriptions are JSON objects identified by the `"desc"` keyword.
*   User manuals: these are HTML files and are located in `doc/manuals/`.
*   Linux desktop launcher: it's located in `misc/drmips.desktop`.
*   Linux manpages: they are located in `misc/drmips*.1`.


## Coding

You are welcome to fix bugs or add new features.
Find bugs that need to be fixed in the [issue tracker][issues].

The project is arranged into these directories:

*   **cmake**: additional modules used by the CMake build scripts.
*   **doc**: documentation of the project.
    -   **manuals**: user manuals.
    -   **UML**: simple UML class diagram of the simulator.
*   **src**: source code of the project.
    -   **android**: code of the Android application (Android Studio project).
    -   **pc**: code of the PC application (Netbeans project).
    -   **simulator**: code of the simulation logic (Netbeans project), used by
        the other two projects.
*   **misc**: some miscellaneous files used mainly for Linux packages.

Some important notes:

*   The source code was indented with tabs.
*   The code of the **simulator** project is *platform independent*.
    It should not call any platform dependent methods!
*   The **simulator** project is compiled into a jar library.
    This library is then used by the **pc** and **android** projects.
    For these projects to work in the IDEs, the **simulator** project must be
    compiled by the makefiles generated by CMake by running:

        mkdir build
        cd build
        cmake ..
        make simulator

    The two last command must be run every time the **simulator** project is
    changed.

To get an idea of how the code is structured, you can look at the simplified 
UML class diagram (it may not be up to date):

![UML diagram][uml]


## Documentation

You are welcome to improve the user manuals. They are located in `doc/manuals/`
and are HTML files.


## Design

The simulator uses a simple icon that was generated by the Android SDK. A new
and better icon would be appreciated.

You could also improve the design and theming of the simulator.



[issues]: https://github.com/brunonova/drmips/issues
[uml]: doc/UML/UML.png
