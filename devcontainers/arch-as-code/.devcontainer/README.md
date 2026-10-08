# Architecture Dev Container image

Tools include:

[Mkdocs](https://www.mkdocs.org/) for architecture documentation
[Copier](https://copier.readthedocs.io/en/stable/) for architecture documentation templates
[Structurizr](https://structurizr.com/) for architecture modelling and diagrams
[Plantuml](https://plantuml.com/) for UML diagrams
[Powershel](./scripts/install-powershell.sh)
[AZ Cli](./scripts/install-az-cli.sh)

## Building

```bash
docker build . -t randco.architecture.arch-as-code:0.0.1
```

## Pulling the image

### Github

@TODO

```bash
```

### Pull the image

@TODO

```bash
docker pull randco-arch-acr.azurecr.io/graphwise.architecture.arch-as-code:0.0.1
```

## Using the image

If you want to use the image as a devcontainer, copy the following into your VSCode project

[.devcontainer/devcontainer.json](../../../.devcontainer/devcontainer.json)

Read all about [DevContainers](https://code.visualstudio.com/docs/devcontainers/containers) ...
