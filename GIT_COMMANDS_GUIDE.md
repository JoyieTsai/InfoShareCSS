# Git 指令完整指南

## 📋 目錄
1. [基本設定](#基本設定)
2. [倉庫操作](#倉庫操作)
3. [檔案管理](#檔案管理)
4. [提交管理](#提交管理)
5. [分支管理](#分支管理)
6. [遠端倉庫](#遠端倉庫)
7. [歷史查看](#歷史查看)
8. [合併與衝突](#合併與衝突)
9. [暫存與恢復](#暫存與恢復)
10. [進階功能](#進階功能)

---

## 🔧 基本設定

### 全域設定
```bash
# 設定用戶名稱和郵箱
git config --global user.name "您的姓名"
git config --global user.email "您的郵箱"

# 設定預設編輯器
git config --global core.editor "code --wait"

# 設定預設分支名稱
git config --global init.defaultBranch main

# 查看所有設定
git config --global --list

# 查看特定設定
git config --global user.name
```

### 專案設定
```bash
# 專案特定設定（移除 --global）
git config user.name "專案特定姓名"
git config user.email "專案特定郵箱"
```

---

## 📁 倉庫操作

### 初始化倉庫
```bash
# 初始化新的 Git 倉庫
git init

# 初始化並設定預設分支
git init -b main

# 複製遠端倉庫
git clone <repository-url>

# 複製到指定目錄
git clone <repository-url> <directory-name>

# 淺複製（只下載最新提交）
git clone --depth 1 <repository-url>
```

### 倉庫狀態
```bash
# 查看倉庫狀態
git status

# 簡潔狀態顯示
git status --short
git status -s

# 忽略檔案狀態
git status --ignored
```

---

## 📄 檔案管理

### 檔案追蹤
```bash
# 添加檔案到暫存區
git add <filename>

# 添加所有檔案
git add .

# 添加所有變更（包括刪除）
git add -A

# 添加所有修改的檔案
git add -u

# 互動式添加
git add -i

# 添加特定類型檔案
git add *.js
git add src/
```

### 檔案移除
```bash
# 從暫存區移除檔案（保留工作區檔案）
git reset HEAD <filename>

# 從暫存區和工作區移除檔案
git rm <filename>

# 從暫存區移除檔案（保留工作區）
git rm --cached <filename>

# 強制移除
git rm -f <filename>
```

### 檔案移動
```bash
# 移動檔案
git mv <old-name> <new-name>

# 移動到目錄
git mv <filename> <directory>/
```

---

## 💾 提交管理

### 創建提交
```bash
# 基本提交
git commit -m "提交訊息"

# 添加所有變更並提交
git commit -am "提交訊息"

# 修改最後一次提交
git commit --amend

# 修改最後一次提交訊息
git commit --amend -m "新訊息"

# 空提交（用於觸發 CI/CD）
git commit --allow-empty -m "空提交"
```

### 提交訊息
```bash
# 使用預設編輯器編輯提交訊息
git commit

# 查看提交訊息模板
git commit -F <message-file>

# 簽名提交
git commit -S -m "簽名提交"
```

---

## 🌿 分支管理

### 分支操作
```bash
# 查看所有分支
git branch

# 查看所有分支（包括遠端）
git branch -a

# 創建新分支
git branch <branch-name>

# 創建並切換到新分支
git checkout -b <branch-name>
git switch -c <branch-name>

# 切換分支
git checkout <branch-name>
git switch <branch-name>

# 刪除分支
git branch -d <branch-name>

# 強制刪除分支
git branch -D <branch-name>

# 重新命名分支
git branch -m <old-name> <new-name>
```

### 分支合併
```bash
# 合併分支到當前分支
git merge <branch-name>

# 合併並創建合併提交
git merge --no-ff <branch-name>

# 中止合併
git merge --abort

# 使用策略合併
git merge -s recursive <branch-name>
```

---

## 🌐 遠端倉庫

### 遠端操作
```bash
# 查看遠端倉庫
git remote -v

# 添加遠端倉庫
git remote add <name> <url>

# 移除遠端倉庫
git remote remove <name>

# 重新命名遠端倉庫
git remote rename <old-name> <new-name>

# 更新遠端倉庫 URL
git remote set-url <name> <new-url>
```

### 推送與拉取
```bash
# 推送到遠端
git push <remote> <branch>

# 推送到遠端並設定上游
git push -u <remote> <branch>

# 強制推送（謹慎使用）
git push --force

# 安全強制推送
git push --force-with-lease

# 從遠端拉取
git pull <remote> <branch>

# 只拉取不合併
git fetch <remote>

# 拉取所有遠端分支
git fetch --all
```

---

## 📜 歷史查看

### 提交歷史
```bash
# 查看提交歷史
git log

# 簡潔歷史
git log --oneline

# 圖形化歷史
git log --graph --oneline --all

# 查看特定檔案的歷史
git log <filename>

# 查看特定作者的提交
git log --author="作者名"

# 查看特定時間範圍的提交
git log --since="2023-01-01" --until="2023-12-31"

# 限制顯示數量
git log -n 10
```

### 差異查看
```bash
# 查看工作區與暫存區的差異
git diff

# 查看暫存區與最後提交的差異
git diff --cached
git diff --staged

# 查看兩個提交的差異
git diff <commit1> <commit2>

# 查看特定檔案的差異
git diff <filename>

# 查看分支差異
git diff <branch1>..<branch2>

# 統計差異
git diff --stat
```

### 詳細查看
```bash
# 查看提交詳細資訊
git show <commit-hash>

# 查看特定檔案的詳細資訊
git show <commit-hash>:<filename>

# 查看分支資訊
git show-branch

# 查看標籤資訊
git show <tag-name>
```

---

## 🔀 合併與衝突

### 衝突解決
```bash
# 查看衝突檔案
git status

# 使用合併工具
git mergetool

# 使用特定工具
git mergetool -t <tool-name>

# 中止合併
git merge --abort

# 繼續合併
git merge --continue
```

### 變基操作
```bash
# 變基到主分支
git rebase main

# 互動式變基
git rebase -i <commit-hash>

# 中止變基
git rebase --abort

# 繼續變基
git rebase --continue

# 跳過當前提交
git rebase --skip
```

---

## 📦 暫存與恢復

### 暫存工作
```bash
# 暫存當前工作
git stash

# 暫存並添加訊息
git stash push -m "暫存訊息"

# 查看暫存列表
git stash list

# 應用暫存
git stash apply

# 應用特定暫存
git stash apply stash@{n}

# 應用並移除暫存
git stash pop

# 移除暫存
git stash drop stash@{n}

# 清除所有暫存
git stash clear
```

### 恢復操作
```bash
# 恢復檔案到最後提交
git restore <filename>

# 恢復檔案到特定提交
git restore --source=<commit> <filename>

# 恢復暫存區
git restore --staged <filename>

# 重置到特定提交
git reset <commit-hash>

# 軟重置（保留變更）
git reset --soft <commit-hash>

# 混合重置（預設）
git reset --mixed <commit-hash>

# 硬重置（丟失變更）
git reset --hard <commit-hash>
```

---

## ⚡ 進階功能

### 標籤管理
```bash
# 創建標籤
git tag <tag-name>

# 創建帶訊息的標籤
git tag -a <tag-name> -m "標籤訊息"

# 查看所有標籤
git tag

# 查看標籤詳細資訊
git show <tag-name>

# 刪除標籤
git tag -d <tag-name>

# 推送標籤到遠端
git push origin <tag-name>

# 推送所有標籤
git push origin --tags
```

### 子模組
```bash
# 添加子模組
git submodule add <repository-url> <path>

# 初始化子模組
git submodule init

# 更新子模組
git submodule update

# 遞迴更新
git submodule update --recursive

# 移除子模組
git submodule deinit <path>
git rm <path>
```

### 工作區管理
```bash
# 查看工作區狀態
git worktree list

# 添加工作區
git worktree add <path> <branch>

# 移除工作區
git worktree remove <path>

# 清理工作區
git worktree prune
```

### 清理與維護
```bash
# 清理未追蹤檔案
git clean

# 預覽清理
git clean -n

# 強制清理
git clean -f

# 清理目錄
git clean -fd

# 垃圾回收
git gc

# 重新打包
git repack

# 驗證倉庫
git fsck
```

---

## 🛠️ 實用技巧

### 別名設定
```bash
# 設定別名
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# 使用別名
git co main
git br feature-branch
git ci -m "提交訊息"
git st
```

### 常用組合
```bash
# 快速提交所有變更
git add . && git commit -m "更新"

# 拉取並合併
git pull origin main

# 推送並設定上游
git push -u origin main

# 查看簡潔歷史
git log --oneline --graph --all -10
```

### 故障排除
```bash
# 查看 Git 版本
git --version

# 查看幫助
git help <command>

# 查看命令手冊
git <command> --help

# 診斷問題
git diagnose
```

---

## 📚 學習資源

- [Git 官方文檔](https://git-scm.com/doc)
- [Git 圖解教程](https://learngitbranching.js.org/)
- [Git 工作流程](https://guides.github.com/introduction/flow/)
- [Git 最佳實踐](https://git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project)

---

## 💡 提示

1. **經常使用 `git status`** 查看當前狀態
2. **使用有意義的提交訊息** 描述變更內容
3. **定期推送** 避免遺失工作
4. **使用分支** 進行功能開發
5. **備份重要工作** 使用多個遠端倉庫 