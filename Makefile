all: run

run:
	sudo docker run -v $(shell pwd):/output -v $(shell pwd)/${NAME}:/data/temp.pdf shaneburkhart/pdftk

build:
	sudo docker build -t shaneburkhart/pdftk .
