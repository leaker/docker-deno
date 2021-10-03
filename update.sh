#!/usr/bin/env bash
function make_latest() {
  local ver=`curl -s https://api.github.com/repos/denoland/deno/releases/latest | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g'`
  # echo "last version: $ver"
  local version_root=`echo $ver | grep -Eo "v[0-9]+" | head -n 1`
  # echo "root: ${version_root}"
  local docker_folder="${version_root}/$ver"
  # echo "docker_folder: $docker_folder"
  # docker_folder+="/Dockerfile"
  local docker_file='Dockerfile'
  local docker_path=$version_root/$ver/$docker_file
  echo $docker_path
  if [ -f ./$docker_path ]; then
    echo "::set-output name=updated::0"
    return
  fi
  mkdir -p $docker_folder
  echo 'FROM ubuntu:latest
WORKDIR /root
ENV PATH=/root/.deno/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN apt update -y && apt upgrade -y && apt install -y curl unzip
RUN curl -fsSL https://deno.land/x/install/install.sh | sh -s '$ver'
ENTRYPOINT ["deno"]
' > $docker_path
  echo "::set-output name=updated::1"
  echo "::set-output name=dockerfile::$docker_path"
}

make_latest