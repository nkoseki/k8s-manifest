・POD1,2 create
kubectl apply -f ./prune-sample/ --prune -l system=a

* delete pod2 yml file
rm sample-pod2.yml

* prune system=a label 
kubectl apply -f ./prune-sample/ --prune -l system=a
 -> delete pod2

