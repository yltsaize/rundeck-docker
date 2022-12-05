FROM rundeck/rundeck:4.8.0-20221110

USER root

# pip for kubernetes-plugin
RUN apt-get update && apt-get install -y \
  pip \
  vim \
  && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/bin/python3 /usr/bin/python

RUN pip install kubernetes \
    && curl -sLo libext/kubernetes-plugin-2.0.8.zip \
    https://github.com/rundeck-plugins/kubernetes/releases/download/2.0.8/kubernetes-plugin-2.0.8.zip

USER rundeck

