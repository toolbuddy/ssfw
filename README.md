# ssfw
SSFW - Setup scripts For your Workspace. Using curl/wgets to install and use!
<!-- TOC -->

- [ssfw](#ssfw)
    - [Description](#description)
    - [Usage](#usage)
        - [Qt Installation](#qt-installation)
        - [Node.js installation](#nodejs-installation)
        - [Go installation](#go-installation)
        - [Docker installation](#docker-installation)
        - [P4 Environment Setup](#p4-environment-setup)
        - [ONOS Installation](#onos-installation)
        - [Environment](#environment)
            - [Powerline](#powerline)
            - [TMUX](#tmux)
            - [Vim](#vim)
            - [Oh-my-zsh](#oh-my-zsh)
            - [Basic develop environment](#basic-develop-environment)
            - [UNetbootin](#unetbootin)
        - [Freebsd](#freebsd)
        - [Database](#database)
            - [MongoDB installation](#mongodb-installation)
        - [Git-related](#git-related)
            - [Update all repo (under current folder/workspace)](#update-all-repo-under-current-folderworkspace)
    - [Author](#author)

<!-- /TOC -->

## Description

Sometime we need to reset a clean workspace (like setup up your new computer workspace, or your workstation in your office or lab), and here provide some useful tools and library installation scripts, pick up the library you want, and use it directly!

All you need is a clean environment, which have `git`, `curl`, `wget`, and then just use the command provided by the **target** under *Usage*!

## Usage 

### Qt Installation

* currently use `v5.11.0` to build
* use command 

```bash
# dependencies
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/qt/deps.sh)

# build from source
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/qt/build.sh)
```

### Node.js installation

* (**Build from source**)use command:
```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/nodejs/build_nodejs.sh)
```

* (**Install by package manager, Debian/Ubuntu**) use command:
```bash
# v10.x
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/nodejs/install_nodejs_10.sh)

# v8.x
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/nodejs/install_nodejs_8.sh)
```

### Go installation

* use command:
```sh
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/go/install.sh)
```

### Docker installation

* use command:
```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/system/install_docker.sh)
```

### P4 Environment Setup

> Currently version can run on `ubuntu 16.04`.
> Updated at 2018/6/6.

* use command:
```bash
# first install the dependencies
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/netdev/root_bootstrap.sh)

# second install the library and usage
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/netdev/user_bootstrap.sh)
```


### ONOS Installation

* use command:

```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/netdev/install_onos.sh)

```

* run the onos server (if you have onos already)
```bash
cd $ONOS_ROOT
$ONOS_ROOT/tools/build/onos-buck run onos-local -- clean debug
```

### Environment

#### Powerline 

* install 
```bash
sudo apt install powerline
```

* Insert the script into `~/.bashrc`:
```bash
POWERLINE_SCRIPT=/usr/share/powerline/bindings/bash/powerline.sh
if [ -f $POWERLINE_SCRIPT ]; then
  source $POWERLINE_SCRIPT
fi
```

or run 

```bash
curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/config/powerline.conf > ~/.bashrc
```

* install fonts for powerline
```
sudo apt-get install fonts-powerline
```

or use the building command directly:

```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/config/powerline-fonts.sh)
```

#### TMUX

* Installing my tmux configuration via `curl`: 
    * You can check out more detail in [*tmux_setting.conf*](config/tmux_setting.conf)
    ```bash
    curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/config/tmux_setting.conf > ~/.tmux.conf
    ```

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

#### Basic develop environment

* use command: 
```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/system/basic_env.sh)
```

#### UNetbootin

* use command:
```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/system/install_unetbootin.sh)
```

### Freebsd

* setup:
```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/freebsd/setup.sh)
```

* software update:
```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/freebsd/software_update.sh)
```

### Database 

#### MongoDB installation

* use command 
```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/system/install_mongo.sh)
```

### Git-related

#### Update all repo (under current folder/workspace)

```bash
source <(curl -s https://raw.githubusercontent.com/toolbuddy/ssfw/master/git/update_all_repo.sh)
```

## Author

* [Kevin Cyu](), kevinbird61@gmail.com
