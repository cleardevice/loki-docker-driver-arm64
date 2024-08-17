LOKI_DRIVER_VERSION=$1

docker buildx build -t rootfsimage . --build-arg LOKI_DRIVER_VERSION=$LOKI_DRIVER_VERSION --platform linux/arm64
id=$(docker create rootfsimage true)
mkdir -p plugin/rootfs
docker export "$id" | tar -x -C plugin/rootfs
docker rm -vf "$id"
docker rmi rootfsimage

cp config.json plugin/
