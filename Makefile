

APP_DIR="app"
BACKEND_DIR="backend"

###################### API

help::
	@echo "COMMANDS:"
	@echo "init 		init new project"
	@echo "up 		start existing project"
	@echo "down 		stop running project"
	@echo "cleanup  	cleanup whole existing project (files, containers, volumes)"

init::
	${MAKE} _up
	${MAKE} _init-next
	${MAKE} _init-strapi
	@echo "Next.js and strapi.io are initialized"
	@echo "#####################################"
	@echo "Please Add following commands to the scripts section in ${APP_DIR}/packages.json"
	@echo 	"{\n" \
			"  \"dev\": \"next\",\n" \
    		"  \"build\": \"next build\",\n" \
    		"  \"start\": \"next start\"\n" \
			"}"
	@echo "And then run 'make up'"

up::
	${MAKE} _up
	${MAKE} _strapi-start & ${MAKE} _start-next

down::
	docker-compose down

cleanup::
	docker-compose down -v
	rm -Rf ${APP_DIR}
	rm -Rf ${BACKEND_DIR}

####################### Commands

_up::
	docker-compose up -d

_start-strapi::
	cd ${BACKEND_DIR} && strapi start

_start-next::
	cd ${APP_DIR} && yarn dev

_init-next::
	mkdir ${APP_DIR}
	cd ${APP_DIR} && yarn init -y
	cd ${APP_DIR} && yarn add --prefer-offline react react-dom next
	cd ${APP_DIR} && mkdir pages

_init-strapi::
	strapi new ${BACKEND_DIR} --dbclient=postgres --dbhost=0.0.0.0 --dbport=8086 --dbname=strapi --dbusername=toor --dbpassword=toor --dbforce
	cd ${BACKEND_DIR} && strapi install graphql
	cd ${BACKEND_DIR} && strapi install documentation
