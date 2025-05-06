動かす場合

🔹その１：minikube tunnelで動かす

# minikube tunnel

# kubectl get ing
 →ingressコントローラのIP確認

# curl --resolve example.com:80:10.96.68.220 http://example.com/a

🔹その２：kubectl port-forwardで動かす

# kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80

# curl --resolve example.com:8080:127.0.0.1 http://example.com:8080/a

