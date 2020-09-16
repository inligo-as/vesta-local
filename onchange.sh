#!/bin/bash

echo "Updating and rebuilding plugins..."

rm -rf ../vesta-local/vesta/vesta/local/vesta/plugins/*
cp -r ../vesta-plugins/* ../vesta-local/vesta/vesta/local/vesta/plugins/

cd ../vesta-plugins

for plugin in ./*
do
    the_plugin=$(echo $plugin | python3 -c "a=input();print(a[2:])")
    docker exec vesta-docker /usr/local/vesta/bin/v-rebuild-plugin $the_plugin
done

echo "Updated plugins."