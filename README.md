# vsftpd

[![Docker Build Status](https://img.shields.io/docker/build/dakalab/vsftpd.svg?style=plastic)](https://hub.docker.com/r/dakalab/vsftpd/builds/)
[![Docker Pulls](https://img.shields.io/docker/pulls/dakalab/vsftpd.svg)](https://hub.docker.com/r/dakalab/vsftpd)
[![License](https://img.shields.io/github/license/dakalab/vsftpd.svg)](https://github.com/dakalab/vsftpd)

This image contains vsftpd server configured with only one user `files` with volume `/home/files`. Password is set from `FTP_PASS` env variable or automatically generated if not provided.

## Usage

```bash
docker run -it -d -v ${PWD}/files:/home/files \
-p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
-e FTP_PASS=your-password --name vsftpd --restart=always dakalab/vsftpd
```
