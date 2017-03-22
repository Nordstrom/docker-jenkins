image_name := jenkins
image_registry := quay.io/nordstrom
image_release := 2.49

.PHONY: build/image tag/image push/image

ifdef http_proxy
build_args += --build-arg=http_proxy=$(http_proxy)
build_args += --build-arg=HTTP_PROXY=$(http_proxy)
build_args += --build-arg=https_proxy=$(http_proxy)
build_args += --build-arg=HTTPS_PROXY=$(http_proxy)
endif

build/image:
	docker build $(build_args) -t $(image_name) .

tag/image: build/image
	docker tag $(image_name) $(image_registry)/$(image_name):$(image_release)

push/image: tag/image
	docker push $(image_registry)/$(image_name):$(image_release)
