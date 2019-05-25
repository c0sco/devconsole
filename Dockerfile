FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:hnakamur/golang-1.12
RUN apt-get update -y
RUN apt-get install -y curl git golang groff jq make python-pip python3-pip unzip zsh
RUN apt-get install -y sudo vim python3-venv virtualenvwrapper
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime
RUN echo "devconsole ALL = (ALL) NOPASSWD: ALL" > /etc/sudoers.d/devconsole
RUN pip3 install ansible ansible-toolbox
RUN pip3 install awscli saws
RUN adduser --shell /usr/bin/zsh devconsole
RUN rm -rf /var/lib/apt/lists/*
RUN CURVER=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version'); curl "https://releases.hashicorp.com/terraform/${CURVER}/terraform_${CURVER}_linux_amd64.zip" 2>/dev/null | funzip > /usr/local/bin/terraform
RUN CURVER=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/nomad | jq -r -M '.current_version'); curl "https://releases.hashicorp.com/nomad/${CURVER}/nomad_${CURVER}_linux_amd64.zip" 2>/dev/null | funzip > /usr/local/bin/nomad
RUN curl -Ls 'https://vault.bitwarden.com/download/?app=cli&platform=linux' 2>/dev/null | funzip > /usr/local/bin/bw
RUN chmod -R 755 /usr/local/bin

USER devconsole
WORKDIR /home/devconsole
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN curl -s https://mattstofko.com/zsh/install.sh | /usr/bin/zsh -
CMD ["zsh"]
