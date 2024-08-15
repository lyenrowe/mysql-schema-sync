#!/bin/bash

platforms=("windows/amd64" "linux/amd64" "darwin/amd64" "darwin/arm64" "linux/arm")
output="mysql-schema-sync"

for platform in "${platforms[@]}"
do
    platform_split=(${platform//\// })
    GOOS=${platform_split[0]}
    GOARCH=${platform_split[1]}
    output_name='builds/'$output'-'$GOOS'-'$GOARCH

    if [ $GOOS = "windows" ]; then
        output_name+='.exe'
    fi

    echo "Building for $GOOS/$GOARCH..."
    env GOOS=$GOOS GOARCH=$GOARCH go build -o $output_name
done
