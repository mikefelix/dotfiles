#!/usr/bin/env fish

. ~/Git/hook/hook.fish               # Hook fish completions
. ~/.config/fish/lib/prompt.fish     # Git prompt
. ~/.config/fish/lib/utility.fish    # Aliases and functions
. ~/.config/fish/lib/boxen.fish      # Generated Boxen config

fish_hook_enable rake rbenv git rails brew
set -x ARCHFLAGS "-arch x86_64"
set -x EDITOR "subl"