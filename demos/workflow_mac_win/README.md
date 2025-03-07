# ~~Cross-compilation~~

## compilation targeting arm64 ubuntu

Success

```
mkdir build
nvcc ./vecAdd.cu -o ./build/vecAdd_arm_ubuntu
```

## compilation targeting amd64 windows

Okay. It is time to move out of the comfort zone. (**No. Better to compiler on windows directly,** since you cannot try msvc compiler on ubuntu)

# workflow_mac_win (windows compiles what mac writes)

Upon above success, now let's remote compile.

