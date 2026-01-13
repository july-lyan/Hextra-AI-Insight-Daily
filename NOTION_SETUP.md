# 📝 Notion 同步设置指南

本指南将帮助您配置每日自动推送内容到 Notion。

## 🎯 功能说明

配置完成后，系统会：
- ✅ 每日自动将最新的 AI 日报内容同步到 Notion
- ✅ 在内容更新工作流完成后自动触发
- ✅ 支持手动触发同步指定日期的内容
- ✅ 自动检测并更新已存在的页面

## 📋 前置要求

1. 拥有 Notion 账户
2. 已 Fork 项目到您的 GitHub 账户
3. 已配置 GitHub Pages 部署（参考 [DEPLOYMENT.md](./DEPLOYMENT.md)）

## 🔧 配置步骤

### 步骤 1: 创建 Notion Integration

1. 访问 https://www.notion.so/my-integrations
2. 点击 **"+ New integration"** 按钮
3. 填写信息：
   - **Name**: `AI日报同步`（可自定义）
   - **Workspace**: 选择您的工作区
   - **Type**: 选择 **Internal**
4. 点击 **Submit** 创建
5. 复制生成的 **Internal Integration Token**（类似 `secret_xxxxxxxxxxxxx`）
   - ⚠️ **重要**：请妥善保存此 Token，稍后需要用到

### 步骤 2: 创建 Notion 数据库

1. 在 Notion 中创建一个新页面
2. 输入 `/database` 并选择 **Table - Inline**
3. 添加以下属性列：
   - **Title** (类型: `Title`) - 用于存储文章标题
   - **Date** (类型: `Date`) - 用于存储发布日期
   - **Description** (类型: `Text`) - 用于存储描述
4. 点击数据库右上角的 **"..."** 菜单
5. 选择 **"Connections"** -> **"Add connections"**
6. 选择您刚才创建的 Integration（如 `AI日报同步`）
7. 复制数据库的 URL，格式类似：
   ```
   https://www.notion.so/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx?v=...
   ```
   从 URL 中提取数据库 ID（`xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx` 部分）

### 步骤 3: 配置 GitHub Secrets

1. 进入您 Fork 的仓库页面
2. 点击 **Settings** -> **Secrets and variables** -> **Actions**
3. 点击 **New repository secret** 添加以下两个 Secret：

   **Secret 1:**
   - **Name**: `NOTION_TOKEN`
   - **Value**: 粘贴步骤 1 中复制的 Integration Token

   **Secret 2:**
   - **Name**: `NOTION_DATABASE_ID`
   - **Value**: 粘贴步骤 2 中提取的数据库 ID

4. 点击 **Add secret** 保存

### 步骤 4: 验证配置

1. 进入仓库的 **Actions** 标签页
2. 选择 **Sync to Notion** 工作流
3. 点击 **Run workflow** -> **Run workflow** 手动触发
4. 等待工作流完成
5. 检查 Notion 数据库，应该能看到新创建的页面

## 🎨 Notion 数据库结构示例

您的 Notion 数据库应该包含以下列：

| Title | Date | Description |
|-------|------|-------------|
| AI日报标题 | 2026-01-14 | 文章描述... |

## ⚙️ 工作流触发方式

### 1. 自动触发（推荐）
- 当 **Update Content from Daily Notes** 工作流成功完成后自动触发
- 每天 UTC 时间 1:00（北京时间早上 9:00）自动运行

### 2. 手动触发
1. 进入 **Actions** -> **Sync to Notion**
2. 点击 **Run workflow**
3. 可选：指定日期（格式：`YYYY-MM-DD`），留空则同步最新内容
4. 点击 **Run workflow**

### 3. 定时触发
工作流已配置每天自动运行一次，无需手动操作。

## 🔍 故障排查

### Q1: 工作流运行失败，提示 "Unauthorized"

**原因**：Notion Token 配置错误或已失效

**解决方法**：
1. 检查 `NOTION_TOKEN` Secret 是否正确配置
2. 重新生成 Integration Token 并更新 Secret

### Q2: 提示 "Database not found"

**原因**：数据库 ID 错误或 Integration 未连接到数据库

**解决方法**：
1. 检查 `NOTION_DATABASE_ID` Secret 是否正确
2. 确认 Integration 已连接到数据库（步骤 2.6）

### Q3: 内容格式不正确

**原因**：Markdown 转 Notion blocks 的转换可能不完美

**解决方法**：
- 当前实现是基础版本，复杂格式可能需要手动调整
- 可以在 Notion 中手动编辑格式

### Q4: 工作流没有自动触发

**原因**：依赖的工作流未成功完成

**解决方法**：
1. 检查 **Update Content from Daily Notes** 工作流是否成功
2. 确认工作流配置中的 `workflow_run` 触发器正确

## 📝 自定义配置

### 修改同步时间

编辑 `.github/workflows/notion-sync.yaml` 文件中的 `schedule` 部分：

```yaml
schedule:
  - cron: '0 1 * * *'  # UTC 时间 1:00，北京时间 9:00
```

Cron 格式说明：
- `0 1 * * *` = 每天 UTC 1:00
- `0 9 * * *` = 每天 UTC 9:00（北京时间 17:00）
- `0 */6 * * *` = 每 6 小时运行一次

### 修改数据库属性

如果您的 Notion 数据库使用了不同的属性名，需要修改工作流中的属性名称：

1. 打开 `.github/workflows/notion-sync.yaml`
2. 找到 `properties` 部分
3. 修改属性名以匹配您的数据库结构

## 🎉 完成！

配置完成后，您的 AI 日报内容将自动同步到 Notion！

---

**最后更新**：2026-01-14
