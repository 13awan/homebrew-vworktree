# homebrew-vworktree

**vWorkTree** 是一款 macOS 应用，用于管理 Git Worktree：支持多仓库、拖拽添加、Worktree 创建与删除，并集成 Venom 工作流。

本仓库通过 [Homebrew](https://brew.sh) 分发该应用，作为第三方 Tap 提供安装、升级与卸载。

## 功能特性

- 管理多个 Git 仓库
- 创建和管理 Git worktree
- 使用安全作用域书签记住仓库位置
- 快速访问 worktree 分支
- 集成 Venom 工作流
- 使用 SwiftData 进行数据持久化

## 环境要求

- 应用要求 macOS **14.6** 或更高
- 已安装 [Homebrew](https://brew.sh)

## 安装

```bash
brew tap 13awan/vworktree
brew install --cask v-work-tree
```

## 升级

```bash
brew upgrade --cask v-work-tree
```

## 卸载

```bash
brew uninstall --cask v-work-tree
```

若不再需要本 Tap，可移除：

```bash
brew untap 13awan/vworktree
```
