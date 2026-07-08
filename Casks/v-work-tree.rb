cask "v-work-tree" do
  version "1.0"
  sha256 "c629c5c903836423a2b9a74d043d9c40bdc9befb89f50d8d615f8af5783b5952"

  url "https://github.com/13awan/homebrew-vworktree/raw/main/releases/download/v#{version}/vWorkTree.zip"
  name "vWorkTree"
  desc "Git Worktree 管理工具"
  homepage "https://github.com/13awan/homebrew-vworktree"

  # Homebrew 只支持 major 代号（:sonoma = macOS 14），无法用 patch 表达 14.6；精确下限仍以 App 内 LSMinimumSystemVersion 为准
  depends_on macos: :sonoma

  app "vWorkTree.app"
end
