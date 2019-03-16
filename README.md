# docker-yandex-disk

run yandex disk with docker

docker build -f Dockerfile -t yd:v1 .

docker image ls

docker run --rm -it --volume=$(pwd)/config:/root/.config/:rw --volume=$(pwd)/data:/root/Yandex.Disk:rw 819a6b0b3c74 yandex-disk setup
