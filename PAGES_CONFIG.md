# 🔧 GitHub Pages 配置检查清单

## ✅ 配置前检查

### 1. 确认 Fork 状态
- [x] 已 Fork 项目到您的 GitHub 账户
- [ ] 确认 Fork 的仓库地址（格式：`https://github.com/YOUR_USERNAME/Hextra-AI-Insight-Daily`）

### 2. 检查工作流文件
- [x] `.github/workflows/pages.yaml` 文件存在
- [x] 工作流配置正确

## 📋 配置步骤

### 步骤 1: 更新本地仓库的远程地址（如需要）

如果您想将代码推送到您自己的 Fork 仓库，需要更新远程地址：

```bash
# 将 YOUR_USERNAME 替换为您的 GitHub 用户名
git remote set-url origin https://github.com/YOUR_USERNAME/Hextra-AI-Insight-Daily.git

# 验证远程地址
git remote -v
```

**示例**：
如果您的 GitHub 用户名是 `july-lyan`，则运行：
```bash
git remote set-url origin https://github.com/july-lyan/Hextra-AI-Insight-Daily.git
```

### 步骤 2: 配置 GitHub Pages 设置 ⚠️ 最重要

1. **打开您的 Fork 仓库页面**
   - 访问：`https://github.com/YOUR_USERNAME/Hextra-AI-Insight-Daily`
   - 将 `YOUR_USERNAME` 替换为您的 GitHub 用户名

2. **进入 Settings（设置）**
   - 点击仓库页面顶部的 **Settings** 标签页
   - 如果没有看到 Settings，说明您可能没有管理员权限，请确认已正确 Fork

3. **配置 Pages**
   - 在左侧菜单中找到 **Pages** 选项（在 "Code and automation" 部分下）
   - 在 **Source**（源）部分：
     - ⚠️ **重要**：选择 **GitHub Actions** 作为部署源
     - ❌ **不要**选择 "Deploy from a branch"
   - 点击 **Save** 保存设置

   **配置截图参考**：
   ```
   Build and deployment
   ┌─────────────────────────────────────┐
   │ Source: [GitHub Actions ▼]  ✅     │
   │                                     │
   │ ❌ Deploy from a branch             │
   │ ✅ GitHub Actions                   │
   └─────────────────────────────────────┘
   ```

### 步骤 3: 配置仓库变量（推荐）

工作流使用了 `APP_BASE_URL` 变量来设置网站的基础 URL。

1. **进入变量设置**
   - 在 **Settings** 页面
   - 找到左侧菜单的 **Secrets and variables** -> **Actions**
   - 点击 **Variables** 标签页

2. **添加变量**
   - 点击 **New repository variable** 按钮
   - 添加以下变量：
     - **Name**: `APP_BASE_URL`
     - **Value**: 
       - 如果仓库名是 `Hextra-AI-Insight-Daily`：
         ```
         https://YOUR_USERNAME.github.io/Hextra-AI-Insight-Daily
         ```
       - 如果仓库名是其他名称，使用：
         ```
         https://YOUR_USERNAME.github.io/REPO_NAME
         ```
   - 点击 **Add variable** 保存

   **示例**：
   - 用户名：`july-lyan`
   - 仓库名：`Hextra-AI-Insight-Daily`
   - 变量值：`https://july-lyan.github.io/Hextra-AI-Insight-Daily`

   > **注意**：如果不设置此变量，工作流会使用默认的 GitHub Pages URL，但可能导致某些链接不正确。

### 步骤 4: 检查 Actions 权限

1. **进入 Actions 设置**
   - 在 **Settings** -> **Actions** -> **General**
   - 确认 **Workflow permissions** 设置为：
     - ✅ **Read and write permissions**（推荐）
     - 或者至少确保有 **Read and write permissions** 用于 Pages 部署

### 步骤 5: 触发首次部署

有几种方式可以触发部署：

#### 方式 1: 手动触发（推荐首次使用）

1. 进入仓库的 **Actions** 标签页
2. 在左侧选择 **Deploy Hugo site to Pages** 工作流
3. 点击 **Run workflow** 按钮（在右侧）
4. 选择分支（通常是 `main`）
5. 点击 **Run workflow** 开始部署

#### 方式 2: 推送代码触发

如果您想推送我创建的配置文档到仓库：

```bash
# 添加新文件
git add .

# 提交更改
git commit -m "docs: 添加部署和配置文档"

# 推送到您的仓库
git push origin main
```

推送后，GitHub Actions 会自动触发构建和部署。

## 🔍 验证配置

### 检查部署状态

1. **查看 Actions 运行状态**
   - 进入 **Actions** 标签页
   - 查看最新的 **Deploy Hugo site to Pages** 工作流运行
   - 等待构建完成（通常需要 2-5 分钟）
   - 如果成功，您会看到绿色的 ✓ 标记

2. **检查 Pages 设置**
   - 进入 **Settings** -> **Pages**
   - 应该能看到部署状态和网站 URL

### 访问网站

部署成功后，您的网站将在以下地址可用：

- **默认地址**：`https://YOUR_USERNAME.github.io/Hextra-AI-Insight-Daily`
- **如果配置了自定义域名**：使用您的自定义域名

> **提示**：首次部署可能需要几分钟时间才能生效。如果无法访问，请等待几分钟后重试。

## ⚠️ 常见问题

### Q1: 找不到 Settings 标签页

**原因**：可能没有正确 Fork 或没有管理员权限

**解决方法**：
1. 确认已登录 GitHub
2. 访问 `https://github.com/YOUR_USERNAME/Hextra-AI-Insight-Daily`
3. 确认这是您自己的仓库（不是原始仓库）

### Q2: Pages 设置中没有 "GitHub Actions" 选项

**原因**：可能是 GitHub 账户或仓库设置问题

**解决方法**：
1. 确认仓库是 Public 或您有 GitHub Pro/Team 账户（Private 仓库需要付费账户）
2. 确认 GitHub Actions 功能已启用（Settings -> Actions -> General）

### Q3: 工作流运行失败

**可能的原因**：
- Pages 源未设置为 GitHub Actions
- Actions 权限不足
- `APP_BASE_URL` 变量配置错误

**解决方法**：
1. 检查 **Actions** 标签页中的错误日志
2. 确认 Pages 设置中选择了 **GitHub Actions** 作为源
3. 确认 Actions 权限设置正确
4. 检查变量配置是否正确

### Q4: 网站显示 404

**原因**：部署尚未完成或 URL 不正确

**解决方法**：
1. 等待 5-10 分钟让部署完成
2. 检查 Actions 工作流是否成功
3. 确认网站 URL 格式正确（包含仓库名）

## 📝 配置完成检查清单

完成以下所有项目后，配置就完成了：

- [ ] 已更新本地仓库远程地址（如需要）
- [ ] 已在 Settings -> Pages 中选择 **GitHub Actions** 作为源
- [ ] 已配置 `APP_BASE_URL` 变量（推荐）
- [ ] 已检查 Actions 权限设置
- [ ] 已触发首次部署
- [ ] 工作流运行成功
- [ ] 网站可以正常访问

## 🎉 完成！

配置完成后，您的网站应该已经成功部署到 GitHub Pages！

---

**需要帮助？** 查看详细文档：
- [DEPLOYMENT.md](./DEPLOYMENT.md) - 完整部署指南
- [DEPLOY_CHECKLIST.md](./DEPLOY_CHECKLIST.md) - 快速检查清单
