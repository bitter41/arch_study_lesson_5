FROM rigetti/lisp

COPY . /usr/src/calc
WORKDIR /usr/src/calc
ENTRYPOINT [ "/usr/bin/sbcl", "--script", "calc.lisp" ]
