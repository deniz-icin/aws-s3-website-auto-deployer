# aws-s3-website-auto-deployer
This program can create a s3 bucket website with the given static website github repository.

This project uses Makefile in order to providing options for create and destroy commands.

## Dependencies
1. [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
2. Make
### Make for Ubuntu
`sudo apt install make`
### Make for Manjaro
`sudo pacman -S base-devel`
## How to use?
> **Warning**

> index.html document must be in root directory.
### First, set environment variables
``` bash
export AWS_REGION="eu-central-1"
export GIT_REPO="https://github.com/cloudacademy/static-website-example.git"
export BUCKET_NAME="static-example-bucket123"
export FOLDER_NAME="static-website-example/"
export INDEX_DOC_PATH="index.html"
export ERROR_DOC_PATH="error/index.html"
```
### Create
``` bash
make create
```
### Destroy
``` bash
make destroy
```