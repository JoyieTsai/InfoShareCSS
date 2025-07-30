# Sourcetree 與 Git 整合指南

## 概述

本指南說明如何在 macOS 上設定 Git 與 Sourcetree 的完整整合。

## 安裝狀態

### ✅ 已完成的配置

1. **Sourcetree 應用程式**
   - 位置：`/Applications/Sourcetree.app`
   - 狀態：已安裝並可用

2. **Git 配置**
   - 版本：2.50.1 (Homebrew)
   - 用戶：Joyie Tsai (joyie.tsai@gmail.com)
   - 預設 diff 工具：Sourcetree
   - 預設 merge 工具：Sourcetree

3. **整合腳本**
   - 檔案：`sourcetree-integration.sh`
   - 功能：快速在 Sourcetree 中打開當前倉庫

## 使用方法

### 1. 命令行整合

```bash
# 在 Sourcetree 中打開當前倉庫
./sourcetree-integration.sh

# 或直接使用
open -a Sourcetree .

# 查看檔案差異 (需要 Xcode 命令行工具)
git difftool <filename>

# 解決合併衝突
git mergetool
```

### 2. Sourcetree GUI 功能

#### 基本操作
- **查看提交歷史**: 主視窗顯示所有提交
- **查看分支**: 左側分支視圖
- **檔案差異**: 雙擊檔案查看差異
- **暫存變更**: 右側暫存區域

#### 快捷鍵
- `Cmd+Shift+D`: 查看檔案差異
- `Cmd+Shift+M`: 解決合併衝突
- `Cmd+Shift+L`: 查看提交歷史
- `Cmd+Shift+B`: 查看分支
- `Cmd+Shift+F`: 搜尋提交

### 3. 進階功能

#### 遠端倉庫管理
1. 在 Sourcetree 中點擊 "New"
2. 選擇 "Clone from URL"
3. 輸入 Git 倉庫 URL
4. 選擇本地儲存位置

#### 分支管理
- 創建新分支：右鍵點擊分支 → "Create Branch"
- 切換分支：雙擊目標分支
- 合併分支：右鍵點擊分支 → "Merge"

#### 衝突解決
1. 當發生合併衝突時，Sourcetree 會顯示衝突檔案
2. 雙擊衝突檔案打開內建編輯器
3. 選擇要保留的變更
4. 標記為已解決
5. 完成合併

## 配置檔案

### Git 全域配置
```bash
# 查看當前配置
git config --global --list | grep sourcetree

# 手動設定 diff 工具
git config --global diff.tool sourcetree
git config --global difftool.sourcetree.cmd 'open -a Sourcetree'

# 手動設定 merge 工具
git config --global merge.tool sourcetree
git config --global mergetool.sourcetree.trustexitcode true
```

### 專案特定配置
```bash
# 為特定專案設定不同的工具
git config diff.tool vscode
git config difftool.vscode.cmd 'code --diff $LOCAL $REMOTE'
```

## 故障排除

### 問題 1: opendiff 工具不可用
**錯誤**: `xcode-select: error: tool 'opendiff' requires Xcode`

**解決方案**:
1. 安裝 Xcode 命令行工具：
   ```bash
   xcode-select --install
   ```
2. 或使用替代的 diff 工具：
   ```bash
   git config --global difftool.sourcetree.cmd 'open -a Sourcetree'
   ```

### 問題 2: Sourcetree 無法打開倉庫
**解決方案**:
1. 確認倉庫路徑正確
2. 檢查 Sourcetree 權限設定
3. 重新啟動 Sourcetree

### 問題 3: 合併衝突無法解決
**解決方案**:
1. 使用 Sourcetree 的內建編輯器
2. 或設定外部編輯器：
   ```bash
   git config --global core.editor "code --wait"
   ```

## 最佳實踐

1. **定期更新**: 保持 Sourcetree 和 Git 為最新版本
2. **備份配置**: 定期備份 Git 配置檔案
3. **使用分支**: 為新功能創建獨立分支
4. **提交訊息**: 使用清晰的提交訊息
5. **定期同步**: 定期與遠端倉庫同步

## 相關資源

- [Sourcetree 官方文檔](https://www.sourcetreeapp.com/)
- [Git 官方文檔](https://git-scm.com/doc)
- [Git 配置指南](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration) 