.DEFAULT_GOAL:=build
fmt:
	go fmt ./*.go
	goimports -l -w ./*.go
.PHONY:fmt
lint:fmt
	golint ./*.go
.PHONY:lint
vet:fmt
	go vet ./*.go
.PHONY:vet
build:vet
	go build -o binary ./*.go
	./binary
.PHONY:build
