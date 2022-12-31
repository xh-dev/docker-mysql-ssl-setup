#! /bin/bash
pushd "$(pwd)/mysql"
echo "start mysql"

echo "remove ./mysql/certs"
rm -fr certs
echo "cp ../ssl/certs to ./mysql/cert"
cp -R ../ssl/certs .
popd


