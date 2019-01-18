FROM golang:1.11-alpine as build

RUN apk add --no-cache gcc libc-dev git \
    && go get -u github.com/nektos/act

FROM alpine:3.8
COPY --from=build /go/bin/act /usr/local/bin/act
# bash is needed for sh -c '...' used by docker/GitLab's CMD
# git is are needed by act
# not creating /github/workspace as path is /build/$CI_PROJECT_NAME
RUN apk add --no-cache bash git \
    && sed -i '1croot:x:0:0:root:/root:/bin/bash' /etc/passwd \
    && mkdir -p /github/home /github/workflow

WORKDIR /github/workspace
