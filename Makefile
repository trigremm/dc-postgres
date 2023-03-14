.PHONY: ps logs up restart rebuild recreate stop down shell runshell

all: ps

ps:
	docker-compose ps

logs:
	docker-compose logs -f --tail 100
	
up:
	docker-compose up -d
	sleep 1
	docker-compose ps

restart:
	docker-compose restart
	sleep 1
	docker-compose ps

rebuild:
	docker-compose up -d --build
	sleep 1
	docker-compose ps

recreate:
	docker-compose up -d --force-recreate
	sleep 1
	docker-compose ps

stop:
	docker-compose stop
	docker-compose ps

down:
	docker-compose down
	docker-compose ps

shell: 
	docker-compose exec postgres sh 	

runshell:
	docker-compose run postgres sh
