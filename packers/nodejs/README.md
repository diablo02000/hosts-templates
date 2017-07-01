# NodeJS

Create a simple NodeJS docker image with npm base on light debian Jessie.

# Build command

- Build NodeJS image:

```
~$ packer build nodejs-template.js
```

By default the dockerfile use the latest NodeJS 6. But you can overwrite with nodejs-version variable

- Build NodeJS image with another NodeJS version:

```
~$ packer build -var nodejs_version=7 nodejs-template.js
```

