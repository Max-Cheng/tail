FROM golang

RUN mkdir -p $GOPATH/src/github.com/max-cheng/tail/
ADD . $GOPATH/src/github.com/max-cheng/tail/

# expecting to fetch dependencies successfully.
RUN go get -v github.com/max-cheng/tail

# expecting to run the test successfully.
RUN go test -v github.com/max-cheng/tail

# expecting to install successfully
RUN go install -v github.com/max-cheng/tail
RUN go install -v github.com/max-cheng/tail/cmd/gotail

RUN $GOPATH/bin/gotail -h || true

ENV PATH $GOPATH/bin:$PATH
CMD ["gotail"]
