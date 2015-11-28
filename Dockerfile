# Cloud Development Environment
# MAINTAINED BY @gregdaynes

FROM debian:jessie

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

RUN rm -rf /etc/apt/sources.list.d/docker.list

RUN echo "deb http://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y \
    apt-transport-https \
	docker-engine \
	vim \
	git \
    curl \
    zsh \
    tmux
	
RUN curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` \
    > /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose

RUN curl "https://raw.githubusercontent.com/csswizardry/dotfiles/master/.vimrc" \
    -o ~/.vimrc

RUN curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh; exit 0

RUN echo "DEFAULT_USER=root" > .zshrc

RUN chsh --shell $(which zsh)

RUN service docker start

ENTRYPOINT tmux
