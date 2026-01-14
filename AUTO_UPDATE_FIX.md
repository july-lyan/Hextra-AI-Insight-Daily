# 🔄 自动推送日报问题排查

## 📊 当前状态

根据检查，自动更新工作流配置如下：

- **工作流名称**：`Update Content from Daily Notes`
- **定时触发**：每天 UTC 22:00（北京时间早上 6:00）
- **源仓库**：`justlovemaki/CloudFlare-AI-Insight-Daily`
- **源分支**：`book`

## ⚠️ 可能的问题

### 问题 1: 工作流可能被禁用

在 GitHub Actions 页面，某些工作流可能显示为 "Disabled"。

**检查方法**：
1. 访问：`https://github.com/july-lyan/Hextra-AI-Insight-Daily/actions`
2. 查看左侧工作流列表
3. 如果 "Update Content from Daily Notes" 显示为 "Disabled"，需要启用它

**解决方法**：
- 工作流文件本身是启用的（有 `schedule` 触发器）
- 如果显示禁用，可能是 GitHub 仓库设置问题

### 问题 2: 源仓库配置

当前配置指向原始仓库 `justlovemaki/CloudFlare-AI-Insight-Daily`。

**如果您有自己的内容源仓库**，需要修改配置：

1. 编辑 `.github/workflows/build-book.yaml`
2. 修改第 9 行的默认值：
   ```yaml
   default: 'YOUR_USERNAME/YOUR_REPO'  # 改为您的源仓库
   ```
3. 修改第 13 行的分支：
   ```yaml
   default: 'YOUR_BRANCH'  # 改为您的分支名
   ```

### 问题 3: 定时任务可能还未运行

定时任务设置为每天 UTC 22:00（北京时间早上 6:00）。

**检查方法**：
1. 访问 Actions 页面
2. 查看 "Update Content from Daily Notes" 工作流
3. 查看是否有定时触发的运行记录

**如果今天还没有运行**：
- 等待到明天早上 6:00
- 或手动触发一次测试

## 🔧 手动触发测试

1. 访问：`https://github.com/july-lyan/Hextra-AI-Insight-Daily/actions`
2. 选择 "Update Content from Daily Notes" 工作流
3. 点击 "Run workflow"
4. 使用默认参数或填写您的源仓库信息
5. 点击 "Run workflow" 开始运行

## 📝 验证自动更新

工作流成功运行后：
1. 会从源仓库拉取最新的日报内容
2. 自动更新 `content/` 目录
3. 触发 "Deploy Hugo site to Pages" 工作流
4. 网站自动更新

## 🔍 检查清单

- [ ] 工作流文件存在且配置正确
- [ ] 定时触发器已配置（`schedule`）
- [ ] 源仓库地址正确（如果需要修改）
- [ ] GitHub Actions 功能已启用
- [ ] 工作流权限足够（Settings -> Actions -> General）

## 💡 提示

- 定时任务可能因为 GitHub Actions 的延迟而稍晚执行
- 如果源仓库没有更新，工作流不会拉取到新内容
- 可以查看工作流运行日志来诊断问题

---

**需要帮助？** 查看工作流运行日志，告诉我具体的错误信息。
