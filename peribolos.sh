#!/bin/bash

set -e

echo "$1" > token

docker run --rm -v ${PWD}:/etc/community gcr.io/k8s-prow/peribolos:latest \
  --config-path=/etc/community/org/org.yaml \
  --github-token-path=/etc/community/token \
  --fix-org \
  --fix-org-members \
  --fix-repos \
  --fix-team-members \
  --fix-team-repos \
  --fix-teams \
  --require-self \
  --min-admins=2 \
  --required-admins=eddycharly \
  --required-admins=kloops-bot \
  --confirm=false

rm token
