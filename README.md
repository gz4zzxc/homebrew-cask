# Homebrew Cask Tap

这是一个自定义的 Homebrew Cask 仓库，用于安装一些官方 Homebrew 未收录的 macOS 应用。

## 使用方法

### 1. 添加此 tap

```bash
brew tap yourusername/cask
```

### 2. 安装应用

```bash
brew install --cask futu-niuniu
brew install --cask aliyundrive
```

## 包含的应用

### 富途牛牛 (Futu Niuniu)

富途证券官方交易软件，支持港股、美股、A股行情查看和交易。

- **版本**: 15.24.12308
- **官网**: https://www.futunn.com/

### 阿里云盘 (Aliyun Drive)

阿里巴巴全球技术团队打造的个人网盘，具有下载不限速、不打扰、够安全、易于分享等特点。

- **版本**: 6.8.7
- **官网**: https://www.aliyundrive.com/

## 更新应用

如果需要更新应用版本，请：

1. 修改对应 Cask 文件中的 `version` 字段
2. 更新下载链接（如需要）
3. 重新计算 SHA256 值：`shasum -a 256 下载的文件.dmg`
4. 更新 Cask 文件中的 `sha256` 字段

## 贡献

欢迎提交 Pull Request 来添加新的应用或更新现有应用。
