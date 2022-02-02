# Set variables

# Change zsh options

# Aliases

#alias ll='ls -lAFh'
alias ll='exa --long -all'
alias ic='ibmcloud'
alias secrets='cd /Users/jsanabri/Documents/work-repos/.secrets'
alias work='cd /Users/jsanabri/Documents/work-repos/'
alias repos='cd /Users/jsanabri/Documents/repos/'
alias vim='nvim'
alias ctx='kubectx'

# APIS
alias cat-mes-api='cat /Users/jsanabri/Documents/work-repos/.secrets/keys/mes-api-key'
alias cat-cross-api='cat /Users/jsanabri/Documents/work-repos/.secrets/keys/cross-tower-login-api-key'
alias cat-talent-api='cat /Users/jsanabri/Documents/work-repos/.secrets/keys/talent-login-api-key'

# Add Locations to $PATH Variable

# Functions

funtion mkcd(){
  mkdir -p "$@" && cd "$_";
}

# IC Login Functions

funtion login-prod(){
	loginKey=$(cat /Users/jsanabri/Documents/work-repos/.secrets/keys/cross-tower-login-api-key)
	ic login -u apikey -p $loginKey
}

funtion login-talent(){
	loginKey=$(cat /Users/jsanabri/Documents/work-repos/.secrets/keys/talent-login-api-key)
	ic login -u apikey -p $loginKey
}

funtion login-mes(){
	loginKey=$(cat /Users/jsanabri/Documents/work-repos/.secrets/keys/mes-api-key)
	ic login -u apikey -p $loginKey
}

funtion login-prod(){
	loginKey=$(cat /Users/jsanabri/Documents/work-repos/.secrets/keys/cross-tower-login-api-key)
	ic login -u apikey -p $loginKey
}

funtion login-talent(){
	loginKey=$(cat /Users/jsanabri/Documents/work-repos/.secrets/keys/talent-login-api-key)
	ic login -u apikey -p $loginKey
}

funtion login-mes(){
	loginKey=$(cat /Users/jsanabri/Documents/work-repos/.secrets/keys/mes-api-key)
	ic login -u apikey -p $loginKey
}

# OC Login Functions

funtion oc-login-prod(){
	loginKey=$(cat /Users/jsanabri/Documents/work-repos/.secrets/keys/cross-tower-login-api-key)
	oc login -u apikey -p $loginKey
}

funtion oc-login-talent(){
	loginKey=$(cat /Users/jsanabri/Documents/work-repos/.secrets/keys/talent-login-api-key)
	oc login -u apikey -p $loginKey
}

funtion oc-login-mes(){
	loginKey=$(cat /Users/jsanabri/Documents/work-repos/.secrets/keys/mes-api-key)
	oc login -u apikey -p $loginKey
}

# zsh plugins

# Other Stuff

#This activate IBM Cloud Autocompletion after installation. 
source /usr/local/ibmcloud/autocomplete/zsh_autocomplete
export PATH="/usr/local/opt/kubernetes-cli@1.22/bin:$PATH"

#asdf configuration - please refer to my dotfile README.md file. 
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh
