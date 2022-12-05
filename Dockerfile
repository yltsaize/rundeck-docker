FROM rundeck/rundeck:4.8.0-20221110

USER root

# pip for kubernetes-plugin
RUN apt-get update && apt-get install -y \
  pip \
  vim \
  && rm -rf /var/lib/apt/lists/* \
  && ln -s /usr/bin/python3 /usr/bin/python

# kubernetes-plugin
RUN pip install kubernetes \
    && curl -sLo libext/kubernetes-plugin-2.0.8.zip \
    https://github.com/rundeck-plugins/kubernetes/releases/download/2.0.8/kubernetes-plugin-2.0.8.zip

# s3-log-plugin
RUN curl -sLo libext/rundeck-s3-log-plugin-1.0.13.jar \
    https://github.com/rundeck-plugins/rundeck-s3-log-plugin/releases/download/v1.0.13/rundeck-s3-log-plugin-1.0.13.jar

USER rundeck
