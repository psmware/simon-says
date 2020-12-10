FROM psmware/devops-base
LABEL name=ie.psmware.my-template
LABEL vendor="psmware ltd"
LABEL ie.psmware.my-template.version="1.0"
LABEL ie.psmware.my-template.version.release-date="2020-04-10"
LABEL ie.psmware.my-template.version.version.is-production=""
### Setting up Post Build taks to install ssh and GPG keys in container
RUN echo "source /app/.devcontainer/.post.sh" >> /home/vscode/.zshrc