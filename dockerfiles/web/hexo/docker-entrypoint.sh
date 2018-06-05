#!/bin/bash
set -eo pipefail
shopt -s nullglob

HEXO_START_CMD="server"
HEXO_SERVER_STARTUP=0

# if command starts with an option, prepend mysqld
if [ "$#" -gt 1 ]; then
	OTHER_STARTUP_CMD="$@"
	HEXO_SERVER_STARTUP=1
fi

# Append startup command with bind IP.
if [ ${HEXO_BIND_IP} ];
then
	HEXO_START_CMD="${HEXO_START_CMD} -i ${HEXO_BIND_IP}"
else
	HEXO_START_CMD="${HEXO_START_CMD} -i 0.0.0.0"
fi

# Append startup command with port.
if [ ${HEXO_PORT} ];
then
	HEXO_START_CMD="${HEXO_START_CMD} -p ${HEXO_PORT}"
else
	HEXO_START_CMD="${HEXO_START_CMD} -p 4000"
fi

# Append startup command with logging option
HEXO_START_CMD="${HEXO_START_CMD} -l"

# If command starts is define
if [ ${HEXO_SERVER_STARTUP} == 1 ] && [ "${1}" == "npm" ]
then
	${OTHER_STARTUP_CMD}
elif [ ${HEXO_SERVER_STARTUP} == 1 ] && [ "${1}" != "npm" ]
then
	hexo ${OTHER_STARTUP_CMD}
else
	# Run hexo server.
	hexo ${HEXO_START_CMD}
fi
