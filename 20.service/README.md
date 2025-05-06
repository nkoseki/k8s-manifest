# curlなどが入ったイメージを使って疎通確認する方法

### 試験用Podに入る場合
kubectl run -it --image=nkoseki/toolbox:latest -i testpod -- /bin/bash

`exit`で抜けて入り直す場合
kubectl attach -it testpod -c testpod

### 一時的に試験用Podを立ち上げて試験する場合

kubectl run --image=nkoseki/toolbox:latest --restart=Never --rm -i testpod -- curl -s http://sample-clusterip:8080

