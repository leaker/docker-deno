FROM ubuntu:latest
WORKDIR /root
RUN apt update -y && apt upgrade -y && apt install -y curl unzip && curl -fsSL https://deno.land/x/install/install.sh | sh
ENV PATH=/root/.deno/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENTRYPOINT ["deno"]
