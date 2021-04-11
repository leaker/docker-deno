# docker-deno

[![dockeri.co](https://dockeri.co/image/leaker/deno)](https://registry.hub.docker.com/r/leaker/deno)

[![GitHub issues](https://img.shields.io/github/issues/leaker/docker-deno.svg "GitHub issues")](https://github.com/leaker/docker-deno)
[![GitHub stars](https://img.shields.io/github/stars/leaker/docker-deno.svg "GitHub stars")](https://github.com/leaker/docker-deno)

The Deno docker image, made with love by the deno community.

## Table of Contents

- [What is Deno?](#what-is-deno)
- [How to use this image](#how-to-use-this-image)
    - [Create a `Dockerfile` in your Deno app project](#create-a-dockerfile-in-your-deno-app-project)
    - [Run a single Deno script](#run-a-single-deno-script)
- [License](#license)

## What is Deno?

Deno is a _simple_, _modern_ and _secure_ runtime for **JavaScript** and
**TypeScript** that uses V8 and is built in Rust.

See: https://deno.land/

## How to use this image

### Create a `Dockerfile` in your Deno app project

```dockerfile
FROM leaker/deno:latest
# replace this with your application's default port
EXPOSE 6666
```

You can then build and run the Docker image:

```console
$ docker build -t my-deno-app .
$ docker run -it --rm --name my-running-app my-deno-app
```

If you prefer Docker Compose:

```yml
version: "2"
services:
  deno:
    image: leaker/deno
    working_dir: /home/deno/app
    volumes:
      - ./:/home/deno/app
    expose:
      - "6666"
    command: "deno run app.ts"
```

You can then run using Docker Compose:

```console
$ docker-compose up -d
```

### Run a single Deno script

For many simple, single file projects, you may find it inconvenient to write a
complete `Dockerfile`. In such cases, you can run a Deno script by using the
Deno Docker image directly:

```console
$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/app -w /usr/src/app deno:latest deno your-script.ts
```

## License

[License information](https://github.com/denoland/deno/blob/main/LICENSE.md) for
the software contained in this image. [License information](LICENSE) for the
Deno Docker project.
