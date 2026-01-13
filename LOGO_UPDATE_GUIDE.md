# 🎨 Logo 图片修改指南

## 📋 当前情况

网站使用 logo 图片显示标题，图片文件位于：
- `static/images/logo.png`（浅色主题）
- `static/images/logo-dark.png`（深色主题）

这些图片中包含"何夕2077 AI日报"的文字，需要修改为"刘大雁AI日报"。

## 🛠️ 修改方法

### 方法 1: 使用图片编辑软件（推荐）

1. **下载图片编辑工具**（任选其一）：
   - [GIMP](https://www.gimp.org/)（免费）
   - [Photoshop](https://www.adobe.com/products/photoshop.html)（付费）
   - [Figma](https://www.figma.com/)（在线，免费）
   - [Canva](https://www.canva.com/)（在线，免费）

2. **打开图片文件**：
   - 打开 `static/images/logo.png`
   - 打开 `static/images/logo-dark.png`

3. **修改文字**：
   - 找到"何夕2077"文字
   - 使用文字工具将其改为"刘大雁"
   - 保持"AI日报"部分不变（包括黑色框样式）

4. **保存文件**：
   - 保持相同的文件名和格式（PNG）
   - 保持相同的尺寸（455 x 130 像素）

### 方法 2: 使用在线工具

1. 访问 [Photopea](https://www.photopea.com/)（免费的在线 Photoshop）
2. 上传 `static/images/logo.png`
3. 使用文字工具修改"何夕2077"为"刘大雁"
4. 导出为 PNG 格式
5. 替换原文件

### 方法 3: 重新设计 Logo（如果需要）

如果您想完全重新设计 logo，可以：

1. **使用设计工具**：
   - Figma
   - Canva
   - Adobe Illustrator

2. **设计要求**：
   - 尺寸：455 x 130 像素
   - 格式：PNG（支持透明背景）
   - 文字："刘大雁AI日报"
   - 样式：保持"AI日报"在黑色框内的设计

3. **导出两个版本**：
   - `logo.png`：浅色背景版本
   - `logo-dark.png`：深色背景版本

## 📝 修改后的步骤

1. 修改完图片后，将文件保存到：
   ```
   static/images/logo.png
   static/images/logo-dark.png
   ```

2. 提交更改：
   ```bash
   git add static/images/logo.png static/images/logo-dark.png
   git commit -m "chore: 更新logo图片文字为刘大雁AI日报"
   git push origin main
   ```

3. 等待部署完成（2-5分钟）

4. 清除浏览器缓存后访问网站验证

## 🎨 Logo 样式参考

根据原设计，logo 应该包含：
- **左侧**："刘大雁"（黑色文字）
- **右侧**："AI日报"（白色文字，在黑色矩形框内）

## 💡 提示

- 如果使用 Photoshop/GIMP，可以使用"文字工具"直接编辑文字图层
- 确保文字字体和大小与原设计一致
- 保持图片质量和清晰度
- 测试浅色和深色两种主题下的显示效果

---

**需要帮助？** 如果您不熟悉图片编辑，我可以帮您创建一个简单的 HTML/CSS 解决方案来替代图片 logo。
