#!/bin/bash

# Sourcetree 整合腳本
# 用於在命令行中快速打開 Sourcetree 並查看當前倉庫

# 檢查是否在 Git 倉庫中
if [ ! -d ".git" ]; then
    echo "錯誤：當前目錄不是 Git 倉庫"
    exit 1
fi

# 獲取倉庫名稱
REPO_NAME=$(basename $(git rev-parse --show-toplevel))
echo "正在 Sourcetree 中打開倉庫: $REPO_NAME"

# 打開 Sourcetree
open -a Sourcetree .

echo "✅ Sourcetree 已啟動"
echo "💡 提示："
echo "   - 使用 Cmd+Shift+D 查看檔案差異"
echo "   - 使用 Cmd+Shift+M 解決合併衝突"
echo "   - 使用 Cmd+Shift+L 查看提交歷史" 