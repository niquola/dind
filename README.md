# Docker in docker for docker development


```
alias d='sudo docker.io'
git clone git@github.com:niquola/dind.git
cd dind
docker build -t dind:latest .
d run --name=mydocker --privileged -t -i dind:latest /bin/bash

# test inside docker

docker run --rm -t -i ubuntu bash
```

