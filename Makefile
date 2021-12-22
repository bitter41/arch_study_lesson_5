all: build run
build:
	docker build -t archstudylesson5 .
tests:
	docker run -it --rm --name archstudylesson5 archstudylesson5 prove -r ./t
run:
	docker run -it --rm --name archstudylesson5 archstudylesson5
test:
	docker run -it --rm --name archstudylesson5 archstudylesson5 perl ./t/Calc/Calculator/ReversePolish/main_int.t

