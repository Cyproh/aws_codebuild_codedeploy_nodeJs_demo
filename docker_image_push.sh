#!  /bin/bash
profile="default"
region="us-east-1"
buildTag="shellscript-demo:latest"

echo "$1"
echo "$2"
echo "$3"

if [[ -n "$1" ]]; then
  profile="$1"
fi

if [[ -n "$2" ]]; then
  region="$2"
fi

if [[ -n "$3" ]]; then
  region="$3"
fi


aws ecr get-login-password --region "$AWS_DEFAULT_REGION" --profile "${profile}" | docker login --username AWS --password-stdin "840971387785.dkr.ecr.us-east-1.amazonaws.com"
docker build -t "${buildTag}" .
docker tag "${buildTag}" "840971387785.dkr.ecr.us-east-1.amazonaws.com/${buildTag}"
docker push "840971387785.dkr.ecr.us-east-1.amazonaws.com/${buildTag}"
