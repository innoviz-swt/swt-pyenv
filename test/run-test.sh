cd $(dirname $0)

base="${1:-focal}" 
ver="${2:-latest}" 

mkdir -p ./out
docker run --rm -it -v $(pwd)/out:/tmp/out -v $(pwd)/test-script.sh:/tmp/test-script.sh swt-pyenv-$base:$ver /tmp/test-script.sh