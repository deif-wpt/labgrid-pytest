#!/bin/bash 

name=labgrid-pytest

# Possible to give --no-cache  as argument
docker build $1 -t $name . | tee /tmp/dockerbuild$$.log
# Successfully built bc76a34db968
tag=`awk '/^Successfully built/{print $3}' /tmp/dockerbuild$$.log | tail -1`
rm /tmp/dockerbuild$$.log

if [ "$tag" = "" ] ; then
  echo Build Failed
  exit 2
fi

echo docker tag $tag kjeldflarup/labgrid-pytest:firsttry
docker tag $tag kjeldflarup/labgrid-pytest:firsttry

echo Manually do:
echo docker push kjeldflarup/labgrid-pytest

