#!/bin/bash

# "Deploy"... this doesn't really do anything to push to production
# but it does make a marker in honeycomb _representing_ a deploy.

source ./.env

sha=$(git rev-parse HEAD)

echo "Dataset: $HONEYCOMB_DATASET"
echo "Current SHA: " $sha

# this creates a deploy marker in Honeycomb

curl https://api.honeycomb.io/1/markers/$HONEYCOMB_DATASET -X POST  \
    -H "X-Honeycomb-Team: $HONEYCOMB_API_KEY"  \
    -d "{\"message\":\"commit $sha\", \"type\":\"deploy\"}"
