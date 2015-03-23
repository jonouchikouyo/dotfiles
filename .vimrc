"バックアップファイルの出力先
set backupdir=~/.tmp

"スワップファイル用の出力先
set directory=~/.tmp

"行番号を表示する
set number

"タブをスペースに変換しない
set noexpandtab

"タブを表示するときの幅
set tabstop=2

"タブを挿入するときの幅
set shiftwidth=2

"新しい行のインデントを現在行と同じにする
set autoindent

"新しい行を作った時に高度な自動インデントを行う
set smarttab

"検索パターンを入力中に入力途中のパターンにマッチする文字列を表示する
set incsearch

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"バックスペースで行頭の空白、改行、挿入モード開始位置より手前の文字を削除可能にする
set backspace=indent,eol,start

"入力途中のコマンドを右下に表示する
set showcmd

"長い行の文字を改行しない
"set nowrap

"IMを無効化
set imdisable

"変更中のファイルでも保存しないで他のファイルを表示する
set hidden

"kaoriyaのundoファイルを作成させない
set noundofile

"クリップボードをWindowsと連携する
set clipboard=unnamed

"SWAPファイルを作成しない
set noswapfile

set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac

"key map
"-------------------------------
"Ctrl-@をESCAPEに変換する(インプットモード)
inoremap <C-@> <ESC>

"検索結果のハイライトをEsc連打でクリアする(ノーマルモード)
nnoremap <ESC><ESC> :nohlsearch<CR>

"Ctrl-hjklを左下上右キーに変換する(インプットモード)
imap <C-h> <LEFT>
imap <C-j> <DOWN>
imap <C-k> <UP>
imap <C-l> <RIGHT>

