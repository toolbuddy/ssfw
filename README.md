# ssfw
SSFW - Setup scripts For your Workspace. Using curl/wgets to install and use!

- [ssfw](#ssfw)
    - [Description](#description)
    - [Usage](#usage)
        - [Node.js installation](#nodejs-installation)
        - [Docker installation](#docker-installation)
        - [Environment](#environment)
            - [Vim](#vim)
            - [Oh-my-zsh](#oh-my-zsh)
        - [P4 Environment Setup](#p4-environment-setup)
    - [Author](#author)

## Description

Sometime we need to reset a clean workspace (like setup up your new computer workspace, or your workstation in your office or lab), and here provide some useful tools and library installation scripts, pick up the library you want, and use it directly!

All you need is a clean environment, which have `git`, `curl`, `wget`, and then just use the command provided by the **target** under *Usage*!

## Usage 

### Node.js installation

* use command:
```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/install_nodejs.sh)
```

### Docker installation

* use command:
```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/install_docker.sh)
```

### Environment

#### Vim

* spf13-vim
```bash
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
```

#### Oh-my-zsh 

* use command:
```sh
# via curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# via wget
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

### P4 Environment Setup

* use command:
```bash
# first install the dependencies
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/root_bootstrap.sh)

# second install the library and usage
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/user_bootstrap.sh)

```

## Author

* [Kevin Cyu](), kevinbird61@gmail.com