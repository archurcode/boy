#!/bin/sh

rtt=$(git describe --tags `git rev-list --tags --max-count=1`)
#rt=${rtt#*v} # release version

rc=$(git rev-parse --short HEAD)
#rc=$(git rev-parse HEAD)
rb=$(git rev-parse --abbrev-ref HEAD)
echo $rtt
echo $rc
echo $rb
echo $GIT_BRANCH_IMAGE_VERSION
echo $GIT_BRANCH_TAG

https://github.com/archurcode/girl.git
cd girl

git checkout $GIT_BRANCH_TAG --

if [ $? -eq 0 ]; then
  echo "ok"
else
  echo "fail"
  git checkout -b $rb
fi

git tag $rtt
git push --tags
