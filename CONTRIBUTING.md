# 贡献指南

> **📝 重要提醒：个人自用仓库**
> 
> 这是一个主要为个人使用而创建的仓库。虽然欢迎贡献，但请理解维护优先级主要基于个人需求。

## 🔄 自动更新机制

### GitHub Actions 自动更新规范

本仓库的所有应用都配置了 GitHub Actions 自动更新机制，遵循以下规范：

#### 📋 必须更新的文件

当应用版本更新时，GitHub Actions **必须**同时更新以下文件：

1. **Cask 文件** (`Casks/{app-name}.rb`)
   - `version` 字段
   - `sha256` 字段（或多架构的 SHA256）

2. **README.md 文档**
   - 应用表格中的版本号
   - 确保与 cask 文件中的版本保持一致

#### 🛠️ 实现规范

每个 workflow 文件必须包含以下步骤：

```yaml
- name: Update cask file and README
  if: steps.check.outputs.update_needed == 'true'
  run: |
    NEW_VERSION=${{ steps.check.outputs.new_version }}
    NEW_SHA256=${{ steps.check.outputs.new_sha256 }}
    
    # 更新 cask 文件
    sed -i "s/version \".*\"/version \"$NEW_VERSION\"/" Casks/{app-name}.rb
    sed -i "s/sha256 \".*\"/sha256 \"$NEW_SHA256\"/" Casks/{app-name}.rb
    
    # 更新 README.md 中的版本号
    sed -i "s/| {emoji} {app-name} | \`{cask-name}\` | [^|]* |/| {emoji} {app-name} | \`{cask-name}\` | $NEW_VERSION |/" README.md

- name: Commit and push changes
  if: steps.check.outputs.update_needed == 'true'
  run: |
    git add Casks/{app-name}.rb README.md
    git commit -m "chore: update {App Name} to version ${{ steps.check.outputs.new_version }}
    
    - Updated version from previous to ${{ steps.check.outputs.new_version }}
    - Updated SHA256 checksum
    - Updated README.md version table
    - Source: {official-website}"
```

#### 📊 README.md 表格格式

README.md 中的应用表格必须遵循以下格式：

```markdown
| 应用名称 | Cask 名称 | 当前版本 | 架构支持 | 自动更新 | 官网/项目 |
|---------|-----------|----------|----------|----------|-----------|
| 🔥 阿里云盘 | `aliyundrive` | 6.8.7 | ARM64 + Intel | ✅ | [官网](https://www.aliyundrive.com/) |
| 📈 富途牛牛 | `futu-niuniu` | 15.24.12308 | Universal | ✅ | [官网](https://www.futunn.com/) |
| 📚 欧路词典 | `eudic` | 25.7.1 | Universal | ✅ | [官网](https://www.eudic.net/) |
| 🎨 Adobe Downloader | `adobe-downloader` | 2.1.1 | Universal | ✅ | [GitHub](https://github.com/X1a0He/Adobe-Downloader) |
```

#### 🔍 版本号处理规则

1. **简单版本号**：直接使用 `NEW_VERSION`
2. **复合版本号**（如 `25.7.1,1178`）：
   ```bash
   NEW_VERSION_DISPLAY=$(echo "$NEW_VERSION" | cut -d',' -f1)
   ```
   在 README 中只显示主版本号部分

3. **多架构应用**：使用统一的版本号，不区分架构

## 🆕 添加新应用

### 必需文件

添加新应用时，必须创建以下文件：

1. **Cask 文件** (`Casks/{app-name}.rb`)
2. **GitHub Actions Workflow** (`.github/workflows/update-{app-name}.yml`)
3. **更新 README.md** 表格

### Workflow 命名规范

- 文件名：`update-{app-name}.yml`
- Workflow 名称：`Update {App Name} Cask`
- 定时任务：每天北京时间上午 7-9 点之间（错开时间避免冲突）

### 提交信息规范

```
chore: update {App Name} to version {version}

- Updated version from {old_version} to {new_version}
- Updated SHA256 checksum
- Updated README.md version table
- Source: {official_source_url}
```

## 🧪 测试要求

### 本地测试

添加或修改 cask 时，必须进行以下测试：

```bash
# 语法检查
ruby -c Casks/{app-name}.rb

# Homebrew 审计
brew audit --cask Casks/{app-name}.rb

# 安装测试
brew install --cask {tap-name}/{app-name}

# 卸载测试
brew uninstall --cask {app-name}
```

### GitHub Actions 测试

每个 workflow 必须包含测试步骤：

```yaml
- name: Test updated files
  if: steps.check.outputs.update_needed == 'true'
  run: |
    # 检查 Ruby 语法
    ruby -c Casks/{app-name}.rb
    echo "Cask syntax is valid"
    
    # 验证 README.md 更新
    grep "{app-identifier}" README.md
    echo "README.md updated successfully"
```

## 📝 文档维护

### 版本同步检查

定期检查以下文件中的版本号是否一致：

1. `Casks/{app-name}.rb` 中的 `version`
2. `README.md` 表格中的版本号
3. 实际安装的应用版本

### 手动更新流程

如需手动更新版本：

1. 更新 cask 文件
2. 更新 README.md 表格
3. 测试安装
4. 提交时遵循提交信息规范

## ⚠️ 注意事项

1. **版本号格式**：确保 README 中显示的版本号用户友好
2. **架构支持**：准确标注应用的架构支持情况
3. **自动更新状态**：所有应用都应标记为 ✅ 自动更新
4. **链接有效性**：定期检查官网链接是否有效

---

遵循这些规范可以确保仓库的一致性和可维护性。
