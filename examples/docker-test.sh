#
# example of how to run this tests using docker image
#
#

container=TOML_UNION
target=./tmp/out

#
# remove previous container
#
docker container rm ${container}  || true

#
# mount and run
#
docker run -it --name ${container}  \
    -v "$(pwd)"/input:/toml_union/input \
    pasaopasen/toml-union \
    python toml_union.py ./input -o /out/output.toml -r /out/report.json \
        -k tool.poetry.name=union \
        -k tool.poetry.version=12

#
# remove previous output
#

rm -rf $target

#
# extract output
#

mkdir -p "$(dirname "$target")"
docker cp ${container}:/out $target

echo "Results in ${target}:"
ls -lah $target
