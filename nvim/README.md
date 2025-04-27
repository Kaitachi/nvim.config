# Windows Instructions

Environment Variables
* `XDG_CONFIG_HOME` - `C:\<home>\.config`
* `XDG_DATA_HOME` - `C:\<home>`


# Git Custom Aliases
* `git config --global status.showUntrackedFiles all`
* `git config --global alias.graph "log --graph --pretty=oneline"`
* `git config --global alias.l "log --graph --pretty=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset) %C(auto)%d%C(reset)' --abbrev-commit --date=relative"`
* `git config --global alias.ll "log --graph --pretty=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset) %C(auto)%d%C(reset)' --abbrev-commit --date=relative --all"`
* `git config --global alias.review '!f() { git checkout --detach "origin/$1"; git l main..HEAD; }; f'`

## Because one cannot always remember convenient things...
* `git update-index --assume-unchanged <path/to/file>` - Make Git ignore files (different from `.gitignore`)
* `git ls-files -v | grep -e "^[hsmrck]"` - Show files ignored using the command above

