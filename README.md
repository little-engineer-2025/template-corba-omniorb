# Hello world in Corba-C++

## Getting started

- Install dependencies: `dnf install -y toolbox direnv`
- Create `.envrc`

  ```sh
  # Set your preferred name
  export TOOLBOX="corba-hello-dev"
  ```

- Allow direnv: `direnv allow`
- Create/Prepare toolbox: `toolbox.sh create`
- Enter toolbox: `toolbox.sh enter`
- Build: `mkdir build; cd build; cmake ..; make`

## References

- [The omniORB version 4.3 Uers's Guide](https://omniorb.net/omni43/omniORB/index.html).
- [CMake Documentation](https://cmake.org/documentation/).

