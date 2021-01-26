#
# Credit: Huan LI <zixia@zixia.net> github.com/huan
#
.PHONY: test
test:
	./scripts/test.sh

.PHONY: build
build:
	docker build -t bbs .

.PHONY: run
run:
	./scripts/run.sh

.PHONY: pull
pull:
	docker pull ghcr.io/zixia/bbs

.PHONY: clean
clean:
	docker rmi bbs

.PHONY: version
version:
	./scripts/version.sh
