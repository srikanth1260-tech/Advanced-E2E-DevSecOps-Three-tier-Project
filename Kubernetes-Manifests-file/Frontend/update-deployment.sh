#!/usr/bin/env bash
set -e

git config user.email "srikk1260@gmail.com"
git config user.name "srikanth1260-tech"

echo "$BUILD_NUMBER"
imageTag=$(grep -oP '(?<=frontend:)[^ ]+' deployment.yaml)
echo "$imageTag"

sed -i "s/${AWS_ECR_REPO_NAME}:${imageTag}/${AWS_ECR_REPO_NAME}:${BUILD_NUMBER}/" deployment.yaml

git add deployment.yaml
git commit -m "Update deployment Image to version $BUILD_NUMBER"
git push "https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME}" HEAD:main

~                                                                                                                       ~                                                                                                                       ~                                          
