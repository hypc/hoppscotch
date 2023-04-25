configure-env:
	cp hoppscotch.env hoppscotch/.env
	echo "BASE_DOMAIN=$(BASE_DOMAIN)" >> hoppscotch/.env

build-hoppscotch-backend: configure-env
	docker build -f hoppscotch/packages/hoppscotch-backend/Dockerfile --target prod -t hypc/hoppscotch-backend hoppscotch

build-hoppscotch: configure-env
	docker build -f hoppscotch/packages/hoppscotch-selfhost-web/Dockerfile -t hypc/hoppscotch hoppscotch

build-hoppscotch-admin: configure-env
	docker build -f hoppscotch/packages/hoppscotch-sh-admin/Dockerfile -t hypc/hoppscotch-admin hoppscotch

build-proxyscotch:
	docker build -f proxyscotch/Dockerfile -t hypc/proxyscotch proxyscotch

build: build-hoppscotch-backend \
	build-hoppscotch \
	build-hoppscotch-admin \
	build-proxyscotch
