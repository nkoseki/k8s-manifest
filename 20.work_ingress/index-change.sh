#!/bin/bash

num=1

for pod in `kubectl get pod -l app=sample-app |awk ' /^sample/ {print $1}'`; do
  echo "Server${num}!!!" > server_tmp
	kubectl cp server_tmp ${pod}:/usr/share/nginx/html/index.html
	index_content=`kubectl exec -it ${pod} -- cat /usr/share/nginx/html/index.html`
  echo "------------"
  echo "num:${num}"
  echo "pod:${pod}"
	echo "index:${index_content}"
	#echo "<${num}>:<${pod}>:<${index_content}>"
  rm server_tmp
	num=$((num+1))
done
	
