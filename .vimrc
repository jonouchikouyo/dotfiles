"-------------------------------
"Vim Setting
"-------------------------------
set nocompatible
"colorscheme solarized			"カラースキーム
"set background=dark				"背景
colorscheme metroid 				"カラースキーム
set background=light				"背景
syntax on										"シンタックスのカラーリングオン

"-------------------------------
"File
"-------------------------------
"set backupdir=~/.tmp				"バックアップファイルの出力先
"set directory=~/.tmp				"スワップファイル用の出力先
set autoread								"更新時自動再読み込み
set hidden									"変更中でも保存しないで他のファイルを表示する
set noswapfile							"スワップファイルを作成しない
set nobackup								"バックアップを取らない
set noundofile							"kaoriyaのundoファイルを作成させない

"-------------------------------
"View
"-------------------------------
set number									"行番号を表示する
set showmatch								"閉括弧が入力された時、対応する括弧を強調する
set cursorline							"カーソルラインのハイライト
set showcmd									"入力途中のコマンドを右下に表示する
set mouse=a									"全モードでマウスを有効化"
set nowrap									"長い行の文字を改行しない

"-------------------------------
"Tab Indent
"-------------------------------
set tabstop=2								"タブを表示するときの幅
set shiftwidth=2						"タブを挿入するときの幅
set autoindent							"新しい行のインデントを現在行と同じにする
set smarttab								"新しい行を作った時に高度な自動インデントを行う
set smartindent							"スマートインデント
set noexpandtab							"タブをスペースに変換しない

"-------------------------------
"Search
"-------------------------------
set incsearch								"検索パターンを入力中パターンにマッチする文字列を表示する
set wrapscan								"最後まで検索したら先頭に戻る
set ignorecase							"大文字小文字無視
set hlsearch								"検索文字をハイライト

"-------------------------------
"Status Line
"-------------------------------
set laststatus=2						"ステータスラインを常に表示する"
set ruler										"ルーラーを表示する"
"ステータスラインに表示する情報
"ファイル名/ファイルタイプ/エンコーディング/ファイルフォーマット(DOS, Unix)
"/列数/行番号/行総数
set statusline=%F%m%r%h%w\%=[FILETYPE=%Y][ENC=%{&fenc}][%{&ff}]%=%c,\%l/%L

"-------------------------------
"Command Line
"-------------------------------
set cmdheight=2							"コマンドラインの高さ
set wildmenu								"コマンドラインモードでの補完を有効
set wildmode=list:full			"コマンドリスト表示
set wildchar=<tab>					"コマンドラインを補完するキー
set history=1000						"コマンド検索履歴の数

"-------------------------------
"Assist imputting
"-------------------------------
set backspace=indent,eol,start	"バックスペースで特殊記号も削除可能
set formatoptions=lmoq					"整形オプション,マルチバイト系を追加
set whichwrap=b,s,h,s,<,>,[,]		"カーソルを行頭, 行末で止まらないようにする
set clipboard=unnamed						"クリップボードをWindowsと連携する
set imdisable										"IMを無効化

"-------------------------------
"Charset, Line ending
"-------------------------------
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac

"-------------------------------
"key map
"-------------------------------
"Ctrl-@をESCAPEに変換する(インプットモード)
inoremap <C-@> <ESC>
"Ctrl-hjklを左下上右キーに変換する(インプットモード)
imap <C-h> <LEFT>
imap <C-j> <DOWN>
imap <C-k> <UP>
imap <C-l> <RIGHT>
"検索結果のハイライトをEsc連打でクリアする(ノーマルモード)
nnoremap <ESC><ESC> :nohlsearch<CR>
"INSERTモードのときステータスバーの色が変わる
let g:hi_insert = 'hi StatusLine gui=None guifg=Black guibg=Yellow cterm=None ctermfg=Black ctermbg=Yellow'

if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction

function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction

"-------------------------------
"NetBundle設定
"-------------------------------
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
	call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	call neobundle#end()
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'Gist.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'Townk/vim-autoclose'

call neobundle#end()

filetype plugin indent on

