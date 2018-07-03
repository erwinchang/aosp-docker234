DOCKER = docker
IMAGE = erwinchang/aosp-234

aosp: Dockerfile
	$(DOCKER) build -t $(IMAGE) .

all: aosp

.PHONY: all
