# Rust conventions

OpenAEC Rust projects follow the Rust project's official naming and formatting rules.

| Item | Required case |
| --- | --- |
| Crates and modules | `snake_case` |
| Types, traits, and type parameters | `UpperCamelCase` (`PascalCase` in `conventions.yaml`) |
| Enum variants | `UpperCamelCase` (`PascalCase` in `conventions.yaml`) |
| Functions, methods, macros, local variables, and fields | `snake_case` |
| Constants and static variables | `SCREAMING_SNAKE_CASE` |
| Rust source files and module directories | `snake_case` |

Rust source is formatted with `cargo fmt --all`. The convention enforcer uses rust-analyzer for semantic renames and the compiler's `nonstandard_style` lint family for bindings and type parameters that are not exposed as document symbols.

Primary sources:

- [Names in the official Rust Style Guide](https://doc.rust-lang.org/style-guide/advice.html#names)
- [Rust RFC 430: Finalizing naming conventions](https://rust-lang.github.io/rfcs/0430-finalizing-naming-conventions.html)
- [The rustc `nonstandard-style` lint group](https://doc.rust-lang.org/rustc/lints/groups.html#nonstandard-style)
