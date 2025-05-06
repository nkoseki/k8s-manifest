#!/bin/bash

# app-1
kubectl exec -it sample-ingress-apps-1 -- mkdir /usr/share/nginx/html/path1/
kubectl exec -it sample-ingress-apps-1 -- cp /etc/hostname  /usr/share/nginx/html/path1/index.html
kubectl exec -it sample-ingress-apps-1 -- echo "Hello1111" > /usr/share/nginx/html/index.html


# app-2
kubectl exec -it sample-ingress-apps-2 -- mkdir /usr/share/nginx/html/path2/
kubectl exec -it sample-ingress-apps-2 -- cp /etc/hostname  /usr/share/nginx/html/path2/index.html
kubectl exec -it sample-ingress-apps-1 -- echo 'Hello22222' > /usr/share/nginx/html/index.html

# app-default
kubectl exec -it sample-ingress-default -- cp /etc/hostname  /usr/share/nginx/html/index.html
