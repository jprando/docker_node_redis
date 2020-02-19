.DEFAULT_GOAL := help

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Bruno F DalCol

##@ Docker Redis

run_redis: ## iniciar o container redis-srv
	docker run -d --rm --name redis-srv \
		-p 6379:6379 \
	redis:alpine

stop_redis: ## parar o container redis-srv
	docker stop redis-srv

_rm_redis: ## destroi o container redis-srv
	make stop_redis
	docker rm redis-srv

##@ Docker Node Pub

run_pub: ## inciar o container pub-node-srv
	docker run -d --rm --name pub-node-srv node:alpine

stop_pub: ## parar o container pub-node-srv
	docker stop pub-node-srv

_rm_pub: ## destroi o container pub-node-srv
	make stop_pub
	docker rm pub-node-srv

##@ Docker Node Sub

run_sub: ## iniciar o container sub-node-srv
	docker run -d --rm --name sub-node-srv node:alpine

stop_sub: ## parar o container sub-node-srv
	docker stop sub-node-srv

_rm_sub: ## destroi o container sub-node-srv
	make stop_sub
	docker rm sub-node-srv
