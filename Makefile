SHA=$(shell git rev-parse --short HEAD)

build:
	@docker build -t goodeggs/rate-limiting-log-proxy:latest --squash .
	@docker history goodeggs/rate-limiting-log-proxy:latest

release: build
	@docker tag goodeggs/rate-limiting-log-proxy:latest goodeggs/rate-limiting-log-proxy:$(SHA)
	@docker push goodeggs/rate-limiting-log-proxy:$(SHA)
	@docker push goodeggs/rate-limiting-log-proxy:latest
