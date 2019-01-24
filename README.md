# battery-notifier
battery-notifier is a MacOS daemon that keeps track of the battery charging status and notifies the user when the battery is sufficiently charged (80%-90%).

## Installation

This software is intalled for your user only.

### Homebrew

#### Install

Install through homebrew:

```
$ brew install LucaAngioloni/tap/battery-notifier
```

And start the daemon with (only the first time at installation):

```
$ brew services start battery-notifier
```

#### Uninstall

Deactivate the daemon:

```
$ brew services start battery-notifier
```

Uninstall homebrew package:

```
$ brew uninstall battery-notifier
```

##### Additional steps
These steps are only to make sure that everything was removed from your system.

- If you also want to remove terminal-notifier (and this is not done automatically)

```
$ brew uninstall terminal-notifier
```

- Check if the plist file was removed:
```
rm ~/Library/LaunchAgents/homebrew.mxcl.battery-notifier.plist
```

### Manual

#### Requirements

This bash script need [terminal-notifier](https://github.com/julienXX/terminal-notifier) in order to send notifications to the user. Install this through Homebrew with:
```
$ brew install terminal-notifier
```
or read manual instructions in the repo linked above.

#### Install

1. Download the code in a folder and store it wherever you want.
2. Create a symbolic link to `/usr/local/bin/`
```
$ ln /path/to/battery-notifier/battery-notifier.sh /usr/local/bin/battery-notifier
$ ln /path/to/battery-notifier/battery.png /usr/local/bin/battery.png
```
3. Install the daemon:
```
$ ln /path/to/battery-notifier/battery-notifier.plist ~/Library/LaunchAgents/battery-notifier.plist
```
and run it:
```
$ launchctl load ~/Library/LaunchAgents/battery-notifier.plist
```

#### Uninstall
Run these commands to remove the files generated:
```
$ launchctl unload ~/Library/LaunchAgents/battery-notifier.plist
$ rm /usr/local/bin/battery-notifier
$ rm /usr/local/bin/battery.png
$ rm ~/Library/LaunchAgents/battery-notifier.plist
$ rm -R /path/to/battery-notifier/
```

## License

MIT License

Copyright (c) 2019 Luca Angioloni

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
