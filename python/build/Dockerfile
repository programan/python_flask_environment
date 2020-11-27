FROM python:3.9-buster

ARG UID
ARG GID
ARG UNM

RUN set -x \
  && apt update \
  && apt install -y \
  gosu \
  less \
  vim \
  nano \
  unzip \
  wget \
  sudo \
  locales \
  && sed -i -e 's/^# ja_JP\.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/g' /etc/locale.gen \
  && locale-gen \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN set -x \
  && pip install --upgrade pip --no-cache-dir \
  && pip install flask

WORKDIR /tmp


ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# 開発用ユーザー作成
RUN groupadd -g ${GID} ${UNM}
RUN useradd -u ${UID} -g ${UNM} -ms /bin/bash ${UNM}
RUN echo "${UNM} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# COPY ./docker-entrypoint.sh /
# RUN chmod 775 /docker-entrypoint.sh
# ENTRYPOINT ["/docker-entrypoint.sh"]


# # EXPOSEは公開を宣言するだけで、マッピングはされない
EXPOSE 10080 10080

WORKDIR /apps

# `docker-compose exec --user hoge app bash`
# USER ${APACHE_RUN_USER}
# USER ${UNM}


# volumeマウントさていない場所でvenvをする
# python -m venv /home/buhi/pyvenv_dir/test2_venv
# source /home/buhi/pyvenv_dir/test2_venv/bin/activate
