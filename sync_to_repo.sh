#!/bin/bash

# 自动同步本地代码到远程仓库（GitHub）

set -e  # 一旦出错则终止脚本执行

# 获取当前目录（仓库路径）
REPO_DIR=$(pwd)

cd "$REPO_DIR"

echo "🔄 检查当前 Git 状态..."
git status

# 添加所有更改（包括新增、修改、删除）
echo "➕ 添加所有变更..."
git add -A

# 获取当前时间作为默认提交信息
COMMIT_MSG="自动提交：$(date '+%Y-%m-%d %H:%M:%S')"

# 提交变更
echo "✅ 提交更改：$COMMIT_MSG"
git commit -m "$COMMIT_MSG" || echo "⚠️ 没有需要提交的更改"

# 推送到远程仓库（当前分支）
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "🚀 推送到远程仓库分支：$CURRENT_BRANCH"
git push origin "$CURRENT_BRANCH"

echo "✅ 同步完成！"
