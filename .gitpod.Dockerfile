FROM gitpod/workspace-full

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "zsh"]

USER gitpod

RUN sudo apt-get update && \
    sudo apt-get install -y zsh

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh 

RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sudo sh
