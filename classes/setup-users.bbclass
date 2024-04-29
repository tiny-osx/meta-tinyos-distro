inherit extrausers

ADMIN_USER_ID ?= "1100"
ADMIN_USER_NAME ??= "admin"
ADMIN_USER_PASSWORD ??= "dotnet"
ADMIN_USER_PASSWORD_ENCRYPTED ??= "$(openssl passwd -6 ${ADMIN_USER_PASSWORD})"

USERADD_COMMAND ?= "\
  --create-home \
  --groups dotnet \
  --uid ${ADMIN_USER_ID} \
  --home /home/${ADMIN_USER_NAME} \
  ${ADMIN_USER_NAME} \
"

EXTRA_USERS_PARAMS = "\
  groupadd -g 780 dotnet; \
  groupadd -g 880 i2c; \
  groupadd -g 881 spi; \
  groupadd -g 882 gpio; \
  useradd  ${USERADD_COMMAND}; \
  usermod -p '${ADMIN_USER_PASSWORD_ENCRYPTED}' ${ADMIN_USER_NAME}; \
  usermod --shell /sbin/nologin root; \
  usermod -L -e 1 root; \
"