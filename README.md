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
```

## 包含的应用

### 富途牛牛 (Futu Niuniu)

富途证券官方交易软件，支持港股、美股、A股行情查看和交易。

- **版本**: 15.24.12308
- **官网**: https://www.futunn.com/

## 更新应用

如果需要更新应用版本，请：

1. 修改对应 Cask 文件中的 `version` 字段
2. 更新下载链接（如需要）
3. 重新计算 SHA256 值：`shasum -a 256 下载的文件.dmg`
4. 更新 Cask 文件中的 `sha256` 字段

## 贡献

欢迎提交 Pull Request 来添加新的应用或更新现有应用。
