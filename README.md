# deploy app to Heroku

Simple `git push` deploy to Heroku.

It will **always deploy the current HEAD to `master`**.

That means it should **only run on master, not on PRs**.

If you need deploys from PRs you need to adapt the app-name.

Example usage:

```yaml
---
name: testing

on:
  pull_request:
  push:

jobs:
  tests:
    [...]
  deploy:
    # this should be a separate job
    runs-on: ubuntu-latest
    needs: tests 
    steps:
      - uses: actions/checkout@v2
        with:
          fetch-depth: 0 # we need the history to be able to push to heroku git

      - uses: thermondo/deploy-to-heroku
        with:
          api_key: ${{ secrets.HEROKU_API_KEY }}
          email: ${{ secrets.HEROKU_USER_EMAIL }}
          app_name: the_app_name
```
