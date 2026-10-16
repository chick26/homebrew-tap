# Homebrew Tap for bili

安装命令行 B 站下载器：

```sh
brew install chick26/tap/bili
bili --help
```

支持 macOS（Apple / Intel）和 Linux（ARM64 / x86_64）。直接安装预编译版本，并由 Homebrew 管理 FFmpeg 依赖，无需 Rust 编译工具链。

```sh
bili auth login
bili up videos 504018708
bili download BV17x411w7KC --output ./downloads --no-extras
brew upgrade bili
```

[项目源码与安装说明](https://github.com/chick26/bilibili-downloader-cli) · [便携安装包](https://github.com/chick26/bilibili-downloader-cli/releases/latest)

公式的下载地址和 SHA256 由主项目的 Release 构建流程生成。更新时将新版本产物中的 `bili.rb` 放入 `Formula/`，并通过安装及 `brew test` 验证。
