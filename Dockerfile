FROM openjdk:11

RUN curl -LJO https://github.com/whitesource/unified-agent-distribution/raw/master/standAlone/wss_agent.sh && chmod +x wss_agent.sh
RUN git clone https://github.com/pyenv/pyenv.git /root/.pyenv
RUN touch /root/.bash_profile
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /root/.bash_profile
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /root/.bash_profile
RUN echo 'eval "$(pyenv init -)"' >> /root/.bash_profile
RUN echo '. ~/.bash_profile' >> /root/.bashrc


RUN apt-get update
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

RUN . /root/.bash_profile
RUN export PATH=$HOME/.pyenv/bin:$PATH && eval "$(pyenv init -)" && pyenv install 3.7.4 && pyenv global 3.7.4 && python --version && wget https://bootstrap.pypa.io/get-pip.py && python ./get-pip.py
RUN export PATH=$HOME/.pyenv/bin:$PATH && eval "$(pyenv init -)" && pyenv install 3.6.9 && pyenv global 3.6.9 && python --version && wget https://bootstrap.pypa.io/get-pip.py && python ./get-pip.py
RUN export PATH=$HOME/.pyenv/bin:$PATH && eval "$(pyenv init -)" && pyenv install 3.7.1 && pyenv global 3.7.1 && python --version && wget https://bootstrap.pypa.io/get-pip.py && python ./get-pip.py




