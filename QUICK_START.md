# 🚀 快速开始指南

本指南将帮助您快速部署项目并配置 Notion 同步功能。

## 📍 Fork 按钮位置

**Fork 按钮**位于 GitHub 仓库页面的右上角：

```
┌─────────────────────────────────────────────┐
│  [Watch 0]  [Fork 87] ⬅️ 这里！  [Star 88] │
└─────────────────────────────────────────────┘
```

详细说明请参考 [FORK_GUIDE.md](./FORK_GUIDE.md)

## 🎯 部署流程概览

### 第一步：Fork 项目
1. 访问 https://github.com/justlovemaki/Hextra-AI-Insight-Daily
2. 点击右上角的 **Fork** 按钮
3. 选择要 Fork 到的账户

### 第二步：配置 GitHub Pages
1. 进入您 Fork 的仓库 **Settings** -> **Pages**
2. 将 **Source** 设置为 **GitHub Actions**（重要！）
3. 可选：配置 `APP_BASE_URL` 变量（Settings -> Secrets and variables -> Actions -> Variables）

详细步骤请参考 [DEPLOYMENT.md](./DEPLOYMENT.md)

### 第三步：配置 Notion 同步（可选）
1. 创建 Notion Integration 并获取 Token
2. 创建 Notion 数据库并获取 Database ID
3. 在 GitHub Secrets 中配置 `NOTION_TOKEN` 和 `NOTION_DATABASE_ID`

详细步骤请参考 [NOTION_SETUP.md](./NOTION_SETUP.md)

## ✅ 检查清单

### GitHub Pages 部署
- [ ] 已 Fork 项目
- [ ] 已设置 Pages 源为 GitHub Actions
- [ ] 已触发部署工作流
- [ ] 网站可以正常访问

### Notion 同步（可选）
- [ ] 已创建 Notion Integration
- [ ] 已创建 Notion 数据库
- [ ] 已配置 GitHub Secrets
- [ ] 已测试同步功能

## 🔗 相关文档

- [FORK_GUIDE.md](./FORK_GUIDE.md) - Fork 按钮位置说明
- [DEPLOYMENT.md](./DEPLOYMENT.md) - GitHub Pages 详细部署指南
- [DEPLOY_CHECKLIST.md](./DEPLOY_CHECKLIST.md) - 部署检查清单
- [NOTION_SETUP.md](./NOTION_SETUP.md) - Notion 同步配置指南

## 💡 常见问题

**Q: Fork 后如何更新代码？**
A: 可以通过 GitHub 的同步功能或手动合并上游更改。

**Q: 工作流没有自动触发？**
A: 检查 Pages 设置是否正确，确保选择了 GitHub Actions 作为源。

**Q: Notion 同步失败？**
A: 检查 Secrets 配置是否正确，确保 Integration 已连接到数据库。

---

**需要帮助？** 查看详细文档或提交 Issue。
