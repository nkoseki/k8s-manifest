#!/bin/bash

#### コマンド実行後、コンテナVM削除
#kubectl run --image=centos --restart=Never --rm -i testpod -- curl -s http://sample-clusterip:8080
#kubectl run --image=centos --restart=Never --rm -i testpod -- ping sample-clusterip

#### コンテナ起動してログイン
kubectl run -it --image=centos -i testpod -- /bin/bash
