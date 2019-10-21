Based on debian openjdk 11 to support running WhiteSource agent.

Includes pyenv so a specific version of python can be installed, so whitesource can install and scan depedencies in an isolated environment without any chance of installing python modules globally.

Also contains nvm so nodejs projects can be scanned.

Do to so, create a whitesource.config file (see WhiteSource) configured with appropriate api/product/project tokens and map it and your source code directory into the container.

For example, the following will

* install python 3.6.7
* switch to using python 3.6.7 globally
* run WhiteSource against the specified source directory (admission-prediction), reporting results back to the account specified by the api key in whitesource.config

Example for python

```
docker run -v $(pwd):/working -i sriddell/whitesource-scanner /bin/bash -c ". ~/.bash_profile && pyenv install 3.6.7 && pyenv global 3.6.7 && wget https://bootstrap.pypa.io/get-pip.py && python ./get-pip.py && ./wss_agent.sh -c /working/whitesource.config -d /working/admission-prediction"
```

Example for node

```
```
docker run -v $(pwd):/working -i sriddell/whitesource-scanner /bin/bash -c ". \$HOME/.nvm/nvm.sh && nvm install 12.7.0 && nvm use 12.7.0 && ./wss_agent.sh -c /working/whitesource.config -d /working/admission-prediction"
```