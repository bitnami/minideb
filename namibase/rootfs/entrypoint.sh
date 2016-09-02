#!/bin/bash

source /opt/bitnami/stacksmith-utils.sh
print_welcome_page
check_for_updates &

exec tini -- "$@"
