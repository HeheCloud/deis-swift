
SWIFT_USER_PASSWORD=testing
CNTR=deis-swift
CNTR_IMAGE=cloudmario/deis-swift
DATA_CNTR=deis-swift-data
DATA_CNTR_IMAGE=alpine:3.2
LOCAL_PORT=8888
DOCKER_PORT=8080

all: build delete run_swift_data run_swift

redeploy: delete build run_swift

run_swift_data:
	-docker run \
  	-v /srv \
	--name $(DATA_CNTR) \
    $(DATA_CNTR_IMAGE)

run_swift:
	docker run \
	--name $(CNTR) \
	--hostname $(CNTR) \
	-e "SWIFT_USER_PASSWORD=$(SWIFT_USER_PASSWORD)" \
	-d \
	-p $(LOCAL_PORT):$(DOCKER_PORT) \
	--volumes-from $(DATA_CNTR) \
	-t $(CNTR_IMAGE)

delete:
	-docker rm -f $(CNTR)

bash:
	docker exec -i -t $(CNTR) /bin/bash

build:
	docker build -t $(CNTR_IMAGE) .

logs:
	docker logs $(CNTR)
