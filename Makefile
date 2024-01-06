.PHONY: build-nginx-amd64 push-nginx-amd64
build-nginx-amd64:
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg nginx_version=stable \
	  --manifest moodle-nginx:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-nginx:${image_tag}-amd64 \
	  images/nginx
push-nginx-amd64:
	podman image push ghcr.io/lukecarrier/moodle-nginx:${image_tag}-amd64

.PHONY: build-nginx-arm64 push-nginx-arm64
build-nginx-arm64:
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg nginx_version=stable \
	  --manifest moodle-nginx:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-nginx:${image_tag}-arm64 \
	  images/nginx
push-nginx-arm64:
	podman image push ghcr.io/lukecarrier/moodle-nginx:${image_tag}-arm64

.PHONY: build-php-fpm-7.0-amd64 push-php-fpm-7.0-amd64
build-php-fpm-7.0-amd64:
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg debian_version=9 \
	  --build-arg debian_version_name=stretch \
	  --build-arg debian_version_archived=1 \
	  --build-arg php_version=7.0 \
	  --build-arg oracle_instant_client=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-basic-linux.x64-23.3.0.0.0.zip \
	  --build-arg oracle_instant_client_sdk=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-sdk-linux.x64-23.3.0.0.0.zip \
	  --build-arg msodbcsql_gpg_mode=apt-trust \
	  --build-arg php_oci8_version=2.2.0 \
	  --build-arg php_sqlsrv_version=5.3.0 \
	  --build-arg php_pdo_sqlsrv_version=5.3.0 \
	  --build-arg php_redis_version=5.1.1 \
	  --build-arg php_xmlrpc_install=1 \
	  --build-arg php_zip_config_opts=--with-libzip \
	  --manifest moodle-php-fpm:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-7.0:${image_tag}-amd64 \
	  images/php-fpm
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg php_version=7.0 \
	  --build-arg base_image_tag=${image_tag}-amd64 \
	  --build-arg php_xdebug_version=2.9.0 \
	  --manifest moodle-php-fpm-dev:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-dev-7.0:${image_tag}-amd64 \
	  images/php-fpm-dev
push-php-fpm-7.0-amd64:
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-7.0:${image_tag}-amd64
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-dev-7.0:${image_tag}-amd64

.PHONY: build-php-fpm-7.0-arm64 push-php-fpm-7.0-arm64
build-php-fpm-7.0-arm64:
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg debian_version=9 \
	  --build-arg debian_version_name=stretch \
	  --build-arg debian_version_archived=1 \
	  --build-arg php_version=7.0 \
	  --build-arg oracle_instant_client=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-basic-linux.x64-23.3.0.0.0.zip \
	  --build-arg oracle_instant_client_sdk=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-sdk-linux.x64-23.3.0.0.0.zip \
	  --build-arg msodbcsql_gpg_mode=apt-trust \
	  --build-arg php_oci8_version=2.2.0 \
	  --build-arg php_sqlsrv_version=5.3.0 \
	  --build-arg php_pdo_sqlsrv_version=5.3.0 \
	  --build-arg php_redis_version=5.1.1 \
	  --build-arg php_xmlrpc_install=1 \
	  --build-arg php_zip_config_opts=--with-libzip \
	  --manifest moodle-php-fpm:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-7.0:${image_tag}-arm64 \
	  images/php-fpm
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg php_version=7.0 \
	  --build-arg base_image_tag=${image_tag}-arm64 \
	  --build-arg php_xdebug_version=2.9.0 \
	  --manifest moodle-php-fpm-dev:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-dev-7.0:${image_tag}-arm64 \
	  images/php-fpm-dev
push-php-fpm-7.0-arm64:
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-7.0:${image_tag}-arm64
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-dev-7.0:${image_tag}-arm64

.PHONY: build-php-fpm-7.2-amd64
build-php-fpm-7.2-amd64:
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg debian_version=10 \
	  --build-arg debian_version_name=buster \
	  --build-arg php_version=7.2 \
	  --build-arg oracle_instant_client=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-basic-linux.x64-23.3.0.0.0.zip \
	  --build-arg oracle_instant_client_sdk=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-sdk-linux.x64-23.3.0.0.0.zip \
	  --build-arg msodbcsql_gpg_mode=apt-trust \
	  --build-arg php_oci8_version=2.2.0 \
	  --build-arg php_sqlsrv_version=5.6.1 \
	  --build-arg php_pdo_sqlsrv_version=5.6.1 \
	  --build-arg php_redis_version=5.1.1 \
	  --build-arg php_xmlrpc_install=1 \
	  --build-arg php_zip_config_opts=--with-libzip \
	  --manifest moodle-php-fpm:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-7.2:${image_tag}-amd64 \
	  images/php-fpm
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg php_version=7.2 \
	  --build-arg base_image_tag=${image_tag}-amd64 \
	  --build-arg php_xdebug_version=2.9.2 \
	  --manifest moodle-php-fpm-dev:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-dev-7.2:${image_tag}-amd64 \
	  images/php-fpm-dev
push-php-fpm-7.2-amd64:
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-7.2:${image_tag}-amd64
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-dev-7.2:${image_tag}-amd64

.PHONY: build-php-fpm-7.2-arm64 push-php-fpm-7.2-arm64
build-php-fpm-7.2-arm64:
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg debian_version=10 \
	  --build-arg debian_version_name=buster \
	  --build-arg php_version=7.2 \
	  --build-arg oracle_instant_client=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-basic-linux.x64-23.3.0.0.0.zip \
	  --build-arg oracle_instant_client_sdk=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-sdk-linux.x64-23.3.0.0.0.zip \
	  --build-arg msodbcsql_gpg_mode=apt-trust \
	  --build-arg php_oci8_version=2.2.0 \
	  --build-arg php_sqlsrv_version=5.6.1 \
	  --build-arg php_pdo_sqlsrv_version=5.6.1 \
	  --build-arg php_redis_version=5.1.1 \
	  --build-arg php_xmlrpc_install=1 \
	  --build-arg php_zip_config_opts=--with-libzip \
	  --manifest moodle-php-fpm:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-7.2:${image_tag}-arm64 \
	  images/php-fpm
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg php_version=7.2 \
	  --build-arg base_image_tag=${image_tag}-arm64 \
	  --build-arg php_xdebug_version=2.9.2 \
	  --manifest moodle-php-fpm-dev:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-dev-7.2:${image_tag}-arm64 \
	  images/php-fpm-dev
push-php-fpm-7.2-arm64:
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-7.2:${image_tag}-arm64
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-dev-7.2:${image_tag}-arm64

.PHONY: build-php-fpm-7.4-amd64 push-php-fpm-7.4-amd64
build-php-fpm-7.4-amd64:
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg debian_version=10 \
	  --build-arg debian_version_name=buster \
	  --build-arg php_version=7.4 \
	  --build-arg oracle_instant_client=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-basic-linux.x64-23.3.0.0.0.zip \
	  --build-arg oracle_instant_client_sdk=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-sdk-linux.x64-23.3.0.0.0.zip \
	  --build-arg msodbcsql_gpg_mode=apt-trust \
	  --build-arg php_oci8_version=2.2.0 \
	  --build-arg php_sqlsrv_version=5.8.1 \
	  --build-arg php_pdo_sqlsrv_version=5.8.1 \
	  --build-arg php_redis_version=5.1.1 \
	  --build-arg php_xmlrpc_install=1 \
	  --build-arg php_zip_config_opts= \
	  --manifest moodle-php-fpm:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-7.4:${image_tag}-amd64 \
	  images/php-fpm
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg php_version=7.4 \
	  --build-arg base_image_tag=${image_tag}-amd64 \
	  --build-arg php_xdebug_version=2.9.2 \
	  --manifest moodle-php-fpm-dev:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-dev-7.4:${image_tag}-amd64 \
	  images/php-fpm-dev
push-php-fpm-7.4-amd64:
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-7.4:${image_tag}-amd64
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-dev-7.4:${image_tag}-amd64

.PHONY: build-php-fpm-7.4-arm64 push-php-fpm-7.4-arm64
build-php-fpm-7.4-arm64:
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg debian_version=10 \
	  --build-arg debian_version_name=buster \
	  --build-arg php_version=7.4 \
	  --build-arg oracle_instant_client=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-basic-linux.x64-23.3.0.0.0.zip \
	  --build-arg oracle_instant_client_sdk=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-sdk-linux.x64-23.3.0.0.0.zip \
	  --build-arg msodbcsql_gpg_mode=apt-trust \
	  --build-arg php_oci8_version=2.2.0 \
	  --build-arg php_sqlsrv_version=5.8.1 \
	  --build-arg php_pdo_sqlsrv_version=5.8.1 \
	  --build-arg php_redis_version=5.1.1 \
	  --build-arg php_xmlrpc_install=1 \
	  --build-arg php_zip_config_opts= \
	  --manifest moodle-php-fpm:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-7.4:${image_tag}-arm64 \
	  images/php-fpm
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg php_version=7.4 \
	  --build-arg base_image_tag=${image_tag}-arm64 \
	  --build-arg php_xdebug_version=2.9.2 \
	  --manifest moodle-php-fpm-dev:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-dev-7.4:${image_tag}-arm64 \
	  images/php-fpm-dev
push-php-fpm-7.4-arm64:
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-7.4:${image_tag}-arm64
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-dev-7.4:${image_tag}-arm64

.PHONY: build-php-fpm-8.0-amd64 push-php-fpm-8.0-amd64
build-php-fpm-8.0-amd64:
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg debian_version=11 \
	  --build-arg debian_version_name=bullseye \
	  --build-arg php_version=8.0 \
	  --build-arg oracle_instant_client=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-basic-linux.x64-23.3.0.0.0.zip \
	  --build-arg oracle_instant_client_sdk=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-sdk-linux.x64-23.3.0.0.0.zip \
	  --build-arg msodbcsql_gpg_mode=apt-trust \
	  --build-arg php_oci8_version=3.0.1 \
	  --build-arg php_sqlsrv_version=5.11.1 \
	  --build-arg php_pdo_sqlsrv_version=5.11.1 \
	  --build-arg php_redis_version=6.0.1 \
	  --build-arg php_xmlrpc_install=0 \
	  --build-arg php_zip_config_opts= \
	  --manifest moodle-php-fpm:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-8.0:${image_tag}-amd64 \
	  images/php-fpm
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg php_version=8.0 \
	  --build-arg base_image_tag=${image_tag}-amd64 \
	  --build-arg php_xdebug_version=3.2.2 \
	  --manifest moodle-php-fpm-dev:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-dev-8.0:${image_tag}-amd64 \
	  images/php-fpm-dev
push-php-fpm-8.0-amd64:
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-8.0:${image_tag}-amd64
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-dev-8.0:${image_tag}-amd64

.PHONY: build-php-fpm-8.0-arm64 push-php-fpm-8.0-arm64
build-php-fpm-8.0-arm64:
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg debian_version=11 \
	  --build-arg debian_version_name=bullseye \
	  --build-arg php_version=8.0 \
	  --build-arg oracle_instant_client=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-basic-linux.x64-23.3.0.0.0.zip \
	  --build-arg oracle_instant_client_sdk=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-sdk-linux.x64-23.3.0.0.0.zip \
	  --build-arg msodbcsql_gpg_mode=apt-trust \
	  --build-arg php_oci8_version=3.0.1 \
	  --build-arg php_sqlsrv_version=5.11.1 \
	  --build-arg php_pdo_sqlsrv_version=5.11.1 \
	  --build-arg php_redis_version=6.0.1 \
	  --build-arg php_xmlrpc_install=0 \
	  --build-arg php_zip_config_opts= \
	  --manifest moodle-php-fpm:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-8.0:${image_tag}-arm64 \
	  images/php-fpm
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg php_version=8.0 \
	  --build-arg base_image_tag=${image_tag}-arm64 \
	  --build-arg php_xdebug_version=3.2.2 \
	  --manifest moodle-php-fpm-dev:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-dev-8.0:${image_tag}-arm64 \
	  images/php-fpm-dev
push-php-fpm-8.0-arm64:
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-8.0:${image_tag}-arm64
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-dev-8.0:${image_tag}-arm64

.PHONY: build-php-fpm-8.2-amd64 push-php-fpm-8.2-amd64
build-php-fpm-8.2-amd64:
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg debian_version=12 \
	  --build-arg debian_version_name=bookworm \
	  --build-arg php_version=8.2 \
	  --build-arg oracle_instant_client=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-basic-linux.x64-23.3.0.0.0.zip \
	  --build-arg oracle_instant_client_sdk=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-sdk-linux.x64-23.3.0.0.0.zip \
	  --build-arg msodbcsql_gpg_mode=keyring-dir \
	  --build-arg php_oci8_version=3.3.0 \
	  --build-arg php_sqlsrv_version=5.11.1 \
	  --build-arg php_pdo_sqlsrv_version=5.11.1 \
	  --build-arg php_redis_version=6.0.1 \
	  --build-arg php_xmlrpc_install=0 \
	  --build-arg php_zip_config_opts= \
	  --manifest moodle-php-fpm:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-8.2:${image_tag}-amd64 \
	  images/php-fpm
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg php_version=8.2 \
	  --build-arg base_image_tag=${image_tag}-amd64 \
	  --build-arg php_xdebug_version=3.2.2 \
	  --manifest moodle-php-fpm-dev:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-dev-8.2:${image_tag}-amd64 \
	  images/php-fpm-dev
push-php-fpm-8.2-amd64:
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-8.2:${image_tag}-amd64
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-dev-8.2:${image_tag}-amd64

.PHONY: build-php-fpm-8.2-arm64 push-php-fpm-8.2-arm64
build-php-fpm-8.2-arm64:
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg debian_version=12 \
	  --build-arg debian_version_name=bookworm \
	  --build-arg php_version=8.2 \
	  --build-arg oracle_instant_client=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-basic-linux.x64-23.3.0.0.0.zip \
	  --build-arg oracle_instant_client_sdk=https://download.oracle.com/otn_software/linux/instantclient/23c/instantclient-sdk-linux.x64-23.3.0.0.0.zip \
	  --build-arg msodbcsql_gpg_mode=keyring-dir \
	  --build-arg php_oci8_version=3.3.0 \
	  --build-arg php_sqlsrv_version=5.11.1 \
	  --build-arg php_pdo_sqlsrv_version=5.11.1 \
	  --build-arg php_redis_version=6.0.1 \
	  --build-arg php_xmlrpc_install=0 \
	  --build-arg php_zip_config_opts= \
	  --manifest moodle-php-fpm:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-8.2:${image_tag}-arm64 \
	  images/php-fpm
	podman image build \
	  --file Containerfile \
	  --platform linux/arm64 \
	  --build-arg php_version=8.2 \
	  --build-arg base_image_tag=${image_tag}-arm64 \
	  --build-arg php_xdebug_version=3.2.2 \
	  --manifest moodle-php-fpm-dev:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-php-fpm-dev-8.2:${image_tag}-arm64 \
	  images/php-fpm-dev
push-php-fpm-8.2-arm64:
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-8.2:${image_tag}-arm64
	podman image push ghcr.io/lukecarrier/moodle-php-fpm-dev-8.2:${image_tag}-arm64

.PHONY: build-sql-server-amd64 push-sql-server-amd64
build-sql-server-amd64: images
	podman image build \
	  --file Containerfile \
	  --platform linux/amd64 \
	  --build-arg sql_server_version=2017-latest \
	  --manifest moodle-sql-server:${image_tag} \
	  --tag ghcr.io/lukecarrier/moodle-sql-server:${image_tag}-amd64 \
	  images/sql-server
push-sql-server-amd64:
	podman image push ghcr.io/lukecarrier/moodle-sql-server:${image_tag}-amd64
