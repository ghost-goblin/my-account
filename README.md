# 🚀 NodeJS Express Boilerplate Image

## Install NodeJS
- Install [Chocolatey](https://chocolatey.org/install)
```bash
choco install nodejs-lts
node -v
```

## Init NodeJS

```bash
npm init -y
```

## Authenticate with Docker

```bash
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin <id>.dkr.ecr.eu-west-2.amazonaws.com
```

## Build the Image

```bash
docker build --tag nodejs-express .
```

## Push the Image to ECR

```bash
docker tag nodejs-express <id>.dkr.ecr.eu-west-2.amazonaws.com/nodejs-express:latest
docker push <id>.dkr.ecr.eu-west-2.amazonaws.com/nodejs-express:latest
```

## Run the Image

```bash
docker run -d -p 3000:3000 nodejs-express
```
