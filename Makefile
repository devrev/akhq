include Makefile.sidekick

.PHONY: docker build snyk

docker: .d.docker build
	$(call docker_build,$(PROJECT_NAME)) .

build:
	./gradlew copyShadowJar

snyk: .d.snyk docker
	$(SNYK) container test $(PROJECT_NAME):$(DOCKER_BUILD_TAG) --policy-path=.snyk
