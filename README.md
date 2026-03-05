# dotfiles

macOS / WSL 向けの個人用 dotfiles リポジトリ。

## 管理対象

- **zsh** - `.zshrc`（Oh My Zsh + Powerlevel10k）
- **Neovim** - カスタムプラグイン設定・`lazy-lock.json`
- **WezTerm** - `wezterm.lua`

## ディレクトリ構成

```
.
├── .zshrc                          # zsh 設定
├── .config/
│   └── wezterm/
│       └── wezterm.lua             # WezTerm 設定
├── nvim/
│   ├── lazy-lock.json              # lazy.nvim ロックファイル
│   └── lua/custom/plugins/
│       ├── init.lua                # プラグイン読み込み
│       ├── my-plugins.lua          # カスタムプラグイン
│       └── tree-nvim.lua           # nvim-tree 設定
└── link.sh                         # シンボリックリンク作成スクリプト
```

## セットアップ

```bash
# 1. dotfiles を clone
git clone https://github.com/massan/dotfiles.git ~/dotfiles

# 2. kickstart.nvim を clone
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim

# 3. kickstart.nvim の init.lua を編集（後述）

# 4. シンボリックリンクを作成
cd ~/dotfiles
./link.sh
```

## Neovim の構成

[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) をベースに、カスタムプラグイン設定をシンボリックリンクで追加する方式。

- `~/.config/nvim/` — kickstart.nvim 本体（直接 clone）
- `~/dotfiles/nvim/lua/custom/plugins/` — 自前のプラグイン設定（`link.sh` でシンボリックリンク）

kickstart.nvim 自体は dotfiles で管理せず、カスタム部分のみをこのリポジトリで管理する。

### kickstart.nvim への変更点

clone 後に 1 箇所だけ変更が必要。`~/.config/nvim/init.lua` の以下の行のコメントアウトを解除する：

```diff
- -- { import = 'custom.plugins' },
+ { import = 'custom.plugins' },
```

これにより `lua/custom/plugins/` 配下のカスタムプラグイン設定が読み込まれるようになる。`link.sh` がこのディレクトリに dotfiles のプラグイン設定ファイルをシンボリックリンクする。

## 対応環境

- macOS
- WSL (Windows Subsystem for Linux)
