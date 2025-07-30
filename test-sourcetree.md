# Sourcetree 整合測試

這是一個測試檔案，用來驗證 Git 與 Sourcetree 的整合是否正常工作。

## 功能測試

1. **Diff 工具**: 使用 `git difftool` 命令
2. **Merge 工具**: 使用 `git mergetool` 命令
3. **視覺化界面**: 在 Sourcetree 中查看倉庫

## 使用方法

```bash
# 查看檔案差異
git difftool test-sourcetree.md

# 合併衝突時使用
git mergetool

# 在 Sourcetree 中打開倉庫
open -a Sourcetree .
```

## 配置狀態

- ✅ Sourcetree 已安裝
- ✅ Git 配置已完成
- ✅ Diff 工具已設定
- ✅ Merge 工具已設定

## 新增內容

這行是新增的內容，用來測試 diff 功能。 