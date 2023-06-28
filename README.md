# Kahu.app Github Action

Integrate Kahu dependency inspection to your development pipeline.

## Usage

```yaml
- name: Check dependencies
  uses: kahu-app/github-action@v1
```

## Inputs

### Authentication (optional)

The action can be set up using the `kahu_token` input to authenticate on your behalf with Kahu. It accepts a `non-empty-string`.

Authenticated checks have access to additional analysis data. Tokens can be created in [Kahu's dashboard](https://my.kahu.app).

```yaml
- name: Check dependencies
  uses: kahu-app/github-action@v1
  with:
    kahu_token: ${{ secrets.KAHU_TOKEN }}
```

### Wait timeout (optional)

The rules can only be executed once the analysis is completed, to avoid an infinite wait, the action waits for `300` seconds (5 minutes) by default. This interval can be customized by using the `wait_timeout` input. It accepts a `positive-integer`.

```yaml
- name: Check dependencies
  uses: kahu-app/github-action@v1
  with:
    wait_timeout: 60
```

### Rules file (optional)

The command-line will load rules from `./rules.json` by default, but both the path and the file name can be customized by using the `rule_file` input. It accepts a `non-empty-string`.

```yaml
- name: Check dependencies
  uses: kahu-app/github-action@v1
  with:
    rule_file: './github/kahu-rules.json'
```

### Lock file (optional)

The command-line will upload the lock file from `./composer.lock` by default, but it can be customized by using the `lock_file` input. It accepts a `non-empty-string`.

```yaml
- name: Check dependencies
  uses: kahu-app/github-action@v1
  with:
    lock_file: './my-app/composer.lock'
```

## License

This project is licensed under the [MIT License](LICENSE).
