# Spring Music for Kubernetes Service Catalog

To deploy Spring Music, with a service instance/binding from your Service Catalog:

```shell
helm upgrade --install spring-music . \
    --set "database.service.class=cleardb,database.service.plan=spark"
```

In the example above, it is assumed that your Service Catalog has a service class "cleardb" with a service plan "spark".

To run Spring Music without a database service instnace/binding:

```shell
helm upgrade --install spring-music . \
    --set "database.service.class=null"
```
