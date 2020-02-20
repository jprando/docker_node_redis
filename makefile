.DEFAULT_GOAL := help

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Bruno F DalCol

setup: ## preparar pasta node_modules
	docker run -ti --rm --name pub-node-srv \
		-v ${PWD}:/app \
		-w /app \
		-u node \
	node:alpine yarn init -y
	docker run -ti --rm --name pub-node-srv \
		-v ${PWD}:/app \
		-w /app \
		-u node \
	node:alpine yarn add nodemon redis

clean: ## limpa o ambiente
	rm -Rf node_modules yarn-error.log yarn.lock package.json .yarn .pnp.js .yarnrc.yml
	ls -la

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
	docker run -ti --rm --name pub-node-srv \
		--link redis-srv:redis-db \
		-v ${PWD}:/app \
		-w /app \
	node:alpine \
	yarn exec nodemon -w /app /app/pub.js

stop_pub: ## parar o container pub-node-srv
	docker stop pub-node-srv

_rm_pub: ## destroi o container pub-node-srv
	make stop_pub
	docker rm pub-node-srv

##@ Docker Node Sub

run_sub: ## iniciar o container s00-sub-node-srv
		docker run -ti --rm --name s00-sub-node-srv \
			--link redis-srv:redis-db \
			-v ${PWD}:/app \
			-w /app \
		node:alpine \
		yarn exec nodemon /app/sub.js

stop_sub: ## parar o container s00-sub-node-srv
	docker stop s00-sub-node-srv

_rm_sub: ## destroi o container s00-sub-node-srv
	make stop_sub
	docker rm s00-sub-node-srv

##@ Docker Node Sub 01

run_sub1: ## iniciar o container s01-sub-node-srv
		docker run -ti --rm --name s01-sub-node-srv \
			--link redis-srv:redis-db \
			-v ${PWD}:/app \
			-w /app \
		node:alpine \
		yarn exec nodemon /app/sub.js

stop_sub1: ## parar o container s01-sub-node-srv
	docker stop s01-sub-node-srv

_rm_sub1: ## destroi o container s01-sub-node-srv
	make stop_sub1
	docker rm s01-sub-node-srv

##@ Docker Node Sub 02

run_sub2: ## iniciar o container s02-sub-node-srv
		docker run -ti --rm --name s02-sub-node-srv \
			--link redis-srv:redis-db \
			-v ${PWD}:/app \
			-w /app \
		node:alpine \
		yarn exec nodemon /app/sub.js

stop_sub2: ## parar o container s02-sub-node-srv
	docker stop s02-sub-node-srv

_rm_sub2: ## destroi o container s02-sub-node-srv
	make stop_sub2
	docker rm s02-sub-node-srv

##@ Docker Node Sub

run_sub3: ## iniciar o container s03-sub-node-srv
		docker run -ti --rm --name s03-sub-node-srv \
			--link redis-srv:redis-db \
			-v ${PWD}:/app \
			-w /app \
		node:alpine \
		yarn exec nodemon /app/sub.js

stop_sub3: ## parar o container s03-sub-node-srv
	docker stop s03-sub-node-srv

_rm_sub3: ## destroi o container s03-sub-node-srv
	make stop_sub3
	docker rm s03-sub-node-srv
