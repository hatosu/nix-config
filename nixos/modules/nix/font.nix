{pkgs,lib,...}:{fonts.packages = with pkgs; [

    # enable fonts

    nerdfonts
    source-code-pro
    font-awesome
    gohufont
    hack-font

    fira
    fira-mono
    fira-code
    fira-code-symbols

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji

  ];
}
