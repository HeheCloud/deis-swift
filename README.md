# Deis Swift

Swift for use in the [Deis@HeheCloud](http://hehecloud.com/) open source PaaS.

Please add any [issues](https://github.com/HeheCloud/deis-swift/issues) you find with this software to the Project.

## Usage

```
$ docker build -t hehecloud/deis-swift .
$ docker run --name deis-swift-data -v /srv alpine:3.2
$ docker run --name deis-swift \
  --rm \
  --hostname deis-swift \
  -e "SWIFT_USER_PASSWORD=123456" \
  -p 8888:8080 \
  --volumes-from deis-swift-data \
  hehecloud/deis-swift
```


## Additional Resources

* [HeheCloud](http://hehecloud.com/)
* [Deis中文指南](http://deis.heheapp.com/)
