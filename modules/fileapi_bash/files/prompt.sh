# Change the bash prompt to be:
# "[username] @ [environment] $"
# The prompt is colour-coded based on the environment: red for prod, green for staging, blue for dev.

COLOUR_RESET=$(tput sgr0)
COLOUR_GREEN=$(tput setaf 2)
COLOUR_BLUE=$(tput setaf 6)
COLOUR_RED=$(tput setaf 1)

CP_PROMPT_COLOUR=$COLOUR_RESET
CP_PROMPT_TEXT="UNKNOWN"

if [[ `hostname -f` =~ \.prod$ ]]; then CP_PROMPT_COLOUR=$COLOUR_RED; CP_PROMPT_TEXT="PROD"; fi
if [[ `hostname -f` =~ \.staging$ ]]; then CP_PROMPT_COLOUR=$COLOUR_GREEN; CP_PROMPT_TEXT="STAGE"; fi
if [[ `hostname -f` =~ \.dev$ ]]; then CP_PROMPT_COLOUR=$COLOUR_BLUE; CP_PROMPT_TEXT="DEV"; fi

PS1="\[$CP_PROMPT_COLOUR\]\u @ $CP_PROMPT_TEXT \$ \[$COLOUR_RESET\]"
