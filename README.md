

![fast logo](https://fastapi.tiangolo.com/img/logo-margin/logo-teal.png "Fast API")

## Helpful resources:

### [Standard Hello World](https://fastapi.tiangolo.com/tutorial/first-steps/)
### [FastAPI Dockerization](https://fastapi.tiangolo.com/deployment/docker/)

### [FastAPI with Pydantic](https://fastapi.tiangolo.com/features/)

### [Pydantic](https://pydantic-docs.helpmanual.io/usage/models/)

### [Minikube](https://minikube.sigs.k8s.io/docs/start/)

## Setup

### 1.) install requirements

Opted to make a script for the installation since minikube requires a url based installation outside of standard pip install

```Shell
./requirements_install.sh
```
### 2.) (for deployment) Install Minikube for scaling to kubernetes environment
### Check if minikube installed correctly

```Shell
>>> minikube version

minikube version: v1.26.1
commit: 62e108c3dfdec8029a890ad6d8ef96b6461426dc
```

### pass 'minikube' argument into docker runner to trigger minikube build and pod deployment

```Shell
>>> ./docker_runner minikube

🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱
========================
Creating Minikube
========================
🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱🌱


😄  minikube v1.26.1 on Darwin 11.2.2
✨  Automatically selected the docker driver. Other choices: hyperkit, parallels, virtualbox, ssh
📌  Using Docker Desktop driver with root privileges
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
🔥  Creating docker container (CPUs=2, Memory=3887MB) ...
🐳  Preparing Kubernetes v1.24.3 on Docker 20.10.17 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨
========================
Building FastAPI Image
========================
🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨🔨


Sending build context to Docker daemon  74.63MB
Step 1/6 : FROM python:3.9
3.9: Pulling from library/python
1671565cc8df: Pull complete 
3e94d13e55e7: Pull complete 
fa9c7528c685: Pull complete 
53ad072f9cd1: Pull complete 
d6b983117533: Pull complete 
d8092d56ded5: Pull complete 
5b016815b81d: Pull complete 
c9fb4e3b4864: Pull complete 
18aa057f7254: Pull complete 
Digest: sha256:a1f8d596b9400f5af381e6e8482bf97424bf0c1e8f41361a95497c89d5514dfc
Status: Downloaded newer image for python:3.9
 ---> b6be79db3b12
Step 2/6 : WORKDIR /code
 ---> Running in 4815eeec786f
Removing intermediate container 4815eeec786f
 ---> 465830b527c2
Step 3/6 : COPY ./requirements.txt /code/requirements.txt
 ---> 14619ffc0763
Step 4/6 : RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
 ---> Running in 82123560988c
Collecting docker
  Downloading docker-6.0.0-py3-none-any.whl (147 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 147.2/147.2 KB 7.0 MB/s eta 0:00:00
Collecting fastapi
  Downloading fastapi-0.81.0-py3-none-any.whl (54 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 54.9/54.9 KB 59.7 MB/s eta 0:00:00
Collecting uvicorn
  Downloading uvicorn-0.18.3-py3-none-any.whl (57 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 57.4/57.4 KB 74.6 MB/s eta 0:00:00
Collecting pydantic
  Downloading pydantic-1.10.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (13.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 13.2/13.2 MB 33.8 MB/s eta 0:00:00
Collecting packaging>=14.0
  Downloading packaging-21.3-py3-none-any.whl (40 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 40.8/40.8 KB 43.9 MB/s eta 0:00:00
Collecting websocket-client>=0.32.0
  Downloading websocket_client-1.4.0-py3-none-any.whl (54 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 54.7/54.7 KB 45.2 MB/s eta 0:00:00
Collecting requests>=2.26.0
  Downloading requests-2.28.1-py3-none-any.whl (62 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 62.8/62.8 KB 94.3 MB/s eta 0:00:00
Collecting urllib3>=1.26.0
  Downloading urllib3-1.26.12-py2.py3-none-any.whl (140 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 140.4/140.4 KB 61.9 MB/s eta 0:00:00
Collecting starlette==0.19.1
  Downloading starlette-0.19.1-py3-none-any.whl (63 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 63.3/63.3 KB 68.0 MB/s eta 0:00:00
Collecting typing-extensions>=3.10.0
  Downloading typing_extensions-4.3.0-py3-none-any.whl (25 kB)
Collecting anyio<5,>=3.4.0
  Downloading anyio-3.6.1-py3-none-any.whl (80 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 80.6/80.6 KB 54.9 MB/s eta 0:00:00
Collecting h11>=0.8
  Downloading h11-0.13.0-py3-none-any.whl (58 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 58.2/58.2 KB 62.2 MB/s eta 0:00:00
Collecting click>=7.0
  Downloading click-8.1.3-py3-none-any.whl (96 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 96.6/96.6 KB 67.1 MB/s eta 0:00:00
Collecting pyparsing!=3.0.5,>=2.0.2
  Downloading pyparsing-3.0.9-py3-none-any.whl (98 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 98.3/98.3 KB 64.7 MB/s eta 0:00:00
Collecting idna<4,>=2.5
  Downloading idna-3.3-py3-none-any.whl (61 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 61.2/61.2 KB 77.6 MB/s eta 0:00:00
Collecting certifi>=2017.4.17
  Downloading certifi-2022.6.15-py3-none-any.whl (160 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 160.2/160.2 KB 52.4 MB/s eta 0:00:00
Collecting charset-normalizer<3,>=2
  Downloading charset_normalizer-2.1.1-py3-none-any.whl (39 kB)
Collecting sniffio>=1.1
  Downloading sniffio-1.2.0-py3-none-any.whl (10 kB)
Installing collected packages: websocket-client, urllib3, typing-extensions, sniffio, pyparsing, idna, h11, click, charset-normalizer, certifi, uvicorn, requests, pydantic, packaging, anyio, starlette, docker, fastapi
Successfully installed anyio-3.6.1 certifi-2022.6.15 charset-normalizer-2.1.1 click-8.1.3 docker-6.0.0 fastapi-0.81.0 h11-0.13.0 idna-3.3 packaging-21.3 pydantic-1.10.0 pyparsing-3.0.9 requests-2.28.1 sniffio-1.2.0 starlette-0.19.1 typing-extensions-4.3.0 urllib3-1.26.12 uvicorn-0.18.3 websocket-client-1.4.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
WARNING: You are using pip version 22.0.4; however, version 22.2.2 is available.
You should consider upgrading via the '/usr/local/bin/python -m pip install --upgrade pip' command.
Removing intermediate container 82123560988c
 ---> 631c41afe237
Step 5/6 : COPY ./app /code/app
 ---> 3949f78ebd28
Step 6/6 : CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
 ---> Running in f11f0f03e20b
Removing intermediate container f11f0f03e20b
 ---> fcc871e4bc2e
Successfully built fcc871e4bc2e
Successfully tagged fast_api:latest

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them

🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀
========================
Creating Pod
========================
🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀🚀


pod/fast-api-container-1661888787 created
NAME                            READY   STATUS    RESTARTS   AGE
fast-api-container-1661888787   1/1     Running   0          5s

🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳
========================
Done!
========================
🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳

Forwarding from 127.0.0.1:8000 -> 8000
Forwarding from [::1]:8000 -> 8000
```

### 3.) (for local env) Dockerization with port mapping. Named with date to allow for dynamic name creation

```Shell
>>> ./docker_runner
```

After running that command, you should now be hosting your own FastAPI on your local machine on port 8000

## Notes:

* FastAPI is a direct descendent of Starlette
* Uvicorn is a Python specific ASGI 
* Automatic UI API documentation via [swagger](http://127.0.0.1:8000/docs) and [redoc](http://127.0.0.1:8000/redoc)
* Swagger/Redoc uses function name as header. Spaces created from underscores
  