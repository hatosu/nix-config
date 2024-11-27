{ config, pkgs, ... }: { home-manager.users.hatosu.programs.neovim = {
enable = true; defaultEditor = true; viAlias = true; vimAlias = true;
vimdiffAlias = true; package = pkgs.neovim-unwrapped;

    # plugins
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-airline
      vim-airline-themes
      vim-polyglot
      vim-suda
      vim-surround
      awesome-vim-colorschemes
      syntastic
      indentLine
      vim-commentary
      supertab
      undotree
    ];

    # init.vim
    extraConfig = ''

      " configure theme
      let g:sierra_Twilight = 1
      colorscheme sierra
      autocmd VimEnter * highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

      " set bar theme
      autocmd VimEnter * AirlineTheme minimalist

      " add numbered lines
      set nu

      " turn on syntax highlighting
      syntax on

      " configure font
      set guifont=Source\ Code\ Pro:h11

      " bind Ctrl+S to save
      nnoremap <C-s> :SudaWrite<CR>

      " hjkl to move between splits
      nmap <silent> <c-k> :wincmd k<CR>
      nmap <silent> <c-j> :wincmd j<CR>
      nmap <silent> <c-h> :wincmd h<CR>
      nmap <silent> <c-l> :wincmd l<CR>

      " binds for nerdcommenter
      filetype plugin on
      nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
      nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>

      " fix clipboard
      set clipboard=unnamed
      let g:clipboard = {
          \   'copy': {
          \       '+': ['${pkgs.wl-clipboard}/bin/wl-copy', '--trim-newline'],
          \       '*': ['${pkgs.wl-clipboard}/bin/wl-copy', '--trim-newline'],
          \   },
          \   'paste': {
          \       '+': ['${pkgs.wl-clipboard}/bin/wl-paste', '--no-newline'],
          \       '*': ['${pkgs.wl-clipboard}/bin/wl-paste', '--no-newline'],
          \   },
          \ }

    '';

  };
}
