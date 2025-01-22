# cli date

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
```

## pdd

Tiny date, time diff calculator.
[github](https://github.com/jarun/pdd)
`$ pdd --help`

```
usage: pdd [-h] [-d yyyy mmm dd [yyyy mmm dd | y m d]]
           [-t hh:mm:ss [hh:mm:ss | h:m:s]] [--add] [--sub]
           [--day yyyy mmm dd] [-c hh:mm:ss] [-r command] [-s [resolution]]
           [-q]
           [keywords ...]

Tiny date, time difference calculator with timers.

positional arguments:
  keywords              diff/add/subtract from today or now

options:
  -h, --help            show this help message and exit
  -d yyyy mmm dd [yyyy mmm dd | y m d], --date yyyy mmm dd [yyyy mmm dd | y m d]
                        calculate date difference
  -t hh:mm:ss [hh:mm:ss | h:m:s], --time hh:mm:ss [hh:mm:ss | h:m:s]
                        calculate time difference
  --add                 add to date (/today) or time (/now)
  --sub                 subtract from date (/today) or time (/now)
  --day yyyy mmm dd     show day of the week on a date
  -c hh:mm:ss, --timer hh:mm:ss
                        start a countdown timer
  -r command, --run command
                        run command when countdown timer reaches 0
  -s [resolution], --stopwatch [resolution]
                        start a stopwatch [default resolution: 3 (ms)]
  -q, --quiet           quiet mode for background timer/stopwatch
```

```nix tangle:default.nix
    nixPkgs = "pdd";
  }
)
```
