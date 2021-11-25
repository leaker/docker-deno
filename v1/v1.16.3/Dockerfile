FROM ubuntu:latest
WORKDIR /root
ENV PATH=/root/.deno/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN apt update -y && apt upgrade -y && apt install -y curl unzip
RUN curl -fsSL https://deno.land/x/install/install.sh | sh -s v1.16.3
ENTRYPOINT ["deno"]

