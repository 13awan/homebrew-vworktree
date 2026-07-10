cask "v-work-tree" do
  version "1.1.2"
  sha256 "15313fef82eeb679f8d93887f01cc8d09248e52ec7ee5f0560ff34f4e38d8737"

  url "https://github.com/13awan/homebrew-vworktree/raw/main/releases/download/v#{version}/vWorkTree.zip"
  name "vWorkTree"
  desc "Git Worktree 管理工具"
  homepage "https://github.com/13awan/homebrew-vworktree"

  # Homebrew 只支持 major 代号（:sonoma = macOS 14），无法用 patch 表达 14.6；精确下限仍以 App 内 LSMinimumSystemVersion 为准
  depends_on macos: :sonoma

  app "vWorkTree.app"
end
