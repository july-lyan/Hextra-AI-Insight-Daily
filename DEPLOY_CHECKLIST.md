# 🚀 GitHub Pages 部署检查清单

## ✅ 部署前检查

- [ ] 已 Fork 项目到您的 GitHub 账户
- [ ] 已更新本地仓库的远程地址（如需要）
- [ ] 已访问仓库的 Settings -> Pages
- [ ] 已将部署源设置为 **GitHub Actions**（不是 branch）
- [ ] 已配置 `APP_BASE_URL` 变量（可选，但推荐）

## 🔄 触发部署

选择以下任一方式：

- [ ] **自动触发**：推送代码到 main 分支
- [ ] **手动触发**：Actions -> Deploy Hugo site to Pages -> Run workflow
- [ ] **定时触发**：等待每 4 小时自动运行

## 📊 验证部署

- [ ] 在 Actions 标签页查看工作流状态
- [ ] 确认构建成功（绿色 ✓）
- [ ] 访问网站确认可以正常打开
- [ ] 检查网站内容是否正确显示

## 🔗 访问地址

您的网站地址：
```
https://YOUR_USERNAME.github.io/Hextra-AI-Insight-Daily
```

或（如果配置了自定义域名）：
```
https://your-custom-domain.com
```

## ⚠️ 重要提示

1. **首次部署可能需要 5-10 分钟**
2. **确保 Pages 源设置为 GitHub Actions，不是 branch**
3. **如果工作流失败，检查 Actions 日志中的错误信息**

---

详细说明请参考 [DEPLOYMENT.md](./DEPLOYMENT.md)
