curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install simnalamburt/shellder
fisher install jethrokuan/z

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Fira Code Regular Nerd Font Complete.otf"https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf