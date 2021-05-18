#compdef demo1
#autoload

# Brew ZSH completion function

_demo1() {
  _arguments -C '1:dem1:->dem1'
  case "$state" in
    (dem1)
      local commands=();
      commands+=("cmd1:this is a command 1")
      commands+=("cmd2:this is a command 2")
      commands+=("cmd3:this is a command 3")
      _describe -t commands 'command' commands && ret=0
    ;;
  esac
  return 0
}

_demo1 "$@"