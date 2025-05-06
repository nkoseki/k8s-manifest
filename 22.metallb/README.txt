(1) metallbのインストール →Curlで反応しない
LB ServiceでEXTERNAL-IPがPendingになるため、外部LBであるMetalLBをインストールしてみる
https://zenn.dev/vampire_yuta/articles/ccbc57be8e092a

### kube-proxyのローバラをiptableからipvsに変更する

# see what changes would be made, returns nonzero returncode if different
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system

# actually apply the changes, returns nonzero returncode on errors only
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system


### manifestでインストール
### あとで使い回すのでファイルでDL
curl -OL https://raw.githubusercontent.com/metallb/metallb/v0.14.8/config/manifests/metallb-native.yaml
kubectl apply -f metallb-native.yaml

### ipaddressPoolを指定
以下のファイル作ってapply
・IPアドレスは
minikube ip
　コマンドで確認可能(kubectl get node -o wideと同じ）

kubectl apply -f ipaddresspool.yaml

[koseki@mymac metallb]$ cat ipaddresspool.yaml
---------------------------------------
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: default
  namespace: metallb-system
spec:
  addresses:
#  - 192.168.56.100-192.168.56.110
  - 192.168.49.2/32 ###### Kube Nodeしか指定できない。なんで？？？
  autoAssign: true
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: default
  namespace: metallb-system
spec:
  ipAddressPools:
  - default
---------------------------------------

### Service をデプロイする
・結局これだと、Serviceが一つしか割り当てられないので、何かが間違っている

kubectl apply -f nginx.yaml

### EXTERNAL-IPが割り当てられたことを確認
kubectl get svc

### 疎通確認
curl 192.168.49.2:8080

### 削除する場合
kubectl delete -f xxx.yaml

