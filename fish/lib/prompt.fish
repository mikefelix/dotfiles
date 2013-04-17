#!/usr/bin/env fish

set fish_git_dirty_color red
set fish_git_not_dirty_color green

function fish_git_parse_branch
  set -l git_branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$git_branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$git_branch(set_color normal)
  end
end

function fish_prompt
  if test -d .git
    printf '%s%s %s%s ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (fish_git_parse_branch)
  else
    printf '%s%s%s ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
  end
end