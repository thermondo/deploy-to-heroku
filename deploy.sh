#!/bin/bash
set -exo pipefail

cat > ~/.netrc <<EOF
  machine api.heroku.com
    login $HEROKU_EMAIL
    password $HEROKU_API_KEY
  machine git.heroku.com
    login $HEROKU_EMAIL
    password $HEROKU_API_KEY
EOF

heroku git:remote --app "${HEROKU_APP}"
git push heroku HEAD:refs/heads/master --force
