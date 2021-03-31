#!/bin/bash

cd /code
cargo build --release
rm -f lambda.zip
cd target/release/
zip lambda.zip bootstrap
mv lambda.zip ../../
cd ../../
