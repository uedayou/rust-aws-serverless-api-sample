# rust-aws-serverless-api-sample

Rust と AWS Lambda、Amazon API Gateway を利用した Web API 開発のサンプルコードです。

Docker を利用してビルドし、AWS SAM CLIにより、AWS上にデプロイできます。
必要に応じて、`template.yaml`、`src/main.rs`、`Cargo.toml`を書き換えてください。

## ビルド

```
$ docker image build -t rust-lambda-build -f Dockerfile.build .
$ docker container run --rm -v $PWD:/code -v $HOME/.cargo/registry:/root/.cargo/registry -v $HOME/.cargo/git:/root/.cargo/git rust-lambda-build
```

## AWS SAM CLI によるデプロイ

```
$ sam package --template-file template.yaml --output-template-file packaged.yaml --s3-bucket S3_BUCKET_NAME
$ sam deploy --template-file packaged.yaml --stack-name PROJECT_NAME --capabilities CAPABILITY_IAM
```

## サンプルAPIのアクセス方法

```
https://${ID}.execute-api.${Region}.amazonaws.com/Prod/sample?name=hoge
```