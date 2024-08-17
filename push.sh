LOKI_DRIVER_VERSION=$1

docker plugin create cleardevice/loki-docker-driver-arm64:$LOKI_DRIVER_VERSION plugin/
docker plugin push cleardevice/loki-docker-driver-arm64:$LOKI_DRIVER_VERSION
docker plugin rm cleardevice/loki-docker-driver-arm64:$LOKI_DRIVER_VERSION

docker plugin create cleardevice/loki-docker-driver-arm64 plugin/
docker plugin push cleardevice/loki-docker-driver-arm64
