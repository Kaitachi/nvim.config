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

# Using macOS Terminal
For some reason, some keystrokes related to arrow keys are not properly sent by the terminal (i.e. <S-up>...). To properly set these, go to Preferences -> Profiles -> Keyboard and add the following actions:

| Key        | Action     |
|------------|------------|
| Shift-F9   | <C-[>[1;23 |
| Shift-F10  | <C-[>[1;24 |
| Shift-Up   | <C-[>[1;2A |
| Shift-Down | <C-[>[1;2B |
| Ctrl-Up    | <C-[>[1;5A |
| Ctrl-Down  | <C-[>[1;5B |

## Custom macOS Keyboard Shortcuts

* ⌥1 - Switch to Desktop 1
* ⌥2 - Switch to Desktop 2
* ⌥3 - Switch to Desktop 3
* ⌥4 - Switch to Desktop 4
* ⌥5 - Switch to Desktop 5
