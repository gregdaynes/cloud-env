# Cloud Development Environment
# MAINTAINED BY @gregdaynes

FROM debian:jessie

# update docker repo 
RUN apt-get purge lxc-docker* \
	purge docker.io*
	
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

RUN rm -rf /etc/apt/sources.list.d/docker.list

RUN echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y \
	docker-engine \
	vim \
	git
	
RUN sudo groupadd docker

RUN sudo gpasswd -a ${USER}

RUN sudo service docker start

RUN curl "https://raw.githubusercontent.com/csswizardry/dotfiles/master/.vimrc" -o ~/.vimrc
