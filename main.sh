# terminalデフォルトの出力情報をカスタマイズ
source ~/.zsh/prompt-customize.sh 

# Ctrl + r
# historyを検索できる
source ~/.zsh/peco-history-binding.sh

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# ls
alias ls='ls -FG'
alias ll='ls -lFG'


