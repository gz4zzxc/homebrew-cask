# 🏠 个人 Homebrew Cask Tap

> **⚠️ 注意：这是一个个人自用的 Homebrew Cask 仓库**
>
> 本仓库主要为个人使用而创建，包含一些官方 Homebrew 未收录或需要特定配置的 macOS 应用。虽然欢迎其他用户使用，但请注意：
> - 🔧 **维护优先级**：优先满足个人需求，可能不会及时响应外部需求
> - 📱 **应用选择**：主要收录个人常用的应用，不保证覆盖面
> - 🚀 **更新频率**：根据个人使用情况决定更新优先级
> - 💡 **建议**：如需稳定的第三方 cask，建议使用社区维护的大型 tap

这是一个自定义的 Homebrew Cask 仓库，用于安装一些官方 Homebrew 未收录或需要特定配置的 macOS 应用。

## 快速开始

### 1. 添加并信任此 tap

Homebrew 6.0+ 对非官方 tap 启用了 [Tap Trust](https://docs.brew.sh/Tap-Trust)：需要先信任，短名称安装才会加载本仓库的 cask 定义。

```bash
brew tap gz4zzxc/homebrew-cask
brew trust gz4zzxc/cask
```

也可以不预先 trust 整个 tap，直接用完全限定名安装（只会 trust 该 cask）：

```bash
brew install --cask gz4zzxc/cask/quick-outline
```

### 2. 安装应用

```bash
# 安装 Adobe Downloader
brew install --cask adobe-downloader

# 安装 Sony Catalyst Browse
brew install --cask catalyst-browse

# 安装欧路词典（使用本 tap 的版本）
brew install --cask gz4zzxc/cask/eudic

# 安装 QuickOutline
brew install --cask quick-outline

# 安装长桥Pro新版（原生重写版，可与经典版共存）
brew install --cask longbridge-desktop
```

### 3. 更新应用

```bash
# 更新所有应用
brew upgrade --cask

# 更新特定应用
brew upgrade --cask gz4zzxc/cask/quick-outline
```

### 已移至官方 Homebrew Cask 的应用

本仓库不再维护阿里云盘、富途牛牛和长桥 Pro 经典版，可改用官方 cask：

```bash
brew install --cask homebrew/cask/adrive
brew install --cask homebrew/cask/futubull
brew install --cask homebrew/cask/longbridge-pro
```

富途牛牛的官方 cask 将应用安装为 `Futubull.app`，Dock 或登录项可能需要重新指向。

欧路词典继续由本 tap 维护。[官方 Homebrew cask](https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/e/eudic.rb) 的下载地址存在版本落后问题：2026-11-11 实测下载到 26.5.0，而[欧路更新源](https://static.eudic.net/pkg/eudic_mac.xml)提供 26.9.1，改用官方 cask 会回退版本。上游下载地址不固定版本，新版发布后至本仓库更新校验和之前，安装或升级可能暂时因校验失败而中断；详情见 [#33](../../issues/33)。

## 包含的应用

| 应用名称               | Cask 名称          | 当前版本    | 架构支持      | 自动更新 | 官网/项目                                                           |
| ---------------------- | ------------------ | ----------- | ------------- | -------- | ------------------------------------------------------------------- |
| 💹 长桥Pro新版           | `longbridge-desktop` | 1.1.0 | ARM64 + Intel | ✅        | [官网](https://longbridge.com/desktop/)                             |
| 📚 欧路词典             | `eudic` | 26.9.1 | Universal     | ✅        | [官网](https://www.eudic.net/)                                      |
| 🎨 Adobe Downloader     | `adobe-downloader` | 3.2.0 | Universal     | ✅        | [GitHub](https://github.com/X1a0He/Adobe-Downloader)                |
| 🎬 Sony Catalyst Browse | `catalyst-browse` | 2026.1 | Universal     | ✅        | [官网](https://www.sony.net/catalyst)                               |
| 📄 QuickOutline         | `quick-outline`    | 2.3.0       | ARM64         | ✅        | [GitHub](https://github.com/ririv/QuickOutline)                    |

## 🔄 自动更新机制

本仓库的所有 cask 都配置了自动更新机制：

- **检查频率**: 定期自动检查新版本（根据软件更新频率，从每日到每周不等）
- **更新内容**: 自动更新版本号、SHA256 校验和、README.md 版本表格
- **质量保证**: 每次更新都会运行语法检查和基本验证
- **通知方式**: 通过 GitHub Actions 查看更新状态

> 📋 **重要规范**: 所有 GitHub Actions 在更新应用版本时，**必须同时更新** cask 文件和 README.md 中的版本号，确保文档与实际版本保持一致。

### 手动触发更新

如果需要立即检查更新，可以在 GitHub Actions 页面手动触发：

1. 访问 [Actions 页面](../../actions)
2. 选择对应的 workflow（如 "Update QuickOutline Cask"）
3. 点击 "Run workflow" 按钮

## 🛠️ 开发者指南

### 手动更新应用版本

如果需要手动更新应用版本：

1. 修改对应 Cask 文件中的 `version` 字段
2. 更新下载链接（如需要）
3. 重新计算 SHA256 值：
   ```bash
   # 下载新版本文件
   curl -L -o app.dmg "下载链接"

   # 计算 SHA256
   shasum -a 256 app.dmg
   ```
4. 更新 Cask 文件中的 `sha256` 字段
5. 测试 cask 语法：
   ```bash
   brew style gz4zzxc/cask/<token>
   brew audit --cask --strict gz4zzxc/cask/<token>
   ```

### 添加新应用

1. 在 `Casks/` 目录下创建新的 `.rb` 文件
2. 参考现有 cask 的格式编写
3. 在 `.github/workflows/` 目录下创建对应的自动更新 workflow
4. 更新本 README.md 文件
5. 遵循提交信息规范（参考最近的提交记录）

## 📋 系统要求

- **macOS**: 以各 Cask 的 `depends_on` 为准（Adobe Downloader、欧路词典要求 macOS 13 Ventura 及以上，Sony Catalyst Browse 要求 macOS 12 Monterey 及以上；其余 cask 未声明高于 Homebrew 自身运行下限的最低 macOS 版本）
- **Homebrew**: 最新版本
- **架构支持**:
  - ✅ Apple Silicon (M1/M2/M3)
  - ✅ Intel x86_64

## 🔗 相关链接

- [Homebrew 官网](https://brew.sh/)
- [Homebrew Cask 文档](https://docs.brew.sh/Cask-Cookbook)
- [如何创建 Homebrew Cask](https://docs.brew.sh/Adding-Software-to-Homebrew)

## 💡 免责声明

本仓库为个人学习和使用目的创建，不保证：

- 应用的及时更新
- 技术支持的及时响应
- 与所有系统的兼容性

使用前请确保了解相关风险。

**⭐ 如果这个项目对您有帮助，欢迎给个 Star！**
