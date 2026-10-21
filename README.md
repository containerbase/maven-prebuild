# maven-prebuild

Prebuild maven for containerbase

## Development

`mise install` installs Node.js, pnpm, jactionlint, shellcheck and zizmor, then `pnpm install --frozen-lockfile` installs the dependencies.

```bash
pnpm lint            # pnpm oxfmt-fix to fix the formatting
jactionlint          # the GitHub workflows
zizmor .github/      # security audit of the GitHub workflows
```

CI runs jactionlint and zizmor through mise in the `lint` job, and the commit hook runs them on staged workflow files.
