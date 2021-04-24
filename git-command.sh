# git checkout $BRANCH
# 指定したブランチの削除
function g-br() {
    BRANCH=`git branch | peco | tr -d ' '`
    if [[ -n "$BRANCH" ]]; then
        echo "$BRANCH" | pbcopy
        git checkout $BRANCH
    fi
}

# git branch -D $BRANCH
# 指定したブランチの削除
function g-brd() {
    BRANCH=`git branch | peco | tr -d ' '`
    if [[ -n "$BRANCH" ]]; then
        git branch -D $BRANCH
    fi
}

function g-cmp() {
    REPO=`git remote -v | grep fetch | awk -F '[:. ]' '{print $3}'`
    START=`git log --pretty=oneline | peco`
    END=`git log --pretty=oneline | peco`

    if [[ -z $START || -z $END ]];then
        echo "canceled comparison."
        return
    fi

    echo " from : $START"
    echo " to   : $END"
    START_COMMIT=`echo $START | awk '{print $1}'`
    END_COMMIT=`echo $END | awk '{print $1}'`

    # 出力やコピーなど
    URL="https://github.com/$REPO/compare/$START_COMMIT..$END_COMMIT"
    echo "[差分]($URL)" | pbcopy
    open $URL
}

function g-sh() {
    HASH=`git log --pretty=oneline | peco | awk '{print $1}'`
    git show $HASH

    echo "you wanna copy URL(y/N)?: "
    if read -q; then
        URL="https://github.com/$REPO/commit/$HASH"
        echo "[差分]($URL)" | pbcopy
        echo $URL
    fi
}

# github this
# 現在いるディレクトリがgithubで管理されている場合、
# そのgithubリポジトリーを開く
function gh-this() {
    REPO=`git remote -v | grep fetch | awk -F '[:. ]' '{print $3}'`
    if [[ -z "$REPO" ]]; then
        return
    fi

    URL="https://github.com/$REPO/"

    echo $URL
    open $URL
}

function gh-line() {

    REPO=`git remote -v | grep fetch | awk -F '[:. ]' '{print $3}'`
    BRANCH=`git branch --contains | awk -F '[ ]' '{print $2}'`
    URL="https://github.com/$REPO/tree/$BRANCH"
    echo $URL
    open $URL

}
