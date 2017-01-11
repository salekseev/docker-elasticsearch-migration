NAME = salekseev/elasticsearch-migration
VERSION = 2.0.3

OPEN := $(shell command -v open 2> /dev/null)

ifndef OPEN
	PORT = 9200
else
	PORT := $(shell awk -v min=2000 -v max=65000 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
endif

.PHONY: all build run clean

all: build run

build:
	docker build -t $(NAME):$(VERSION) --rm .

run:
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if type open; then sleep 10 && open http://localhost:$(PORT); fi &
	docker run --rm -p $(PORT):9200 $(NAME):$(VERSION)

clean:
	docker rmi $(NAME):$(VERSION)
