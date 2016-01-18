export SSH_ASKPASS=ksshaskpass

{
  if ! pgrep -u $USER ssh-agent > /dev/null; then
      ssh-agent > ~/.ssh-agent-thing
  fi
  if [[ "$SSH_AGENT_PID" == "" ]]; then
      eval $(<~/.ssh-agent-thing) > /dev/null
  fi
  ssh-add </dev/null
} &> /dev/null
