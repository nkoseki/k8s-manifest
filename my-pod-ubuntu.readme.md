command でsleep, infinity

https://release.com/blog/kubernetes-how-to-debug-crashloopbackoff-in-a-container
理由は書いていないが・・

    spec:
      containers:
      - command:
        - tail
        - "-f"
        - /dev/null

ここに理由が書いていた。
ContainerがExitしないようにしているせいか・・・
https://stackoverflow.com/questions/44576439/why-is-there-sleep-infinity-in-the-kubernetes-yaml-file-for-spark

