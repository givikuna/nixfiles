$env.config.show_banner = false

#sys
alias ldevs = bat /proc/bus/input/devices

# nix shorthands
alias r = rebuild-system
alias syu = u
alias edits = edit-system
alias pushs = push-system
alias rtest = nix run .#tests

# hyprland
alias mvpls = move-please

# eza shorthands
alias e = eza --hyperlink --icons
alias e1 = eza --hyperlink --icons -1
alias etree = eza --tree --icons
alias ebs = eza --icons --absolute --hyperlink
alias ebs1 = eza --icons --absolute --hyperlink -1
alias ezasnew = eza -snew
alias ezasnew1 = eza -snew -1

# fd shorthands
alias fd1 = fd -d 1
alias fd2 = fd -d 2
alias fd3 = fd -d 3
alias fd4 = fd -d 4
alias fd5 = fd -d 5

# l
alias l = e

# other aliases
alias gitingest = repomix
alias speedtest = speedtest-cli
alias ssll = switch-shell

# fuck larry
alias mulgs = most-used-langs -u givikuna -R al-go-rithms
alias mulgs-larry = most-used-langs -u dagworth -R Chronica-Phantastikos

# power profiles
alias set-balanced = powerprofilesctl set balanced
alias set-performance = powerprofilesctl set performance
alias set-power-saver = powerprofilesctl set power-saver
alias get-power-profile = powerprofilesctl get

# git
alias ggraph = git-graph -d -S -s d -f "%h %an %ae %s %n" -w -m simple
alias ggraphh = git-graph -d -S -s d -f "%H %an %ae %s %n" -w -m simple

# compounds

def rnnr [] { rebuild-system; if $env.LAST_EXIT_CODE == 0 { reboot } }
def rnnp [] { rebuild-system; if $env.LAST_EXIT_CODE == 0 { poweroff } }

def u [] {
    rebuild-system; if $env.LAST_EXIT_CODE != 0 {
        return
    }
    update-system; if $env.LAST_EXIT_CODE != 0 {
        return
    }
    rebuild-system
}

def rur [] {
    rebuild-system; if $env.LAST_EXIT_CODE != 0 {
        return
    }
    u; if $env.LAST_EXIT_CODE != 0 {
        return
    }
    rebuild-system
}

def unnr [] {
    u; if $env.LAST_EXIT_CODE == 0 {
        reboot
    }
}
def rebp [] {
    rebuild-system; if $env.LAST_EXIT_CODE == 0 {
        push-system
    }
}
def updp [] {
    u; if $env.LAST_EXIT_CODE == 0 {
        push-system
    }
}

def rtest [] {
    rebuild-system; if $env.LAST_EXIT_CODE == 0 {
        nix run .#tests
    }
}

def rtutrt [] {
    rebuild-system; if $env.LAST_EXIT_CODE != 0 {
        return
    }
    rtest; if $env.LAST_EXIT_CODE != 0 {
        return
    }
    u; if $env.LAST_EXIT_CODE != 0 {
        return
    }
    rtest; if $env.LAST_EXIT_CODE != 0 {
        return
    }
    rebuild-system; if $env.LAST_EXIT_CODE != 0 {
        return
    }
    rtest
}

def mvplse [] { move-please; if $env.LAST_EXIT_CODE == 0 {
        exit
    }
}

def mvplsee [] {
    move-please; if $env.LAST_EXIT_CODE != 0 {
        return
    }
    edit-system; if $env.LAST_EXIT_CODE == 0 {
        exit
    }
}

def switch-shell [] {
    let chosen: list<string> = (["nushell", "zsh", "bash", "elvish", "fish"]
        | str join "\n"
        | fzf --height=10 --border --prompt="Switch environment to: ")

    match ($chosen | str trim) {
        "nushell" => { nu }
        "zsh" => { zsh }
        "bash" => { bash }
        "elvish" => { elvish }
        "fish" => { fish }
        _ => { print "No shell selected or invalid selection." }
    }
}

def proj [...args: string] {
    ^proj ...$args

    if $env.LAST_EXIT_CODE == 0 {
        exit
    }
}
