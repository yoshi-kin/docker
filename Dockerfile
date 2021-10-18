FROM centos:7

# デフォルトシェルの指定
SHELL ["/bin/bash", "-c"]

# ホームディレクトリ(/root)に移動
WORKDIR /root

# 必要なパッケージをインストール
RUN yum -y update
RUN yum install -y https://repo.ius.io/ius-release-el7.rpm
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip
    
COPY google.chrome.repo /etc/yum.repos.d/google.chrome.repo
RUN yum install -y google-chrome-stable

RUN pip3 install selenium
RUN pip3 install chromedriver-binary==94.*

COPY test_selenium.py /test_selenium.py
ENTRYPOINT python3 test_selenium.py

# requirements.txtに記載されたパッケージをインストール
# ADD requirements.txt /root
# RUN echo `pwd`
# RUN ls -al
# RUN pip3 install --upgrade pip
# RUN pip3 install -r requirements.txt
