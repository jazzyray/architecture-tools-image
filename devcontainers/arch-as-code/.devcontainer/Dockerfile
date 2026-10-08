# checkov:skip=CKV_DOCKER_2: Ensure that HEALTHCHECK instructions have been added to container images
# checkov:skip=CKV_DOCKER_3: Ensure that a user for the container has been created
# checkov:skip=CKV2_DOCKER_1: sudo
FROM mcr.microsoft.com/devcontainers/python:3.13-bookworm

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

ENV DEBIAN_FRONTEND=noninteractive

ENV TARGETPLATFORM=${TARGETPLATFORM}

# Install base packages required by docs-as-code and sharepoint/function dev
RUN apt-get update && \
    apt-get -y install --no-install-recommends \
    build-essential \
    graphviz \
    pandoc \
    pandoc-plantuml-filter \
    texlive \
    texlive-base \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-plain-generic \
    lmodern \
    imagemagick \
    librsvg2-bin \
    openjdk-17-jdk \
    curl
    
RUN pip3 install pipx    

# Install Python requirements, including mkdocs
ENV TZ=UTC
RUN python3 -m pip install --upgrade setuptools
RUN python3 -m pip install mkdocs mkdocs-material plantuml-markdown mkdocs_puml
RUN python3 -m pip install tox
RUN python3 -m pip install invoke

# Install Tox for a consitent python tool chain
RUN pipx install tox

# Install Markdown Pre-processor Pandoc Plugin
RUN su vscode -c "python3 -m pip install MarkdownPP"

# Install Copier
RUN su vscode -c "python3 -m pip install copier==9.6.0"

# Install ADR Tools
ARG ADR_INSTALL_DIR="/home/vscode/adr-tools"
RUN mkdir ${ADR_INSTALL_DIR} && git clone https://github.com/npryce/adr-tools.git ${ADR_INSTALL_DIR}
ENV PATH="$PATH:${ADR_INSTALL_DIR}/src"

# Install PlantUML cli for batch
ENV PLANTUML_LIMIT_SIZE=8192
COPY ./scripts/install-plantuml.sh /tmp/library-scripts/install-plantuml.sh
RUN /bin/bash /tmp/library-scripts/install-plantuml.sh && \
    rm -rf /tmp/library-scripts/

# Install Structurizr
ARG STRUCTURIZR_INSTALL_DIR="/home/vscode/.local/bin/structurizr/"
COPY ./scripts/install-structurizr-cli.sh /tmp/library-scripts/install-structurizr.sh
RUN /bin/bash /tmp/library-scripts/install-structurizr.sh ${STRUCTURIZR_INSTALL_DIR} && \
    rm -rf /tmp/library-scripts/

RUN echo "done, complete, finished."
