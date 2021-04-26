# merge-ff

Automatically merges from one branch to another with ff-only.

If the merge is not necessary, the action will do nothing.
If the merge fails due to conflicts, the action will fail, and the repository
maintainer should perform the merge manually.

## Installation

To enable, add the following content to your `action-name`.yml :

```yml

jobs:
  merge-ff:

    runs-on: ubuntu-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v1

    - name: Merge FF
      uses: Vac1911/merge-ff
      with:
        from_branch: 'dev'
        to_branch: 'main'
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

For example, this will run the action whenever something is pushed on the
`dev` branch:

```yml
on:
  push:
    branches:
      - dev
```

This will add a button to the action to trigger it manually:

```yml
on:
  workflow_dispatch:
```

## Parameters

### `from_branch`

The name of the from branch (default `dev`).

### `to_branch`

The name of the development branch (default `main`).

### `allow_forks`

Allow action to run on forks (default `true`).

### `user_name`

User name for git commits (default `GitHub Merge Action`).

### `user_email`

User email for git commits (default `actions@github.com`).

### `push_token`

Environment variable containing the token to use for push (default
`GITHUB_TOKEN`).
Useful for pushing on protected branches.
Using a secret to store this variable value is strongly recommended, since this
value will be printed in the logs.
The `GITHUB_TOKEN` is still used for API calls, therefore both token should be
available.

```yml
      with:
        push_token: 'FOO_TOKEN'
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        FOO_TOKEN: ${{ secrets.FOO_TOKEN }}
```
