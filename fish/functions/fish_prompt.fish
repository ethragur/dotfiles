function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
	set -g __fish_prompt_char '#'
      case '*'
	set -g __fish_prompt_char 'λ'
    end
  end

  set -l normal (set_color normal)
  set -l white (set_color white)
  set -l turquoise (set_color magenta)
  set -l orange (set_color yellow)
  set -l hotpink (set_color cyan)
  set -l blue (set_color blue)
  set -l limegreen (set_color green)
  set -l purple (set_color black)
 
  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color 689d6a
  set -g __fish_git_prompt_color_flags cc241d
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true 
 
  # Line 1
  set realhome ~
  
  source /usr/share/fish/functions/prompt_pwd.fish
  echo -n $white'╭─'$hotpink$USER$white'@'$orange$__fish_prompt_hostname$white': '$limegreen(prompt_pwd) $turquoise
  __fish_git_prompt " (%s)"
  echo

  # Line 2
  echo -n $white'╰─'$__fish_prompt_char $normal
end


