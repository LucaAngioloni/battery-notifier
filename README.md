# battery-notifier
battery-notifier is a MacOS daemon that keeps track of the battery charging status and notifies the user when the battery is sufficiently charged (80%-90%).

## Installation

### Homebrew

Coming soon...

### Manual

#### Requirements

This bash script need [terminal-notifier](https://github.com/julienXX/terminal-notifier) in order to send notifications to the user. Install this through Homebrew with:
```
$ brew install terminal-notifier
```
or read manual instructions in the repo linked above.

#### Installation

1. Download the code in a folder and store it wherever you want.
2. Create a symbolic link to `/usr/local/bin/`
```
$ ln /path/to/battery-notifier/battery-notifier.sh /usr/local/bin/battery-notifier
```
3. Install the daemon:
```
$ cp /path/to/battery-notifier/battery-notifier.plist ~/Library/LaunchAgents/battery-notifier.plist
```
and run it:
```
$ launchctl load ~/Library/LaunchAgents/battery-notifier.plist
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
