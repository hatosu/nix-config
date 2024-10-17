{config,pkgs,...}:{programs.neovim={enable=true;defaultEditor=true;viAlias=true;vimAlias=true;vimdiffAlias=true;package=pkgs.neovim-unwrapped;

    plugins = with pkgs.vimPlugins; [
      awesome-vim-colorschemes
      syntastic
      vim-nix
      vim-fugitive
      vim-airline
      vim-airline-themes
      vim-polyglot
      vim-suda
      indentLine
      nerdcommenter
      vim-surround
      supertab
      undotree
      gv-vim
      vim-nerdtree-tabs
    ];

    extraConfig = ''
      colorscheme sierra
      autocmd VimEnter * AirlineTheme minimalist
      autocmd FileType apache setlocal commentstring=#\ %s
      set nu
      syntax on
      set guifont=Source\ Code\ Pro:h11
      filetype plugin indent on
      set nocompatible
      filetype off 
      filetype plugin indent on
      let NERDTreeShowHidden=1
      let g:ctrlp_map = '<c-p>'
      let g:ctrlp_cmd = 'CtrlP'
      nnoremap <C-s> :SudaWrite<CR>
      nnoremap <C-c> :q!<CR>
      nmap <silent> <c-k> :wincmd k<CR>
      nmap <silent> <c-j> :wincmd j<CR>
      nmap <silent> <c-h> :wincmd h<CR>
      nmap <silent> <c-l> :wincmd l<CR>
      nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
      nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>
      nnoremap <silent> <c-t> :}}
      set clipboard=unnamed
      let g:clipboard = {
          \   'copy': {
          \       '+': ['wl-copy', '--trim-newline'],
          \       '*': ['wl-copy', '--trim-newline'],
          \   },
          \   'paste': {
          \       '+': ['wl-paste', '--no-newline'],
          \       '*': ['wl-paste', '--no-newline'],
          \   },
          \ }
    '';

  };
}
