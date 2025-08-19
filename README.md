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

### 1. 添加此 tap

```bash
brew tap gz4zzxc/homebrew-cask
```

### 2. 安装应用

```bash
# 安装 Lobe Chat
brew install --cask lobe-chat

# 安装富途牛牛
brew install --cask futu-niuniu

# 安装阿里云盘
brew install --cask aliyundrive

# 安装欧路词典
brew install --cask eudic

# 安装 Adobe Downloader
brew install --cask adobe-downloader

# 安装 Sony Catalyst Browse
brew install --cask catalyst-browse
```

### 3. 更新应用

```bash
# 更新所有应用
brew upgrade --cask

# 更新特定应用
brew upgrade --cask aliyundrive
```

## 包含的应用

| 应用名称 | Cask 名称 | 当前版本 | 架构支持 | 自动更新 | 官网/项目 |
|---------|-----------|----------|----------|----------|-----------|
| 🔥 阿里云盘 | `aliyundrive` | 6.8.7 | ARM64 + Intel | ✅ | [官网](https://www.aliyundrive.com/) |
| 📈 富途牛牛 | `futu-niuniu` | 15.27.12608 | Universal | ✅ | [官网](https://www.futunn.com/) |
| 📚 欧路词典 | `eudic` | 25.7.1 | Universal | ✅ | [官网](https://www.eudic.net/) |
| 🎨 Adobe Downloader | `adobe-downloader` | 2.1.3 | Universal | ✅ | [GitHub](https://github.com/X1a0He/Adobe-Downloader) |
| 🎬 Sony Catalyst Browse | `catalyst-browse` | 2025.2 | Universal | ✅ | [官网](https://www.sony.com/electronics/support/articles/CCCT03000) |
| 🤖 Lobe Chat | `lobe-chat` | 1.114.0 | ARM64 + Intel | ✅ | [GitHub](https://github.com/lobehub/lobe-chat) |

## 🔄 自动更新机制

本仓库的所有 cask 都配置了自动更新机制：

- **检查频率**: 每天北京时间上午 7-9 点自动检查新版本
- **更新内容**: 自动更新版本号、SHA256 校验和、README.md 版本表格
- **质量保证**: 每次更新都会运行语法检查和基本验证
- **通知方式**: 通过 GitHub Actions 查看更新状态

> 📋 **重要规范**: 所有 GitHub Actions 在更新应用版本时，**必须同时更新** cask 文件和 README.md 中的版本号，确保文档与实际版本保持一致。详见 [贡献指南](CONTRIBUTING.md)。

### 手动触发更新

如果需要立即检查更新，可以在 GitHub Actions 页面手动触发：

1. 访问 [Actions 页面](../../actions)
2. 选择对应的 workflow（如 "Update Aliyun Drive Cask"）
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
   brew audit --cask Casks/应用名.rb
   brew style Casks/应用名.rb
   ```

### 添加新应用

1. 在 `Casks/` 目录下创建新的 `.rb` 文件
2. 参考现有 cask 的格式编写
3. 在 `.github/workflows/` 目录下创建对应的自动更新 workflow
4. 更新本 README.md 文件

## 📋 系统要求

- **macOS**: 10.13 (High Sierra) 或更高版本
- **Homebrew**: 最新版本
- **架构支持**:
  - ✅ Apple Silicon (M1/M2/M3)
  - ✅ Intel x86_64

## 🤝 贡献说明

> **个人自用仓库不接受贡献**
>

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

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
