# Homebrew Private AI

Official Homebrew tap for [Private AI Proxy](https://github.com/Dstack-TEE/private-ai-gateway), the local desktop application and CLI for Attested Confidential Inference.

Tap the repository once:

```sh
brew tap dstack-tee/private-ai
```

Install the CLI. `pap` is the preferred command; `private-ai-proxy` and `aci` are also installed:

```sh
brew install private-ai-proxy
pap --help
```

Install the macOS desktop application:

```sh
brew install --cask private-ai-proxy
```

The equivalent one-line commands are:

```sh
brew install dstack-tee/private-ai/private-ai-proxy
brew install --cask dstack-tee/private-ai/private-ai-proxy
```

Upgrade either installation with `brew upgrade`; add `--cask` for the desktop application. Published files come from immutable, signed [Private AI Gateway releases](https://github.com/Dstack-TEE/private-ai-gateway/releases), and this tap verifies their SHA-256 checksums.
