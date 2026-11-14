# 个人 Homebrew Cask Tap

收录个人常用、官方未收录或需要特定配置的 macOS 应用。维护以个人需求为主，不保证更新和支持时效。

## 使用

添加并信任此 tap（[Homebrew Tap Trust](https://docs.brew.sh/Tap-Trust)）：

```bash
brew tap gz4zzxc/homebrew-cask
brew trust gz4zzxc/cask
```

使用下表中的 cask 名称安装或更新：

```bash
brew install --cask gz4zzxc/cask/quick-outline
brew upgrade --cask gz4zzxc/cask/quick-outline
```

也可以省略整库信任，直接用上述完全限定名安装，仅信任该 cask。系统要求以各 [cask 定义](Casks/)的 `depends_on` 为准，架构支持见下表。

## 包含的应用

| 应用名称 | Cask 名称 | 当前版本 | 架构支持 | 官网/项目 |
| --- | --- | --- | --- | --- |
| 长桥 Pro 新版 | `longbridge-desktop` | 1.1.2 | ARM64 + Intel | [官网](https://longbridge.com/desktop/) |
| 欧路词典 | `eudic` | 26.9.1 | Universal | [官网](https://www.eudic.net/) |
| Adobe Downloader | `adobe-downloader` | 3.2.0 | Universal | [GitHub](https://github.com/X1a0He/Adobe-Downloader) |
| Sony Catalyst Browse | `catalyst-browse` | 2026.1 | Universal | [官网](https://www.sony.net/catalyst) |
| QuickOutline | `quick-outline` | 2.3.0 | ARM64 | [GitHub](https://github.com/ririv/QuickOutline) |

长桥 Pro 新版为原生重写版，可与经典版共存。

### 欧路词典下载说明

本 tap 保留欧路词典以跟进[欧路更新源](https://static.eudic.net/pkg/eudic_mac.xml)。2026-11-11 实测[官方 cask](https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/e/eudic.rb) 的下载地址返回 26.5.0，当时更新源已提供 26.9.1，详见 [#33](https://github.com/gz4zzxc/homebrew-cask/issues/33)。上游下载地址不固定版本，新版发布后、本仓库更新校验和之前，安装或升级可能暂时因校验失败而中断。

### 已移至官方仓库

本 tap 不再维护阿里云盘、富途牛牛和长桥 Pro 经典版：

```bash
brew install --cask homebrew/cask/adrive
brew install --cask homebrew/cask/futubull
brew install --cask homebrew/cask/longbridge-pro
```

富途牛牛官方 cask 安装为 `Futubull.app`，Dock 或登录项可能需要重新指向。

## 维护

所有 cask 均有定时更新 workflow，自动更新版本、SHA256 和本页版本表，并运行语法检查、`brew style` 和严格审计。检查周期以 [workflow 配置](.github/workflows/)为准；需要立即检查时，在 [Actions](https://github.com/gz4zzxc/homebrew-cask/actions) 中选择对应 workflow，点击 "Run workflow"。

手动更新或新增 cask 时，同步本页版本表及对应的自动更新配置。编写规则、验证命令和提交约定见 [AGENTS.md](AGENTS.md)；通用格式参考 [Cask Cookbook](https://docs.brew.sh/Cask-Cookbook)。
