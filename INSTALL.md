Installing DrMIPS from source
=============================

1.  Install the dependencies.
    In Ubuntu and Debian, these are the known dependencies:

    *   cmake
    *   openjdk-7-jdk *(or another JDK)*

    To compile the Android version, you will additionally need to install the
    Android SDK.

2.  Open a terminal in the project directory and run:

        mkdir build
        cd build
        cmake ..
        make
        sudo make install

    To create a ZIP file for distribution of the PC version, run:

        make dist
