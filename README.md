# Conventions

Coding conventions and style guide for OpenAEC Foundation projects.

## Contents

- `CONVENTIONS.md` — detailed coding style guide
- `conventions.yaml` — machine-readable convention definitions used by [repo-cleaner](https://github.com/OpenAEC-Foundation/repo-cleaner)
- `RUST.md` — enforced Rust conventions and their official Rust-project sources

## Synchronizing shared conventions

Compile and run the Dynlex synchronizer:

Install [Dynlex](https://github.com/OpenAEC-Foundation/dynlex), then run:

```text
dynlex scripts/sync_shared.dl -o scripts/sync_shared
./scripts/sync_shared
```
