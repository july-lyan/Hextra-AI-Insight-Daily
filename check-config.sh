#!/bin/bash

# GitHub Pages 配置检查脚本

echo "🔍 检查 GitHub Pages 配置..."
echo ""

# 检查远程仓库地址
echo "📡 检查远程仓库配置："
git remote -v
echo ""

# 检查工作流文件
echo "📋 检查工作流文件："
if [ -f ".github/workflows/pages.yaml" ]; then
    echo "✅ pages.yaml 文件存在"
else
    echo "❌ pages.yaml 文件不存在"
fi

if [ -f ".github/workflows/build-book.yaml" ]; then
    echo "✅ build-book.yaml 文件存在"
else
    echo "❌ build-book.yaml 文件不存在"
fi

echo ""

# 检查 hugo.yaml 配置
echo "⚙️  检查 Hugo 配置："
if [ -f "hugo.yaml" ]; then
    echo "✅ hugo.yaml 文件存在"
    echo "   标题: $(grep -m 1 "^title:" hugo.yaml | sed 's/^title: *//')"
else
    echo "❌ hugo.yaml 文件不存在"
fi

echo ""

# 检查内容目录
echo "📁 检查内容目录："
if [ -d "content/cn" ]; then
    CN_COUNT=$(find content/cn -name "*.md" -type f | wc -l)
    echo "✅ content/cn 目录存在（包含 $CN_COUNT 个 Markdown 文件）"
else
    echo "❌ content/cn 目录不存在"
fi

if [ -d "content/en" ]; then
    EN_COUNT=$(find content/en -name "*.md" -type f | wc -l)
    echo "✅ content/en 目录存在（包含 $EN_COUNT 个 Markdown 文件）"
else
    echo "❌ content/en 目录不存在"
fi

echo ""

# 检查 Git 状态
echo "📊 Git 状态："
git status --short

echo ""
echo "✅ 检查完成！"
echo ""
echo "📝 下一步操作："
echo "1. 访问您的 GitHub 仓库页面"
echo "2. 进入 Settings -> Pages"
echo "3. 将 Source 设置为 'GitHub Actions'"
echo "4. 配置 APP_BASE_URL 变量（可选）"
echo "5. 在 Actions 标签页手动触发部署"
echo ""
echo "详细说明请参考 PAGES_CONFIG.md"
