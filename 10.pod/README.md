# command でsleep, infinityを追加する理由

ContainerがExit(0)で終了し、CrashLoopBackOffになるのを避けるため
https://stackoverflow.com/questions/44576439/why-is-there-sleep-infinity-in-the-kubernetes-yaml-file-for-spark

spec:
  containers:
    - name: my-work-container
      image: alpine:latest
      command:
        - sleep
        - infinity


他にも、こんなやり方があるっぽい
https://release.com/blog/kubernetes-how-to-debug-crashloopbackoff-in-a-container

    spec:
      containers:
      - command:
        - tail
        - "-f"
        - /dev/null

# 最初にローカルのイメージを検索して欲しい場合

spec:
  containers:
    - name: my-ubuntu-container
      #image: ubuntu:20.04
      #image: nkoseki/ubuntu18:v01 # containerのimage
      # docker.ioに見にいってエラーになる場合、最初にローカルのimageを見るように変更する
      # デフォルトではkubeletはコンテナイメージレジストリに問い合わせて、イメージのダイジェストの名前解決を行う(つまりレジストリに問い合わせる)
      imagePullPolicy: IfNotPresent

