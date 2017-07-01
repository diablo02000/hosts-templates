# NodeJS

Create a simple NodeJS docker image with npm base on light debian Jessie.

# Build command

- Build NodeJS image:

```
~$ docker build . -t nodejs:6
```

By default the dockerfile use the latest NodeJS 6. But you can overwrite with NODEJS_VERSION variable

- Build NodeJS image with another NodeJS version:

```
~$ docker build . --build-arg NODEJS_VERSION="7" -t nodejs:7
```

