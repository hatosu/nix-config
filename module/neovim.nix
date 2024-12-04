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
      vim-commentary
      onedarker-nvim
      telescope-nvim
      presence-nvim
      syntastic
      indentLine
      supertab
      undotree
      awesome-vim-colorschemes
    ];

    # init.vim
    extraConfig = ''
      
      " apply theme
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

      " telescope
      nnoremap <leader>f <cmd>Telescope find_files<cr>
      nnoremap <leader>g <cmd>Telescope live_grep<cr>
      nnoremap <leader>b <cmd>Telescope buffers<cr>
      
      " discord presence
      let g:presence_auto_update         = 1
      let g:presence_neovim_image_text   = "The One True Text Editor"
      let g:presence_main_image          = "neovim"
      let g:presence_client_id           = "793271441293967371"
      let g:presence_debounce_timeout    = 10
      let g:presence_enable_line_number  = 0
      let g:presence_blacklist           = []
      let g:presence_buttons             = 1
      let g:presence_file_assets         = {}
      let g:presence_show_time           = 1
      let g:presence_editing_text        = "Editing %s"
      let g:presence_file_explorer_text  = "Browsing %s"
      let g:presence_git_commit_text     = "Committing changes"
      let g:presence_reading_text        = "Reading %s"
      let g:presence_workspace_text      = "Working on %s"
      let g:presence_line_number_text    = "Line %s out of %s"
      
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

};}
