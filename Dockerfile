FROM postgres

# デフォルトシェルの指定
SHELL ["/bin/bash", "-c"]

# ホームディレクトリ(/root)に移動
WORKDIR /root

# postgresサービス起動
RUN sudo /etc/init.d/postgresql start

ENV POSTGRES_USER=postgres
ENV POSTGRES_PORT=5432
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=in_system

EXPOSE 5432
    
COPY ./sql/1_create_table.sql ./docker-entrypoint-initdb.d