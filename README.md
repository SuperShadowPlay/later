# later | A procrastinating commandline tool.

`later v2019.6.23` is a short-but-sweet commandline tool to
send your bash shell commands at a later date.

If you want to belittle it, it's a glorified way to
use the `sleep` command. As such, when you input time,
format it the same way (3s, 24m, 1d, etc.).

## Install
Clone this repository, and run `bash install.sh` as root.
It copies the included `later.sh` into /usr/local/bin/
and makes it executable.

## Usage

`later [-bqhv] <time> <commands>`
Examples:
`later 5s echo "Hello world!"` (Waits 5 seconds and prints "Hello world!")
`later 30m python3 ~/printTime.py` (Waits 30 minutes and runs `python3 ~/printTime.py`)
`later -b 7h python3 ~/systemHealth/checkTemp.sh` (Waits in the background for 7 hours and runs `python3 ~/systemHealth/checkTemp.py`)

## Options

-h (or --help): The help page
-v (or --version): Displays the version
-b (or --background): Sends the the process to the background (The same as using Ctrl-Z but smoother)
-q (or --nohangup): Sends the *command* (not the sleep itself) into a nohup command.
