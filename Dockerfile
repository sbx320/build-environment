FROM ubuntu:zesty

RUN apt-get update && apt-get install -y \
	software-properties-common \
	ca-certificates \
	git \
	wget

# add toolchain repo
RUN add-apt-repository ppa:ubuntu-toolchain-r/test

# add clang repo 
RUN echo deb http://apt.llvm.org/zesty/ llvm-toolchain-zesty-5.0 main > /etc/apt/sources.list.d/llvm.list && \
	wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add

# install compilation dependencies
RUN apt-get update && apt-get install -y \
	clang-5.0 \
	clang++-5.0 \
	ninja-build \
	build-essential && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
