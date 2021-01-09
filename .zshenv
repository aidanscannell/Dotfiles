export PATH="/usr/local/sbin:$PATH"

##################################
# GUI emacs
##################################
alias gemacs="/usr/local/opt/emacs-mac/Emacs.app/Contents/MacOS/Emacs"
GUI_EMACS_SERVER_FILE="$HOME/.emacs.d/server/gui"
# Open GUI Emacs
function ge {
  # check if emacs server exists and open new client frame if so
  if test -e "$GUI_EMACS_SERVER_FILE"; then
    echo "opening emacsclient"  
    emacsclient -s $GUI_EMACS_SERVER_FILE -c
  else
    echo "opening gemacs"  
    gemacs
  fi
}
# function gestart {
#   echo "starting emacs deamon=gui"
#   emacs --daemon=$GUI_EMACS_SERVER_FILE
# }
function gestop {
  emacsclient -s $GUI_EMACS_SERVER_FILE -e "(kill-emacs)"
}
# function gerestart {
#   echo "restarting emacs deamon=gui"
#   gestop
#   gestart
# }
# function ger {
#   # restart gui emacs server and open gui emacsclient
#   gerestart
#   ge
# }

##################################
# Terminal Emacs
##################################
TERM_EMACS_SERVER_FILE="$HOME/.emacs.d/server/term"

function testart {
  echo "starting emacs deamon=term"
  emacs --daemon=$TERM_EMACS_SERVER_FILE
}
function testop {
  echo "stopping emacs deamon=term"
  emacsclient -s $TERM_EMACS_SERVER_FILE -e "(save-buffers-kill-emacs)"
}
function terestart {
  echo "restarting emacs deamon=term"
  testop
  testart
}
function ter() {
  # restart emacs term server and open emacsclient in terminal
  terestart
  te ${1}
}
function te () {
  # open emacsclient in terminal
  emacsclient -s $TERM_EMACS_SERVER_FILE -nw ${1}
}
