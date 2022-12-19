DOCKER_IMAGE=p4tutorial:20.04.0
CONTAINER_NAME=p4tutorial_rt

docker: docker-build

docker-build:
	docker inspect "$(DOCKER_IMAGE)" > /dev/null 2>&1 || docker build --network host -t $(DOCKER_IMAGE) .

docker-run:
	docker run -it --rm --privileged --network host --name $(CONTAINER_NAME) -v $(shell pwd)/..:/opt/dataplane-p4 $(DOCKER_IMAGE) bash

docker-exec:
	docker exec -it $(CONTAINER_NAME) bash

docker-clean:
	# docker rm $(shell docker ps -aq)
	-docker stop $(CONTAINER_NAME)
	-docker rm $(CONTAINER_NAME)
	-docker rmi $(DOCKER_IMAGE) -f
	docker image prune -af

clean:
	@echo ----------- Cleaning up temp files -----------
