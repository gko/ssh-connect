# ssh-connect
🐙 simple ssh manager. It looks for your previous ssh sessions in `$HISTFILE` and keeps relevant the ones that you reconnect to. Supports bash and zsh.

![demo](https://raw.githubusercontent.com/gko/ssh-connect/master/demo.gif)

## Installation

### Manually
```bash
git clone --recursive https://github.com/gko/ssh-connect
```
then in .bashrc or .zshrc:
```bash
source ./ssh-connect/ssh-connect.sh
```

### With [antigen](https://github.com/zsh-users/antigen)

In your .zshrc
```sh
antigen bundle gko/ssh-connect
```

### With [Fig](https://fig.io)

Fig adds apps, shortcuts, and autocomplete to your existing terminal.

Install `ssh-connect` in just one click.

<a href="https://fig.io/plugins/other/ssh-connect_gko" target="_blank"><img src="https://fig.io/badges/install-with-fig.svg" /></a>

## Like it?

:star: this repo

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (c) 2012-2016 Konstantin Gorodinskiy
