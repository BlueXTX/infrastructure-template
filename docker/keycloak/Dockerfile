FROM quay.io/keycloak/keycloak:24.0 as builder

WORKDIR /opt/keycloak

RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore
RUN /opt/keycloak/bin/kc.sh build

COPY import/ /opt/keycloak/data/import

RUN /opt/keycloak/bin/kc.sh import --dir=/opt/keycloak/data/import/ --override true; exit 0

ENV KC_HOSTNAME=localhost
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]