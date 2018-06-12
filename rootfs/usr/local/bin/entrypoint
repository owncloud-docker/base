#!/usr/bin/env bash
set -eo pipefail
[[ "${DEBUG}" == "true" ]] && set -x

for FILE in $(find /etc/entrypoint.d -iname \*.sh | sort)
do
  source ${FILE}
done

exec $@
