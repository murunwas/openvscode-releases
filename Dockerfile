 FROM gitpod/openvscode-server:latest

 USER root # to get permissions to install packages and such
 RUN sudo wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
 RUN export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
 RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
 RUN nvm install 16.13.2
 EXPOSE 3001
 EXPOSE 3002
 EXPOSE 3003
 
 USER openvscode-server # to restore permissions for the web interface
