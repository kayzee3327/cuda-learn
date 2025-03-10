# ~~Cross-compilation~~

## Compilation targeting arm64 ubuntu

Success

```
mkdir build
nvcc ./vecAdd.cu -o ./build/vecAdd_arm_ubuntu
```

## Compilation targeting amd64 windows

Okay. It is time to move out of the comfort zone. (**No. Better to compiler on windows directly,** since you cannot try msvc compiler on ubuntu)

# Workflow_mac_win (windows compiles what mac writes)

Upon above success, now let's remote compile.

After struggling with VS project view, I found it would be perfect to create a `cmake`-based project, which smoothly supports cross-platform development and build.

Here's advice from chatgpt:

> If you want to develop the project both on Windows (with Visual Studio) and Linux, I highly recommend  switching to a CMake-based project. Here’s why:
> 
> - **CMake** can automatically generate project files for different platforms (Visual Studio on Windows, Makefiles or Ninja on Linux).
> 
> - It abstracts away platform-specific settings, so you can define **conditional logic** in your `CMakeLists.txt` file to handle different platforms (Windows vs Linux).
>
> - You can use `find_package` to locate CUDA in a cross-platform way, handle paths dynamically, and ensure that **library linking** is done appropriately for each platform.

And how to create project on different platform:

Generate Visual Studio Project on Windows: On Windows, run CMake to generate a Visual Studio project:
```bash
cmake -G "Visual Studio 16 2019" .
```
Generate Makefile on Linux: On Linux, you can use the following to generate a Makefile:
```bash
cmake -G "Unix Makefiles" .
make
```

Let me try it now.

## Develop with cmake

### organize files

First of all, to base a project on CMake needs a good directory structure.

New:

```
.
|-- CMake
|-- CMakeLists.txt
|-- README.md
|-- arrays.txt
|-- build
|-- include
|   `-- vecAdd.h
|-- lib
`-- src
    |-- gen_array.py
    |-- main.cpp
    `-- vecAdd.cu
```

Original:

```
.
|-- CMakeLists.txt
|-- README.md
|-- arrays.txt
|-- gen_array.py
`-- vecAdd.cu
```

Changes are:

- separating calling routine and cuda kernel functions

- file structure (adding folders)

    - include

    - src

    - lib

    - build

    - CMake (for cmake scripts)

### write CMakeLists.txt



