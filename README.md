# Architecture Tools

Docker image with Architecture tools for a [VSCode DevContainer](./devcontainers/arch-as-code/devcontainer/README.md)

## Pulling the Container Image

### Login to ghcr

Get a PAT (GitHub personal access token), obtained by going [here](https://github.com/settings/tokens) -> Generate New Token -> Classic

```bash
docker login ghcr.io -u username -p accesstoken
```

```bash
docker pull ghcr.io/randco.architecture.arch-as-code:latest
```

## Building and publishing the image to the Github container registery

Use this [pipeline]()
The [Pipeline YAML](.github/actions/build-push-arch-tools-image.yaml)

## Using the Image

[Image Read Me](./devcontainers/arch-as-code/.devcontainer/README.md)
