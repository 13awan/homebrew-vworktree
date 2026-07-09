cask "v-work-tree" do
  version "1.1.0"
  sha256 "fa3b646e05d096e63dd0e4066c4cb2eef8c20a163dbae8fe349d1634291117b0"

  url "https://github.com/13awan/homebrew-vworktree/raw/main/releases/download/v#{version}/vWorkTree.zip"
  name "vWorkTree"
  desc "Git Worktree 管理工具"
  homepage "https://github.com/13awan/homebrew-vworktree"

  # Homebrew 只支持 major 代号（:sonoma = macOS 14），无法用 patch 表达 14.6；精确下限仍以 App 内 LSMinimumSystemVersion 为准
  depends_on macos: :sonoma

  app "vWorkTree.app"
end
