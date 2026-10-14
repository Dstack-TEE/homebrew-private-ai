# Homebrew Private AI

Official Homebrew tap for [Private AI Proxy](https://github.com/Dstack-TEE/private-ai-gateway), the local desktop application and CLI for Attested Confidential Inference.

Install the CLI. `pap` is the preferred command; `private-ai-proxy` and `aci` are also installed:

```sh
brew install dstack-tee/private-ai/private-ai-proxy
pap --help
```

Install the macOS desktop application:

```sh
brew install --cask dstack-tee/private-ai/private-ai-proxy
```

On Homebrew 6+, each fully qualified command automatically taps the repository and trusts only the item being installed. To use short names such as `brew install private-ai-proxy` or `brew upgrade private-ai-proxy`, trust the whole tap first:

```sh
brew tap dstack-tee/private-ai
brew trust dstack-tee/private-ai
brew install private-ai-proxy
brew install --cask private-ai-proxy
```

Trust for an item installed by its fully qualified name persists, so later upgrades continue to work. Older Homebrew versions do not have tap trust; the fully qualified one-line commands still work there.

Upgrade either installation with `brew upgrade`; add `--cask` for the desktop application. Published files come from immutable, signed [Private AI Gateway releases](https://github.com/Dstack-TEE/private-ai-gateway/releases), and this tap verifies their SHA-256 checksums.
