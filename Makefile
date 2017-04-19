BINARY=fotu

VERSION=1.0.0
BUILD=`date +%FT%T%z`
LDFLAGS=-ldflags "-X main.VersionNumber=${VERSION} -X main.BuildNumber=${BUILD}"

.PHONY: build


clean:
	docker-compose -f docker-compose.yaml down
	if [ -f ${BINARY} ] ; then rm ${BINARY} ; fi

build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build ${LDFLAGS} -o ${BINARY}
	chmod +x ${BINARY}

mac:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build ${LDFLAGS} -o ${BINARY}

build-docker:
	docker build -t local/fotu .

up: clean build
	docker-compose -f docker-compose.yaml build
	docker-compose -f docker-compose.yaml up
