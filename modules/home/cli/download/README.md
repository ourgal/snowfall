# cli download

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
```

## dirdl

Download files in each dir.
`$ dirdl --help`

```
  Usage: dirdl [-c|--clip] [--dir dir]

  download in sub dir

  Flags:
  -c, --clip          	generate urls.txt from clipboard [bool]
  --dir               	download dir [default: '.']
  -h, --help          	print this help and exit
  -v, --verbose       	enable verbose logging and info
  --no-color          	disable color and other formatting
```

```nix tangle:default.nix
      "dirdl"
```

## dra

A command line tool to download release assets from GitHub.
[github](https://github.com/devmatteini/dra)
`$ dra --help`

```
A command line tool to download release assets from GitHub

EXAMPLES:
Select and download an asset (interactive mode):
$ dra download devmatteini/dra-tests

Download a selected asset (non-interactive mode):
$ dra untag devmatteini/dra-tests
helloworld_{tag}.tar.gz
$ dra download -s "helloworld_{tag}.tar.gz" devmatteini/dra-tests

Automatically select and download an asset based on your operating system
and architecture (non-interactive mode):
$ dra download -a devmatteini/dra-tests

Download and install an asset:
$ dra download --install devmatteini/dra-tests

Download and install multiple executables from tar/zip archive asset:
$ dra download -s helloworld-many-executables-unix.tar.gz -I helloworld-v2 -I random-script devmatteini/dra-tests

More examples can be found at:
- https://github.com/devmatteini/dra#usage
- https://github.com/devmatteini/dra#examples

Usage: dra <COMMAND>

Commands:
  download    Select and download an asset
  untag       Select an asset and generate an untagged version of it
  completion  Generate shell completion
  help        Print this message or the help of the given subcommand(s)

Options:
  -h, --help
          Print help (see a summary with '-h')

  -V, --version
          Print version
```

```nix tangle:default.nix
      "dra"
```

## goodls

This is a CLI tool to download shared files and folders from Google Drive.
[github](https://github.com/tanaikech/goodls)
`$ goodls --help`

```
NAME:
   goodls - A new cli application

USAGE:
   Download shared files on Google Drive.

VERSION:
   2.0.5

AUTHOR:
   tanaike [ https://github.com/tanaikech/goodls ]  <tanaike@hotmail.com>

COMMANDS:
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --url value, -u value                URL of shared file on Google Drive. This is a required parameter.
   --extension value, -e value          Extension of output file. This is for only Google Docs (Spreadsheet, Document, Presentation). (default: "pdf")
   --filename value, -f value           Filename of file which is output. When this was not used, the original filename on Google Drive is used.
   --mimetype value, -m value           mimeType (You can retrieve only files with the specific mimeType, when files are downloaded from a folder.) ex. '-m "mimeType1,mimeType2"'
   --resumabledownload value, -r value  File is downloaded as the resumable download. For example, when '-r 1m' is used, the size of 1 MB is downloaded and create new file or append the existing file. API key is required.
   --NoProgress, --np                   When this option is used, the progression is not shown.
   --overwrite, -o                      When filename of downloading file is existing in directory at local PC, overwrite it. At default, it is not overwritten.
   --skip, -s                           When filename of downloading file is existing in directory at local PC, skip it. At default, it is not overwritten.
   --fileinf, -i                        Retrieve file information. API key is required.
   --apikey value, --key value          API key is used to retrieve file list from shared folder and file information.
   --directory value, -d value          Directory for saving downloaded files. When this is not used, the files are saved to the current working directory.
   --notcreatetopdirectory, --ntd       When this option is NOT used (default situation), when a folder including subfolders is downloaded, the top folder which is downloaded is created as the top directory under the working directory. When this option is used, the top directory is not created and all files and subfolders under the top folder are downloaded under the working directory.
   --skiperror, --se                    When the files are downloaded from the folder, if an error occurs, the error is skipped by this option.
   --help, -h                           show help
   --version, -v                        print the version
```

```nix tangle:default.nix
      "goodls"
```

## imgboxdwl

Easily download all images from an imgbox gallery.

```nix tangle:default.nix
      "imgboxdwl"
```

## tstickers

Download sticker packs from Telegram.
[github](https://github.com/FHPythonUtils/TStickers)

```nix tangle:default.nix
      "tstickers"
      # keep-sorted end
    ];
```

## downloader-cli

Downloader with an awesome customizable progressbar.
[github](https://github.com/deepjyoti30/downloader-cli)
`$ dw --help`

```
usage: dw [-h] [-f | -c] [-e] [-q] [-b] [-v] [--done DONE] [--left LEFT]
          [--current CURRENT] [--color-done COLOR_DONE]
          [--color-left COLOR_LEFT] [--color-current COLOR_CURRENT]
          [--icon-border ICON_BORDER]
          SOURCE [TARGET]

positional arguments:
  SOURCE                URL of the file
  TARGET                target filepath (existing directories will be treated
                        as the target location)

options:
  -h, --help            show this help message and exit
  -f, -o, --force       overwrite if the file already exists
  -c, --resume          resume failed or cancelled download (partial sanity
                        check)
  -e, --echo            print the filepath to stdout after downloading (other
                        output will be redirected to stderr)
  -q, --quiet           suppress filesize and progress info
  -b, --batch           Download files in batch. If this flag is passed the
                        passed source will be considered as a file with
                        download links seperated by a newline. This flag will
                        be ignored if source is a valid URL.
  -v, --version         show the program version number and exit

UI Group:
  --done DONE           Icon indicating the percentage done of the downloader
  --left LEFT           Icon indicating the percentage remaining to download
  --current CURRENT     Icon indicating the current percentage in the progress
                        bar
  --color-done COLOR_DONE
                        Color for the done percentage icon
  --color-left COLOR_LEFT
                        Color for the remaining percentage icon
  --color-current COLOR_CURRENT
                        Color for the current indicator icon in the progress
                        bar
  --icon-border ICON_BORDER
                        Icon for the border of the progress bar
```

```nix tangle:default.nix
    pyPkgs = "downloader-cli";
    nixPkgs = [
      # keep-sorted start
```

## baidupcs-go

Baidu Netdisk commandline client, mimicking Linux shell file handling commands.
[github](https://github.com/qjfoidnh/BaiduPCS-Go)
`$ BaiduPCS-Go --help`

```
----
  BaiduPCS-Go - 百度网盘客户端 for linux/amd64

USAGE:
  BaiduPCS-Go [global options] command [command options] [arguments...]

VERSION:
  3.9.5-unstable-2024-06-23

DESCRIPTION:
  BaiduPCS-Go 使用 Go 语言编写的百度网盘命令行客户端，为操作百度网盘，提供实用功能。
  具体功能，参见 COMMANDS 列表

  特色：
    网盘内列出文件和目录，支持通配符匹配路径；
    下载网盘内文件，支持网盘内目录 （文件夹） 下载，支持多个文件或目录下载，支持断点续传和高并发高速下载。

  ---------------------------------------------------
  前往 https://github.com/qjfoidnh/BaiduPCS-Go 以获取更多帮助信息！
  前往 https://github.com/qjfoidnh/BaiduPCS-Go/releases 以获取程序更新信息！
  ---------------------------------------------------

  交流反馈：
    提交 Issue: https://github.com/qjfoidnh/BaiduPCS-Go/issues
    邮箱：qjfoidnh@126.com

AUTHOR:
  qjfoidnh/BaiduPCS-Go: https://github.com/qjfoidnh/BaiduPCS-Go

COMMANDS:
    tool        工具箱
    help, ?, ？  Shows a list of commands or help for one command
  其他：
    clear, cls   清空控制台
    env          显示程序环境变量
    run          执行系统命令
    sumfile, sf  获取本地文件的秒传信息（目前秒传功能已失效）
    update       检测程序更新
  百度帐号：
    login       登录百度账号
    loglist     列出帐号列表
    logout      退出百度帐号
    setastoken  设定当前账号的 accessToken
    su          切换百度帐号
    who         获取当前帐号
  百度网盘：
    cd                      切换工作目录
    cp                      拷贝文件/目录
    createsuperfile, csf    手动分片上传—合并分片文件
    download, d             下载文件/目录
    export, ep              导出文件/目录
    fixmd5                  修复文件 MD5
    locate, lt              获取下载直链
    ls, l, ll               列出目录
    match                   测试通配符
    meta                    获取文件/目录的元信息
    mkdir                   创建目录
    mv                      移动/重命名文件/目录
    offlinedl, clouddl, od  离线下载
    pwd                     输出工作目录
    quota                   获取网盘配额
    rapidupload, ru         手动秒传文件
    recycle                 回收站
    rm                      删除文件/目录
    search, s               搜索文件
    share                   分享文件/目录
    transfer                转存文件/目录
    tree, t                 列出目录的树形图
    upload, u               上传文件/目录
  配置：
    config  显示和修改程序配置项

GLOBAL OPTIONS:
  --verbose      启用调试 [$BAIDUPCS_GO_VERBOSE]
  --help, -h     show help
  --version, -v  print the version

COPYRIGHT:
  (c) 2016-2020 iikira.
```

```nix tangle:default.nix
      "baidupcs-go"
```

## btfs

Bittorrent filesystem based on FUSE.
[github](https://github.com/johang/btfs)
`$ btfs --help`

```
usage: btfs [options] metadata mountpoint

btfs options:
    --version -v           show version information
    --help -h              show this message
    --help-fuse            print all fuse options
    --browse-only -b       download metadata only
    --keep -k              keep files after unmount
    --utp-only             do not use TCP
    --data-directory=dir   directory in which to put btfs data
    --min-port=N           start of listen port range
    --max-port=N           end of listen port range
    --max-download-rate=N  max download rate (in kB/s)
    --max-upload-rate=N    max upload rate (in kB/s)
```

```nix tangle:default.nix
      "btfs"
```

## libgen-cli

A CLI tool used to access the Library Genesis dataset; written in Go
[github](https://github.com/ciehanski/libgen-cli)
`$ libgen-cli --help`

```
libgen-cli queries Library Genesis, lists all results of a specific query,
	and makes them available for download. Simple and easy.

Usage:
  libgen [command]

Available Commands:
  completion   Generate bash completion script for bash or zsh
  dbdumps      Allows users to download any selection of Library Genesis' database dumps.
  download     Download a specific resource by hash.
  download-all Downloads all found resources for a specified query.
  help         Help about any command
  link         Retrieves and displays the direct download link for a specific resource.
  search       Query all content hosted by Library Genesis.
  status       Checks the status of Library Genesis' mirrors.

Flags:
  -h, --help   help for libgen

Use "libgen [command] --help" for more information about a command.
```

```nix tangle:default.nix
      "libgen-cli"
```

## lux

Fast and simple video download library and CLI tool written in Go
[github](https://github.com/iawia002/lux)
`$ lux --help`

```
NAME:
   lux - A fast and simple video downloader.

USAGE:
   lux [global options] command [command options] [arguments...]

VERSION:
   v0.24.1

COMMANDS:
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --aria2                                   Use Aria2 RPC to download (default: false)
   --aria2-addr value                        Aria2 Address (default: "localhost:6800")
   --aria2-method value                      Aria2 Method (default: "http")
   --aria2-token value                       Aria2 RPC Token
   --audio-only, --ao                        Download audio only at best quality (default: false)
   --caption, -C                             Download captions (default: false)
   --chunk-size value, --cs value            HTTP chunk size for downloading (in MB) (default: 1)
   --cookie value, -c value                  Cookie
   --debug, -d                               Debug mode (default: false)
   --end value                               Define the ending item of a playlist or a file input (default: 0)
   --episode-title-only, --eto               File name of each bilibili episode doesn't include the playlist title (default: false)
   --file value, -F value                    URLs file path
   --file-name-length value                  The maximum length of a file name, 0 means unlimited (default: 255)
   --info, -i                                Information only (default: false)
   --items value                             Define wanted items from a file or playlist. Separated by commas like: 1,5,6,8-10
   --json, -j                                Print extracted JSON data (default: false)
   --multi-thread, -m                        Multiple threads to download single video (default: false)
   --output-name value, -O value             Specify the output file name
   --output-path value, -o value             Specify the output path
   --playlist, -p                            Download playlist (default: false)
   --refer value, -r value                   Use specified Referrer
   --retry value                             How many times to retry when the download failed (default: 10)
   --silent, -s                              Minimum outputs (default: false)
   --start value                             Define the starting item of a playlist or a file input (default: 1)
   --stream-format value, -f value           Select specific stream to download
   --thread value, -n value                  The number of download thread (only works for multiple-parts video) (default: 10)
   --user-agent value, -u value              Use specified User-Agent
   --youku-ccode value, --ccode value        Youku ccode (default: "0502")
   --youku-ckey value, --ckey value          Youku ckey (default: "7B19C0AB12633B22E7FE81271162026020570708D6CC189E4924503C49D243A0DE6CD84A766832C2C99898FC5ED31F3709BB3CDD82C96492E721BDD381735026")
   --youku-password value, --password value  Youku password
   --help, -h                                show help (default: false)
   --version, -v                             print the version (default: false)
```

```nix tangle:default.nix
      "lux"
```

## tdl

Telegram downloader/tools written in Golang
[github](https://github.com/iyear/tdl)
`$ tdl --help`

```
Telegram Downloader, but more than a downloader

Usage:
  tdl [command]

Account related
  backup                  Backup your data
  login                   Login to Telegram
  migrate                 Migrate your current data to another storage
  recover                 Recover your data

Tools
  chat                    A set of chat tools
  download                Download anything from Telegram (protected) chat
  forward                 Forward messages with automatic fallback and message routing
  upload                  Upload anything to Telegram

Additional Commands:
  completion              Generate the autocompletion script for the specified shell
  help                    Help about any command
  version                 Check the version info

Flags:
      --debug                        enable debug mode
      --delay duration               delay between each task, zero means no delay
  -h, --help                         help for tdl
  -l, --limit int                    max number of concurrent tasks (default 2)
  -n, --ns string                    namespace for Telegram session (default "default")
      --ntp string                   ntp server host, if not set, use system time
      --pool int                     specify the size of the DC pool, zero means infinity (default 8)
      --proxy string                 proxy address, format: protocol://username:password@host:port
      --reconnect-timeout duration   Telegram client reconnection backoff timeout, infinite if set to 0 (default 5m0s)
  -s, --size int                     part size for transfer (default 524288)
      --storage stringToString       storage options, format: type=driver,key1=value1,key2=value2. Available drivers: [legacy,bolt,file] (default [type=bolt,path=/home/zxc/.tdl/data])
  -t, --threads int                  max threads for transfer one item (default 4)

Use "tdl [command] --help" for more information about a command.
```

```nix tangle:default.nix
      "tdl"
```

## tremc

Curses interface for transmission
[official site](https://github.com/tremc/tremc)
`$ tremc --help`

```
usage: (prog)s [options] [torrent] -- transmission-remote-args ...

tremc 0.9.3

positional arguments:
  A                     Torrent files to add using transmission-remote

options:
  -h, --help            show this help message and exit
  -v, --version         Show version number and supported Transmission
                        versions.
  -c CONNECTION, --connect CONNECTION
                        Point to the server using pattern
                        [username:password@]host[:port]/[path]
  -s, --ssl             Connect to Transmission using SSL.
  -f CONFIGFILE, --config CONFIGFILE
                        Path to configuration file.
  --create-config       Create configuration file CONFIGFILE with default
                        values.
  -l, --list-actions    List available actions for key mapping.
  -k, --list-keys       List available key names for key mapping.
  -n, --netrc           Get authentication info from your ~/.netrc file.
  -X, --skip-version-check, --permissive
                        Proceed even if the running transmission daemon seems
                        incompatible, or the terminal is too small.
  -p PROFILE, --profile PROFILE
                        Select profile to use.
  -r, --reverse-dns     Toggle reverse DNS peers addresses.
  -d [DEBUG], --debug [DEBUG]
                        Enable debugging messages.

Positional arguments are passed to transmission-remote. Use -- to separate
from tremc arguments
```

```nix tangle:default.nix
      "tremc"
```

## wget

Tool for retrieving files using HTTP, HTTPS, and FTP
[official site](https://www.gnu.org/software/wget/)
`$ wget --help`

```
GNU Wget 1.25.0, a non-interactive network retriever.
Usage: wget [OPTION]... [URL]...

Mandatory arguments to long options are mandatory for short options too.

Startup:
  -V,  --version                   display the version of Wget and exit
  -h,  --help                      print this help
  -b,  --background                go to background after startup
  -e,  --execute=COMMAND           execute a `.wgetrc'-style command

Logging and input file:
  -o,  --output-file=FILE          log messages to FILE
  -a,  --append-output=FILE        append messages to FILE
  -d,  --debug                     print lots of debugging information
  -q,  --quiet                     quiet (no output)
  -v,  --verbose                   be verbose (this is the default)
  -nv, --no-verbose                turn off verboseness, without being quiet
       --report-speed=TYPE         output bandwidth as TYPE.  TYPE can be bits
  -i,  --input-file=FILE           download URLs found in local or external FILE
  -F,  --force-html                treat input file as HTML
  -B,  --base=URL                  resolves HTML input-file links (-i -F)
                                     relative to URL
       --config=FILE               specify config file to use
       --no-config                 do not read any config file
       --rejected-log=FILE         log reasons for URL rejection to FILE

Download:
  -t,  --tries=NUMBER              set number of retries to NUMBER (0 unlimits)
       --retry-connrefused         retry even if connection is refused
       --retry-on-host-error       consider host errors as non-fatal, transient errors
       --retry-on-http-error=ERRORS    comma-separated list of HTTP errors to retry
  -O,  --output-document=FILE      write documents to FILE
  -nc, --no-clobber                skip downloads that would download to
                                     existing files (overwriting them)
       --no-netrc                  don't try to obtain credentials from .netrc
  -c,  --continue                  resume getting a partially-downloaded file
       --start-pos=OFFSET          start downloading from zero-based position OFFSET
       --progress=TYPE             select progress gauge type
       --show-progress             display the progress bar in any verbosity mode
  -N,  --timestamping              don't re-retrieve files unless newer than
                                     local
       --no-if-modified-since      don't use conditional if-modified-since get
                                     requests in timestamping mode
       --no-use-server-timestamps  don't set the local file's timestamp by
                                     the one on the server
  -S,  --server-response           print server response
       --spider                    don't download anything
  -T,  --timeout=SECONDS           set all timeout values to SECONDS
       --dns-timeout=SECS          set the DNS lookup timeout to SECS
       --connect-timeout=SECS      set the connect timeout to SECS
       --read-timeout=SECS         set the read timeout to SECS
  -w,  --wait=SECONDS              wait SECONDS between retrievals
                                     (applies if more then 1 URL is to be retrieved)
       --waitretry=SECONDS         wait 1..SECONDS between retries of a retrieval
                                     (applies if more then 1 URL is to be retrieved)
       --random-wait               wait from 0.5*WAIT...1.5*WAIT secs between retrievals
                                     (applies if more then 1 URL is to be retrieved)
       --no-proxy                  explicitly turn off proxy
  -Q,  --quota=NUMBER              set retrieval quota to NUMBER
       --bind-address=ADDRESS      bind to ADDRESS (hostname or IP) on local host
       --limit-rate=RATE           limit download rate to RATE
       --no-dns-cache              disable caching DNS lookups
       --restrict-file-names=OS    restrict chars in file names to ones OS allows
       --ignore-case               ignore case when matching files/directories
  -4,  --inet4-only                connect only to IPv4 addresses
  -6,  --inet6-only                connect only to IPv6 addresses
       --prefer-family=FAMILY      connect first to addresses of specified family,
                                     one of IPv6, IPv4, or none
       --user=USER                 set both ftp and http user to USER
       --password=PASS             set both ftp and http password to PASS
       --ask-password              prompt for passwords
       --use-askpass=COMMAND       specify credential handler for requesting
                                     username and password.  If no COMMAND is
                                     specified the WGET_ASKPASS or the SSH_ASKPASS
                                     environment variable is used.
       --no-iri                    turn off IRI support
       --local-encoding=ENC        use ENC as the local encoding for IRIs
       --remote-encoding=ENC       use ENC as the default remote encoding
       --unlink                    remove file before clobber
       --xattr                     turn on storage of metadata in extended file attributes

Directories:
  -nd, --no-directories            don't create directories
  -x,  --force-directories         force creation of directories
  -nH, --no-host-directories       don't create host directories
       --protocol-directories      use protocol name in directories
  -P,  --directory-prefix=PREFIX   save files to PREFIX/..
       --cut-dirs=NUMBER           ignore NUMBER remote directory components

HTTP options:
       --http-user=USER            set http user to USER
       --http-password=PASS        set http password to PASS
       --no-cache                  disallow server-cached data
       --default-page=NAME         change the default page name (normally
                                     this is 'index.html'.)
  -E,  --adjust-extension          save HTML/CSS documents with proper extensions
       --ignore-length             ignore 'Content-Length' header field
       --header=STRING             insert STRING among the headers
       --compression=TYPE          choose compression, one of auto, gzip and none. (default: none)
       --max-redirect              maximum redirections allowed per page
       --proxy-user=USER           set USER as proxy username
       --proxy-password=PASS       set PASS as proxy password
       --referer=URL               include 'Referer: URL' header in HTTP request
       --save-headers              save the HTTP headers to file
  -U,  --user-agent=AGENT          identify as AGENT instead of Wget/VERSION
       --no-http-keep-alive        disable HTTP keep-alive (persistent connections)
       --no-cookies                don't use cookies
       --load-cookies=FILE         load cookies from FILE before session
       --save-cookies=FILE         save cookies to FILE after session
       --keep-session-cookies      load and save session (non-permanent) cookies
       --post-data=STRING          use the POST method; send STRING as the data
       --post-file=FILE            use the POST method; send contents of FILE
       --method=HTTPMethod         use method "HTTPMethod" in the request
       --body-data=STRING          send STRING as data. --method MUST be set
       --body-file=FILE            send contents of FILE. --method MUST be set
       --content-disposition       honor the Content-Disposition header when
                                     choosing local file names (EXPERIMENTAL)
       --content-on-error          output the received content on server errors
       --auth-no-challenge         send Basic HTTP authentication information
                                     without first waiting for the server's
                                     challenge

HTTPS (SSL/TLS) options:
       --secure-protocol=PR        choose secure protocol, one of auto, SSLv2,
                                     SSLv3, TLSv1, TLSv1_1, TLSv1_2, TLSv1_3 and PFS
       --https-only                only follow secure HTTPS links
       --no-check-certificate      don't validate the server's certificate
       --certificate=FILE          client certificate file
       --certificate-type=TYPE     client certificate type, PEM or DER
       --private-key=FILE          private key file
       --private-key-type=TYPE     private key type, PEM or DER
       --ca-certificate=FILE       file with the bundle of CAs
       --ca-directory=DIR          directory where hash list of CAs is stored
       --crl-file=FILE             file with bundle of CRLs
       --pinnedpubkey=FILE/HASHES  Public key (PEM/DER) file, or any number
                                   of base64 encoded sha256 hashes preceded by
                                   'sha256//' and separated by ';', to verify
                                   peer against
       --random-file=FILE          file with random data for seeding the SSL PRNG

       --ciphers=STR           Set the priority string (GnuTLS) or cipher list string (OpenSSL) directly.
                                   Use with care. This option overrides --secure-protocol.
                                   The format and syntax of this string depend on the specific SSL/TLS engine.
HSTS options:
       --no-hsts                   disable HSTS
       --hsts-file                 path of HSTS database (will override default)

FTP options:
       --ftp-user=USER             set ftp user to USER
       --ftp-password=PASS         set ftp password to PASS
       --no-remove-listing         don't remove '.listing' files
       --no-glob                   turn off FTP file name globbing
       --no-passive-ftp            disable the "passive" transfer mode
       --preserve-permissions      preserve remote file permissions
       --retr-symlinks             when recursing, get linked-to files (not dir)

FTPS options:
       --ftps-implicit                 use implicit FTPS (default port is 990)
       --ftps-resume-ssl               resume the SSL/TLS session started in the control connection when
                                         opening a data connection
       --ftps-clear-data-connection    cipher the control channel only; all the data will be in plaintext
       --ftps-fallback-to-ftp          fall back to FTP if FTPS is not supported in the target server
WARC options:
       --warc-file=FILENAME        save request/response data to a .warc.gz file
       --warc-header=STRING        insert STRING into the warcinfo record
       --warc-max-size=NUMBER      set maximum size of WARC files to NUMBER
       --warc-cdx                  write CDX index files
       --warc-dedup=FILENAME       do not store records listed in this CDX file
       --no-warc-compression       do not compress WARC files with GZIP
       --no-warc-digests           do not calculate SHA1 digests
       --no-warc-keep-log          do not store the log file in a WARC record
       --warc-tempdir=DIRECTORY    location for temporary files created by the
                                     WARC writer

Recursive download:
  -r,  --recursive                 specify recursive download
  -l,  --level=NUMBER              maximum recursion depth (inf or 0 for infinite)
       --delete-after              delete files locally after downloading them
  -k,  --convert-links             make links in downloaded HTML or CSS point to
                                     local files
       --convert-file-only         convert the file part of the URLs only (usually known as the basename)
       --backups=N                 before writing file X, rotate up to N backup files
  -K,  --backup-converted          before converting file X, back up as X.orig
  -m,  --mirror                    shortcut for -N -r -l inf --no-remove-listing
  -p,  --page-requisites           get all images, etc. needed to display HTML page
       --strict-comments           turn on strict (SGML) handling of HTML comments

Recursive accept/reject:
  -A,  --accept=LIST               comma-separated list of accepted extensions
  -R,  --reject=LIST               comma-separated list of rejected extensions
       --accept-regex=REGEX        regex matching accepted URLs
       --reject-regex=REGEX        regex matching rejected URLs
       --regex-type=TYPE           regex type (posix|pcre)
  -D,  --domains=LIST              comma-separated list of accepted domains
       --exclude-domains=LIST      comma-separated list of rejected domains
       --follow-ftp                follow FTP links from HTML documents
       --follow-tags=LIST          comma-separated list of followed HTML tags
       --ignore-tags=LIST          comma-separated list of ignored HTML tags
  -H,  --span-hosts                go to foreign hosts when recursive
  -L,  --relative                  follow relative links only
  -I,  --include-directories=LIST  list of allowed directories
       --trust-server-names        use the name specified by the redirection
                                     URL's last component
  -X,  --exclude-directories=LIST  list of excluded directories
  -np, --no-parent                 don't ascend to the parent directory

Email bug reports, questions, discussions to <bug-wget@gnu.org>
and/or open issues at https://savannah.gnu.org/bugs/?func=additem&group=wget.
```

```nix tangle:default.nix
      "wget"
```

## wget2

Successor of GNU Wget, a file and recursive website downloader
[gitlab](https://gitlab.com/gnuwget/wget2)
`$ wget2 --help`

```
GNU Wget2 V2.1.0 - multithreaded metalink/file/website downloader

Usage: wget [options...] <url>...

Startup:
  -a  --append-output       File where messages are appended to, '-' for STDOUT
  -b  --background          Go to background immediately after startup. If no
                              output file is specified via the -o, output is redirected to wget-log
  -B  --base                Base for relative URLs read from input-file
                              or from command line
      --config              Path to initialization file (default: ~/.config/wget/wget2rc)
  -d  --debug               Print debugging messages.(default: off)
  -e  --execute             Wget compatibility option, not needed for Wget
      --force-atom          Treat input file as Atom Feed. (default: off) (NEW!)
      --force-css           Treat input file as CSS. (default: off) (NEW!)
  -F  --force-html          Treat input file as HTML. (default: off)
      --force-metalink      Treat input file as Metalink. (default: off) (NEW!)
      --force-rss           Treat input file as RSS Feed. (default: off) (NEW!)
      --force-sitemap       Treat input file as Sitemap. (default: off) (NEW!)
      --fsync-policy        Use fsync() to wait for data being written to
                              the physical layer. (default: off) (NEW!)
  -h  --help                Print this help.
      --hyperlink           Enable terminal hyperlink support
      --input-encoding      Character encoding of the file contents read with
                              --input-file. (default: local encoding)
  -i  --input-file          File where URLs are read from, - for STDIN.
      --local-db            Read or load databases
  -o  --output-file         File where messages are printed to,
                              '-' for STDOUT.
  -q  --quiet               Print no messages except debugging messages.
                              (default: off)
      --stats-dns           Print DNS stats. (default: off)
                              Additional format supported:
                              --stats-dns=[FORMAT:]FILE
      --stats-ocsp          Print OCSP stats. (default: off)
                              Additional format supported:
                              --stats-ocsp=[FORMAT:]FILE
      --stats-server        Print server stats. (default: off)
                              Additional format supported:
                              --stats-server=[FORMAT:]FILE
      --stats-site          Print site stats. (default: off)
                              Additional format supported:
                              --stats-site=[FORMAT:]FILE
      --stats-tls           Print TLS stats. (default: off)
                              Additional format supported:
                              --stats-tls=[FORMAT:]FILE
      --unlink              Remove files before clobbering. (default: off)
  -v  --verbose             Print more messages. (default: on)
  -V  --version             Display the version of Wget and exit.

Download:
  -A  --accept              Comma-separated list of file name suffixes or
                              patterns.
      --accept-regex        Regex matching accepted URLs.
      --ask-password        Print prompt for password
      --backups             Make backups instead of overwriting/increasing
                              number. (default: 0)
      --bind-address        Bind to sockets to local address.
                              (default: automatic)
      --bind-interface      Bind sockets to the input Network Interface.
                              (default: automatic)
      --body-data           Data to be sent in a request.
      --body-file           File with data to be sent in a request.
      --cache               Enabled using of server cache. (default: on)
      --chunk-size          Download large files in multithreaded chunks.
                              (default: 0 (=off)) Example:
                              wget --chunk-size=1M
      --clobber             Enable file clobbering. (default: on)
      --connect-timeout     Connect timeout in seconds.
      --content-on-error    Save response body even on error status.
                              (default: off)
  -c  --continue            Continue download for given files. (default: off)
      --convert-file-only   Convert only filename part of embedded URLs.
                              (default: off)
  -k  --convert-links       Convert embedded URLs to local URLs.
                              (default: off)
      --cut-file-get-vars   Cut HTTP GET vars from file names. (default: off)
      --cut-url-get-vars    Cut HTTP GET vars from URLs. (default: off)
      --delete-after        Don't save downloaded files. (default: off)
      --dns-cache           Caching of domain name lookups. (default: on)
      --dns-cache-preload   File to be used to preload the DNS cache.
                              Format is like /etc/hosts (IP<whitespace>hostname).
      --dns-timeout         DNS lookup timeout in seconds.
  -D  --domains             Comma-separated list of domains to follow.
      --download-attr       Recognize HTML5 download attributes.
                              'strippath' strips the path to be more secure.
'usepath' uses the path as is (this can be extremely dangerous !).
(default: strippath)
  -X  --exclude-directories
                            Comma-separated list of directories NOT to download.
                              Wildcards are allowed.
      --exclude-domains     Comma-separated list of domains NOT to follow.
      --filter-mime-type    Specify a list of mime types to be saved or ignored
      --filter-urls         Apply the accept and reject filters on the URL
                              before starting a download. (default: off)
      --follow-sitemaps     Scan sitemaps found in robots.txt. (default: on)
      --follow-tags         Scan additional tag/attributes for URLs,
                              e.g. --follow-tags="img/data-500px,img/data-hires
      --force-progress      Force progress bar.
                              (default: off)
      --http2-request-window
                            Max. number of parallel streams per HTTP/2
                              connection. (default: 30)
      --if-modified-since   Do not send If-Modified-Since header in -N mode.
Send preliminary HEAD request instead. This has only
                              effect in -N mode.
      --ignore-case         Ignore case when matching files. (default: off)
      --ignore-length       Ignore content-length header field
                              (default: off)
      --ignore-tags         Ignore tag/attributes for URL scanning,
                              e.g. --ignore-tags="img,a/href
  -I  --include-directories
                            Comma-separated list of directories TO download.
                              Wildcards are allowed.
  -4  --inet4-only          Use IPv4 connections only. (default: off)
  -6  --inet6-only          Use IPv6 connections only. (default: off)
      --iri                 Wget dummy option, you can't switch off
                              international support
      --keep-extension      If file exists: Use pattern 'basename_N.ext'
                              instead of 'filename.N'. (default: off)
  -l  --level               Maximum recursion depth. (default: 5)
      --local-encoding      Character encoding of environment and filenames.
      --max-redirect        Max. number of redirections to follow.
                              (default: 20)
      --max-threads         Max. concurrent download threads.
                              (default: 5) (NEW!)
  -m  --mirror              Turn on mirroring options -r -N -l inf
      --netrc               Load credentials from ~/.netrc if not given.
                              (default: on)
  -O  --output-document     File where downloaded content is written to,
                              '-O'  for STDOUT.
  -p  --page-requisites     Download all necessary files to display a
                              HTML page
      --parent              Ascend above parent directory. (default: on)
      --password            Password for Authentication.
                              (default: empty password)
      --post-data           Data to be sent in a POST request.
      --post-file           File with data to be sent in a POST request.
      --prefer-family       Prefer IPv4 or IPv6. (default: none)
      --progress            Type of progress bar (bar, none).
                              (default: none)
      --proxy               Enable support for *_proxy environment variables.
                              (default: on)
      --random-wait         Wait 0.5 up to 1.5*<--wait> seconds between
                              downloads (per thread). (default: off)
      --read-timeout        Read and write timeout in seconds.
  -r  --recursive           Recursive download. (default: off)
      --regex-type          Regular expression type. Possible types are
                              posix or pcre. (default: posix)
  -R  --reject              Comma-separated list of file name suffixes or
                              patterns.
      --reject-regex        Regex matching rejected URLs.
      --remote-encoding     Character encoding of remote files
                              (if not specified in Content-Type HTTP header
                              or in document itself)
      --report-speed        Output bandwidth as TYPE. TYPE can be bytes
                              or bits. --progress MUST be used.
      --restrict-file-names
                            unix, windows, nocontrol, ascii, lowercase,
                              uppercase, none
      --retry-on-http-error
                            Specify a list of http statuses in which the download will be retried
      --robots              Respect robots.txt standard for recursive
                              downloads. (default: on)
      --save-content-on     Specify a list of response codes that requires it's
                              response body to be saved on error status
  -S  --server-response     Print the server response headers. (default: off)
  -H  --span-hosts          Span hosts that were not given on the
                              command line. (default: off)
      --spider              Enable web spider mode. (default: off)
      --start-pos           Start downloading at zero-based position, 0 = option disabled. (default: 0)
      --strict-comments     A dummy option. Parsing always works non-strict.
      --tcp-fastopen        Enable TCP Fast Open (TFO). (default: on)
  -T  --timeout             General network timeout in seconds.
  -N  --timestamping        Just retrieve younger files than the local ones.
                              (default: off)
  -t  --tries               Number of tries for each download. (default 20)
      --trust-server-names  On redirection use the server's filename.
                              (default: off)
      --use-askpass         Prompt for a user and password using
                              the specified command.
      --use-server-timestamps
                            Set local file's timestamp to server's timestamp.
                              (default: on)
      --user                Username for Authentication.
                              (default: empty username)
  -w  --wait                Wait number of seconds between downloads
                              (per thread). (default: 0)
      --waitretry           Wait up to number of seconds after error
                              (per thread). (default: 10)
      --xattr               Save extended file attributes. (default: off)

HTTP related options:
  -E  --adjust-extension    Append extension to saved file (.html or .css).
                              (default: off)
      --auth-no-challenge   send Basic HTTP Authentication before challenge
  -K  --backup-converted    When converting, keep the original file with
                              a .orig suffix. (default: off)
      --compression         Customize Accept-Encoding with
                              identity, gzip, deflate, xz, lzma, br, bzip2, zstd, lzip
                              and any combination of it
                              no-compression means no Accept-Encoding
      --content-disposition
                            Take filename from Content-Disposition.
                              (default: off)
      --cookie-suffixes     Load public suffixes from file.
                              They prevent 'supercookie' vulnerabilities.
                              See https://publicsuffix.org/ for details.
      --cookies             Enable use of cookies. (default: on)
      --default-http-port   Set default port for HTTP. (default: 80)
      --default-https-port  Set default port for HTTPS. (default: 443)
      --default-page        Default file name. (default: index.html)
      --header              Insert input string as a HTTP header in
                              all requests
      --html-extension      Obsoleted by --adjust-extension
      --http-keep-alive     Keep connection open for further requests.
                              (default: on)
      --http-password       Password for HTTP Authentication.
                              (default: empty password)
      --http-proxy          Set HTTP proxy/proxies, overriding environment
                              variables. Use comma to separate proxies.
      --http-proxy-password
                            Password for HTTP Proxy Authentication.
                              (default: empty password)
      --http-proxy-user     Username for HTTP Proxy Authentication.
                              (default: empty username)
      --http-user           Username for HTTP Authentication.
                              (default: empty username)
      --keep-session-cookies
                            Also save session cookies. (default: off)
      --limit-rate          Limit rate of download per second, 0 = no limit. (default: 0)
      --load-cookies        Load cookies from file.
      --metalink            Follow a metalink file instead of storing it
                              (default: on)
      --method              HTTP method to use for request.
      --netrc-file          Set file for login/password to use instead of
                              ~/.netrc. (default: ~/.netrc)
  -Q  --quota               Download quota, 0 = no quota. (default: 0)
      --referer             Include Referer: url in HTTP request.
                              (default: off)
      --retry-connrefused   Consider "connection refused" a transient error.
                               (default: off)
      --save-cookies        Save cookies to file.
      --save-headers        Save the response headers in front of the response
                              data. (default: off)
  -U  --user-agent          HTTP User Agent string.
                              (default: wget)

HTTPS (SSL/TLS) related options:
      --ca-certificate      File with bundle of PEM CA certificates.
      --ca-directory        Directory with PEM CA certificates.
      --certificate         File with client certificate.
      --certificate-type    Certificate type: PEM or DER (known as ASN1).
                              (default: PEM)
      --check-certificate   Check the server's certificate. (default: on)
      --check-hostname      Check the server's certificate's hostname.
                              (default: on)
      --crl-file            File with PEM CRL certificates.
      --dane                Enable DANE certificate checking.(default: off)
      --egd-file            File to be used as socket for random data from
                              Entropy Gathering Daemon.
      --hpkp                Use HTTP Public Key Pinning (HPKP). (default: on)
      --hpkp-file           Set file for storing HPKP data
                              (default: $XDG_DATA_HOME/wget/.wget-hpkp)
      --hsts                Use HTTP Strict Transport Security (HSTS).
                              (default: on)
      --hsts-file           Set file for HSTS caching. (default: $XDG_DATA_HOME/wget/.wget-hsts)
      --hsts-preload        Use HTTP Strict Transport Security (HSTS).
                              (default: on)
      --hsts-preload-file   Set name for the HSTS Preload file (DAFSA format).
                              (default: the distribution's HSTS data file)
      --http2               Use HTTP/2 protocol if possible. (default: on)
      --http2-only          Only use HTTP/2 protocol, error if server doesn't offer it. (default: off)
      --https-enforce       Use secure HTTPS instead of HTTP. Legal types are
                              'hard', 'soft' and 'none'.
                              If --https-only is enabled,
                              this option has no effect. (default: none)
      --https-only          Do not follow non-secure URLs. (default: off).
      --https-proxy         Set HTTPS proxy/proxies, overriding environment
                              variables. Use comma to separate proxies.
      --ocsp                Use OCSP server access to verify server's
                              certificate. (default: on)
      --ocsp-date           Check if OCSP response date is too old.
                              (default: on)
      --ocsp-file           Set file for OCSP chaching.
                              (default: $XDG_DATA_HOME/wget/.wget-ocsp)
      --ocsp-nonce          Allow nonce checking when verifying OCSP
                              response. (default: on)
      --ocsp-server         Set OCSP server address.
                              (default: OCSP server given in certificate)
      --ocsp-stapling       Use OCSP stapling to verify the server's
                              certificate. (default: on)
      --private-key         File with private key.
      --private-key-type    Type of the private key (PEM or DER).
                              (default: PEM)
      --random-file         File to be used as source of random data.
      --secure-protocol     Set protocol to be used (auto, SSLv3, TLSv1, TLSv1_1, TLSv1_2, TLS1_3, PFS).
                              (default: auto). Or use GnuTLS priority
                              strings, e.g. NORMAL:-VERS-SSL3.0:-RSA
      --tls-false-start     Enable TLS False Start (needs GnuTLS 3.5+).
                              (default: on)
      --tls-resume          Enable TLS Session Resumption. (default: off)
      --tls-session-file    Set file for TLS Session caching.
                              (default: $XDG_DATA_HOME/wget/.wget-session)

Directory options:
      --cut-dirs            Skip creating given number of directory
                              components. (default: 0)
      --directories         Create hierarchy of directories when retrieving
                              recursively. (default: on)
  -P  --directory-prefix    Set directory prefix.
  -x  --force-directories   Create hierarchy of directories when not
                              retrieving recursively. (default: off)
      --host-directories    Create host directories when retrieving
                              recursively. (default: on)
      --protocol-directories
                            Force creating protocol directories.
                              (default: off)

GPG related options:
      --gnupg-homedir       Specify a directory to use as the GnuPG home
                               directory. (default: gnupg default homedir)
      --signature-extensions
                            The extension of the signature file which should be
                              downloaded. (default: sig)
      --verify-save-failed  Save target files even when their signatures fail
                              GPG validation. (default: off)
  -s  --verify-sig          Download .sig file and verify. (default: off)

Plugin options:
      --list-plugins        Lists all the plugins in the plugin search paths.
      --local-plugin        Loads a plugin with a given path.
      --plugin              Load a plugin with a given name.
      --plugin-dirs         Specify alternative directories to look
                              for plugins, separated by ','
      --plugin-help         Print help message for all loaded plugins
      --plugin-opt          Forward an option to a loaded plugin.
                              The option should be in format:
                              <plugin_name>.<option>[=value]


Example boolean option:
 --quiet=no is the same as --no-quiet or --quiet=off or --quiet off
Example string option:
 --user-agent=SpecialAgent/1.3.5 or --user-agent "SpecialAgent/1.3.5"

To reset string options use --[no-]option

```

```nix tangle:default.nix
      "wget2"
```

## xidel

Command line tool to download and extract data from HTML/XML pages as well as JSON APIs
[official site](https://www.videlibri.de/xidel.html)
`$ xidel --help`

```


The following command line options are valid:

--input=<string>                 	Data/URL/File/Stdin(-) to process
                                 	(--input= prefix can be omitted)
--data=<string>                  	Deprecated option for --input
--download=<string>              	Downloads/saves the data to a given
                                 	filename (- prints to stdout, . uses
                                 	the filename of the url)


Extraction options:

  --extract=<string>  or -e      	Expression to extract from the data.
                                   	If it starts with < it is interpreted
                                  	as template, otherwise as XPath
                                  	expression
  --extract-exclude=<string>     	Comma separated list of variables
                                  	ignored in an extract template.
                                  	(black list) (default _follow)
                                  	(default: _follow)
  --extract-include=<string>     	If not empty, comma separated list of
                                  	variables to use in an extract
                                  	template (white list)
  --extract-file=<file>          	File containing an extract expression
                                  	(for longer expressions)
  --extract-kind=<string>        	How the extract expression is
                                  	evaluated. Can be auto (automatically
                                  	choose between xpath/template),
                                  	xpath{|2|3}, xquery{|1|3}, css,
                                  	template or multipage (default:
                                  	auto)
  --css=<string>                 	Abbreviation for --extract-kind=css
                                  	--extract=...
  --xpath=<string>               	Abbreviation for
                                  	--extract-kind=xpath3 --extract=...
  --xquery=<string>              	Abbreviation for
                                  	--extract-kind=xquery3 --extract=...
  --xpath2=<string>              	Abbreviation for
                                  	--extract-kind=xpath2 --extract=...
  --xquery1=<string>             	Abbreviation for
                                  	--extract-kind=xquery1 --extract=...
  --xpath3=<string>              	Abbreviation for
                                  	--extract-kind=xpath3 --extract=...
  --xquery3=<string>             	Abbreviation for
                                  	--extract-kind=xquery3 --extract=...
  --xpath3.0=<string>            	Abbreviation for
                                  	--extract-kind=xpath3.0
                                  	--extract=...
  --xquery3.0=<string>           	Abbreviation for
                                  	--extract-kind=xquery3.0
                                  	--extract=...
  --xpath3.1=<string>            	Abbreviation for
                                  	--extract-kind=xpath3.1
                                  	--extract=...
  --xquery3.1=<string>           	Abbreviation for
                                  	--extract-kind=xquery3.1
                                  	--extract=...
  --template-file=<file>         	Abbreviation for
                                  	--extract-kind=multipage
                                  	--extract-file=...
  --template-action=<string>     	Select which action from the
                                  	multipage template should be run
                                  	(multiple actions separated by
                                  	commas)
  --module=<file>                	Imports an xpath/xquery module
  --module-path=<string>         	Search path for modules


Follow options:

  --follow=<string>  or -f       	Expression selecting data from the
                                  	page which will be followed.
                                   	If the expression returns a sequence,
                                  	all its elements are followed.
                                   	If it is an HTML element with an
                                  	resource property this property is
                                  	used, e.g. from an A element it will
                                  	follow to its @href property.
                                   	If it is an object, its url property
                                  	and its other properties can override
                                  	command line arguments
                                   	Otherwise, the string value is used
                                  	as url.
  --follow-kind=<string>         	How the follow expression is
                                  	evaluated. Like extract-kind
  --follow-exclude=<string>      	Comma separated list of variables
                                  	ignored in a follow template. (black
                                  	list)
  --follow-include=<string>      	Comma separated list of variables
                                  	used in a follow template. (white
                                  	list)
  --follow-file=<file>           	File containing a follow expression
                                  	(for longer expressions)
  --follow-level=<int>           	Maximal recursion deep (default:
                                  	99999)
  --allow-repetitions            	Follow all links, even if that page
                                  	was already visited.


HTTP connection options:

  --wait=<float>                 	Wait a certain count of seconds
                                  	between requests
  --user-agent=<string>          	Useragent used in http request
                                  	(default: Mozilla/5.0 (compatible;
                                  	Xidel))
  --proxy=<string>               	Proxy used for requests. (prepend
                                  	socks= for SOCKS proxy)
  --post=<string>  or -d         	Post request to send (url encoded).
                                  	Multiple close occurrences are
                                  	joined. If the new argument starts
                                  	with &, it will always be joined. If
                                  	it is empty, it will clear the
                                  	previous parameters.
  --form=<string>  or -F         	Post request to send (multipart
                                  	encoded). See --usage. Can be used
                                  	multiple times like --post.
  --method=<string>              	HTTP method to use (e.g. GET, POST,
                                  	PUT) (default: GET)
  --header=<string>  or -H       	Additional header to include (e.g.
                                  	"Set-Cookie: a=b"). Can be used
                                  	multiple times like --post.
  --load-cookies=<string>        	Load cookies from file
  --save-cookies=<string>        	Save cookies to file
  --print-received-headers       	Print the received headers
  --error-handling=<string>      	How to handle http errors, e.g.
                                  	1xx=retry,200=accept,3xx=redirect,4xx
                                  	=abort,5xx=skip
  --compressed                   	Add header Accept-Encoding: gzip
  --raw-url                      	Do not escape the url (preliminary)


HTTPS connection options:

  --no-check-certificate         	Do not verify HTTPS certificates
  --ca-certificate=<file>        	CA certificate file for OpenSSL
                                  	(default:
                                  	/etc/ssl/certs/ca-certificates.crt)
  --ca-directory=<string>        	CA certificate directory for OpenSSL
                                  	(default: /etc/ssl/certs)


Output/Input options:

  --silent or -s                 	Do not print status information to
                                  	stderr
  --verbose                      	Print more status information
  --default-variable-name=<string> 	Variable name for values read in the
                                  	template without explicitely given
                                  	variable name (default: result)
  --print-variables=<string>     	Which of the separate variable lists
                                  	are printed
                                   	Comma separated list of:
                                   	  log: Prints every variable value
                                   	  final: Prints only the final value
                                  	of a variable, if there are multiple
                                  	assignments to it
                                   	  condensed-log: Like log, but
                                  	removes assignments to object
                                  	properties(default) (default:
                                  	condensed-log)
  --print-type-annotations       	Prints all variable values with type
                                  	annotations (e.g. string: abc,
                                  	instead of abc)
  --hide-variable-names          	Do not print the name of variables
                                  	defined in an extract template
  --variable=<string>            	Declares a variable (value taken from
                                  	environment if not given explicitely)
                                  	(multiple variables are preliminary)
  --xmlns=<string>               	Declares a namespace
  --output-node-format=<string>  	Format of an extracted node: text,
                                  	html or xml
  --printed-node-format=<string> 	deprecated
  --output-json-indent=<string>  	Format of JSON items: pretty or
                                  	compact
  --printed-json-format=<string> 	deprecated
  --output-node-indent           	Pretty  print XML or HTML
  --output-format=<string>       	Output format: adhoc (simple human
                                  	readable), xml, html, xml-wrapped
                                  	(machine readable version of adhoc),
                                  	json-wrapped, bash (export vars to
                                  	bash), or cmd (export vars to
                                  	cmd.exe)  (default: adhoc)
  --output-encoding=<string>     	Character encoding of the output.
                                  	utf-8, latin1, utf-16be, utf-16le,
                                  	oem (windows console) or input (no
                                  	encoding conversion) (default:
                                  	utf-8)
  --output-declaration=<string>  	Header for the output. (e.g.
                                  	<!DOCTYPE html>, default depends on
                                  	output-format)
  --output-separator=<string>    	Separator between multiple items
                                  	(default: line break) (default:
                                   	)
  --output-header=<string>       	2nd header for the output. (e.g.
                                  	<html>)
  --output-footer=<string>       	Footer for the output. (e.g.
                                  	</html>)
  --output-key-order=<string>    	Order of JSON keys (default:
                                  	insertion)
                                   	Allowed values: insertion, ascending,
                                  	descending
  --color=<string>               	Coloring option
                                  	(never,always,json,xml) (default:
                                  	auto)
  --stdin-encoding=<string>      	Character encoding of stdin (default:
                                  	utf-8)
  --input-format=<string>        	Input format: auto, html, xml,
                                  	xml-strict, json, json-strict, text
                                  	(default: auto)
  --xml                          	Abbreviation for --input-format=xml
                                  	--output-format=xml
  --html                         	Abbreviation for --input-format=html
                                  	--output-format=html
  --in-place                     	Override the input file


Debug options:

  --debug-arguments              	Shows how the command line arguments
                                  	were parsed
  --trace                        	Traces the evaluation of all queries
  --trace-stack                  	Traces the evaluation to print a
                                  	backtrace in case of errors
  --trace-context                	Like trace-stack, but for the
                                  	context


XPath/XQuery compatibility options:

  --json-mode=<string>           	JSON mode: Possible values: standard,
                                  	jsoniq, unified, deprecated
  --no-json                      	Disables the JSONiq syntax extensions
                                  	(like [1,2,3] and {"a": 1, "b": 2})
  --no-json-literals             	Disables the json true/false/null
                                  	literals
  --dot-notation=<string>        	Specifies if the dot operator
                                  	$object.property can be used.
                                  	Possible values: off, on, unambiguous
                                  	(default, does not allow $obj.prop,
                                  	but ($obj).prop )  (default:
                                  	unambiguous)
  --no-dot-notation              	Disables the dot notation for
                                  	property access, like in
                                  	$object.property (deprecated)
  --only-json-objects            	Do not allow non-JSON types in object
                                  	properties (like  () or (1,2) instead
                                  	of null and [1,2])
  --no-extended-json             	Disables non-jsoniq json extensions
  --strict-type-checking         	Disables weakly typing ("1" + 2 will
                                  	raise an error, otherwise it
                                  	evaluates to 3)
  --strict-namespaces            	Disables the usage of undeclared
                                  	namespace. Otherwise foo:bar always
                                  	matches an element with prefix foo.
  --no-extended-strings          	Does not allow x-prefixed strings
                                  	like x"foo{1+2+3}bar"
  --ignore-namespaces            	Removes all namespaces from the input
                                  	document
  --no-optimizations             	Disables optimizations
  --deprecated-string-options    	Replaces the old $foo; variables with
                                  	the new {$foo} in arguments
  --deprecated-trim-nodes        	Removes all surrounding white space
                                  	of all nodes.
  --version                      	Print version number (0.9.9)
  --usage                        	Print help, examples and usage
                                  	information
  --quiet or -q                  	-quiet,-q is outdated. Use
                                  	--silent,-s

```

```nix tangle:default.nix
      "xidel"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
```

## aria2

Lightweight, multi-protocol, multi-source, command-line download utility
[official site](https://aria2.github.io/)
`$ aria2c --help`

```
Usage: aria2c [OPTIONS] [URI | MAGNET | TORRENT_FILE | METALINK_FILE]...
Printing options tagged with '#basic'.
See 'aria2c -h#help' to know all available tags.
Options:
 -v, --version                Print the version number and exit.

                              Tags: #basic

 -h, --help[=TAG|KEYWORD]     Print usage and exit.
                              The help messages are classified with tags. A tag
                              starts with "#". For example, type "--help=#http"
                              to get the usage for the options tagged with
                              "#http". If non-tag word is given, print the usage
                              for the options whose name includes that word.

                              Possible Values: #basic, #advanced, #http, #https, #ftp, #metalink, #bittorrent, #cookie, #hook, #file, #rpc, #checksum, #experimental, #deprecated, #help, #all
                              Default: #basic
                              Tags: #basic, #help

 -l, --log=LOG                The file name of the log file. If '-' is
                              specified, log is written to stdout.

                              Possible Values: /path/to/file, -
                              Tags: #basic

 -d, --dir=DIR                The directory to store the downloaded file.

                              Possible Values: /path/to/directory
                              Default: /home/zxc/workspace/snowfall/modules/home/cli/download
                              Tags: #basic, #file

 -o, --out=FILE               The file name of the downloaded file. It is
                              always relative to the directory given in -d
                              option. When the -Z option is used, this option
                              will be ignored.

                              Possible Values: /path/to/file
                              Tags: #basic, #http, #ftp, #file

 -s, --split=N                Download a file using N connections. If more
                              than N URIs are given, first N URIs are used and
                              remaining URLs are used for backup. If less than
                              N URIs are given, those URLs are used more than
                              once so that N connections total are made
                              simultaneously. The number of connections to the
                              same host is restricted by the
                              --max-connection-per-server option. See also the
                              --min-split-size option.

                              Possible Values: 1-*
                              Default: 5
                              Tags: #basic, #http, #ftp

 --file-allocation=METHOD     Specify file allocation method.
                              'none' doesn't pre-allocate file space. 'prealloc'
                              pre-allocates file space before download begins.
                              This may take some time depending on the size of
                              the file.
                              If you are using newer file systems such as ext4
                              (with extents support), btrfs, xfs or NTFS
                              (MinGW build only), 'falloc' is your best
                              choice. It allocates large(few GiB) files
                              almost instantly. Don't use 'falloc' with legacy
                              file systems such as ext3 and FAT32 because it
                              takes almost the same time as 'prealloc' and it
                              blocks aria2 entirely until allocation finishes.
                              'falloc' may not be available if your system
                              doesn't have posix_fallocate() function.
                              'trunc' uses ftruncate() system call or
                              platform-specific counterpart to truncate a file
                              to a specified length.

                              Possible Values: none, prealloc, trunc, falloc
                              Default: prealloc
                              Tags: #basic, #file

 -V, --check-integrity[=true|false] Check file integrity by validating piece
                              hashes or a hash of entire file. This option has
                              effect only in BitTorrent, Metalink downloads
                              with checksums or HTTP(S)/FTP downloads with
                              --checksum option. If piece hashes are provided,
                              this option can detect damaged portions of a file
                              and re-download them. If a hash of entire file is
                              provided, hash check is only done when file has
                              been already download. This is determined by file
                              length. If hash check fails, file is
                              re-downloaded from scratch. If both piece hashes
                              and a hash of entire file are provided, only
                              piece hashes are used.

                              Possible Values: true, false
                              Default: false
                              Tags: #basic, #metalink, #bittorrent, #file, #checksum

 -c, --continue[=true|false]  Continue downloading a partially downloaded
                              file. Use this option to resume a download
                              started by a web browser or another program
                              which downloads files sequentially from the
                              beginning. Currently this option is only
                              applicable to http(s)/ftp downloads.

                              Possible Values: true, false
                              Default: false
                              Tags: #basic, #http, #ftp

 -i, --input-file=FILE        Downloads URIs found in FILE. You can specify
                              multiple URIs for a single entity: separate
                              URIs on a single line using the TAB character.
                              Reads input from stdin when '-' is specified.
                              Additionally, options can be specified after each
                              line of URI. This optional line must start with
                              one or more white spaces and have one option per
                              single line. See INPUT FILE section of man page
                              for details. See also --deferred-input option.

                              Possible Values: /path/to/file, -
                              Tags: #basic

 -j, --max-concurrent-downloads=N Set maximum number of parallel downloads for
                              every static (HTTP/FTP) URL, torrent and metalink.
                              See also --split and --optimize-concurrent-downloads options.

                              Possible Values: 1-*
                              Default: 5
                              Tags: #basic

 -Z, --force-sequential[=true|false] Fetch URIs in the command-line sequentially
                              and download each URI in a separate session, like
                              the usual command-line download utilities.

                              Possible Values: true, false
                              Default: false
                              Tags: #basic

 -x, --max-connection-per-server=NUM The maximum number of connections to one
                              server for each download.

                              Possible Values: 1-16
                              Default: 1
                              Tags: #basic, #http, #ftp

 -k, --min-split-size=SIZE    aria2 does not split less than 2*SIZE byte range.
                              For example, let's consider downloading 20MiB
                              file. If SIZE is 10M, aria2 can split file into 2
                              range [0-10MiB) and [10MiB-20MiB) and download it
                              using 2 sources(if --split >= 2, of course).
                              If SIZE is 15M, since 2*15M > 20MiB, aria2 does
                              not split file and download it using 1 source.
                              You can append K or M(1K = 1024, 1M = 1024K).

                              Possible Values: 1048576-1073741824
                              Default: 20M
                              Tags: #basic, #http, #ftp

 --ftp-user=USER              Set FTP user. This affects all URLs.

                              Tags: #basic, #ftp

 --ftp-passwd=PASSWD          Set FTP password. This affects all URLs.

                              Tags: #basic, #ftp

 --http-user=USER             Set HTTP user. This affects all URLs.

                              Tags: #basic, #http

 --http-passwd=PASSWD         Set HTTP password. This affects all URLs.

                              Tags: #basic, #http

 --load-cookies=FILE          Load Cookies from FILE using the Firefox3 format
                              and Mozilla/Firefox(1.x/2.x)/Netscape format.

                              Possible Values: /path/to/file
                              Tags: #basic, #http, #cookie

 -S, --show-files[=true|false] Print file listing of .torrent, .meta4 and
                              .metalink file and exit. More detailed
                              information will be listed in case of torrent
                              file.

                              Possible Values: true, false
                              Default: false
                              Tags: #basic, #metalink, #bittorrent

 --max-overall-upload-limit=SPEED Set max overall upload speed in bytes/sec.
                              0 means unrestricted.
                              You can append K or M(1K = 1024, 1M = 1024K).
                              To limit the upload speed per torrent, use
                              --max-upload-limit option.

                              Possible Values: 0-*
                              Default: 0
                              Tags: #basic, #bittorrent

 -u, --max-upload-limit=SPEED Set max upload speed per each torrent in
                              bytes/sec. 0 means unrestricted.
                              You can append K or M(1K = 1024, 1M = 1024K).
                              To limit the overall upload speed, use
                              --max-overall-upload-limit option.

                              Possible Values: 0-*
                              Default: 0
                              Tags: #basic, #bittorrent

 -T, --torrent-file=TORRENT_FILE  The path to the .torrent file.

                              Possible Values: /path/to/file
                              Tags: #basic, #bittorrent

 --listen-port=PORT...        Set TCP port number for BitTorrent downloads.
                              Multiple ports can be specified by using ',',
                              for example: "6881,6885". You can also use '-'
                              to specify a range: "6881-6999". ',' and '-' can
                              be used together.

                              Possible Values: 1024-65535
                              Default: 6881-6999
                              Tags: #basic, #bittorrent

 --enable-dht[=true|false]    Enable IPv4 DHT functionality. It also enables
                              UDP tracker support. If a private flag is set
                              in a torrent, aria2 doesn't use DHT for that
                              download even if ``true`` is given.

                              Possible Values: true, false
                              Default: true
                              Tags: #basic, #bittorrent

 --dht-listen-port=PORT...    Set UDP listening port used by DHT(IPv4, IPv6)
                              and UDP tracker. Multiple ports can be specified
                              by using ',', for example: "6881,6885". You can
                              also use '-' to specify a range: "6881-6999".
                              ',' and '-' can be used together.

                              Possible Values: 1024-65535
                              Default: 6881-6999
                              Tags: #basic, #bittorrent

 --enable-dht6[=true|false]   Enable IPv6 DHT functionality.
                              Use --dht-listen-port option to specify port
                              number to listen on. See also --dht-listen-addr6
                              option.

                              Possible Values: true, false
                              Default: false
                              Tags: #basic, #bittorrent

 --dht-listen-addr6=ADDR      Specify address to bind socket for IPv6 DHT.
                              It should be a global unicast IPv6 address of the
                              host.

                              Tags: #basic, #bittorrent

 -M, --metalink-file=METALINK_FILE The file path to the .meta4 and .metalink
                              file. Reads input from stdin when '-' is
                              specified.

                              Possible Values: /path/to/file, -
                              Tags: #basic, #metalink

URI, MAGNET, TORRENT_FILE, METALINK_FILE:
 You can specify multiple HTTP(S)/FTP URIs. Unless you specify -Z option, all
 URIs must point to the same file or downloading will fail.
 You can also specify arbitrary number of BitTorrent Magnet URIs, torrent/
 metalink files stored in a local drive. Please note that they are always
 treated as a separate download.

 You can specify both torrent file with -T option and URIs. By doing this,
 download a file from both torrent swarm and HTTP/FTP server at the same time,
 while the data from HTTP/FTP are uploaded to the torrent swarm. For single file
 torrents, URI can be a complete URI pointing to the resource or if URI ends
 with '/', 'name' in torrent file is added. For multi-file torrents, 'name' and
 'path' in torrent are added to form a URI for each file.

 Make sure that URI is quoted with single(') or double(") quotation if it
 contains "&" or any characters that have special meaning in shell.

About the number of connections
 Since 1.10.0 release, aria2 uses 1 connection per host by default and has 20MiB
 segment size restriction. So whatever value you specify using -s option, it
 uses 1 connection per host. To make it behave like 1.9.x, use
 --max-connection-per-server=4 --min-split-size=1M.

Refer to man page for more information.
```

```nix tangle:default.nix
      "aria2"
```

## eget

Easily install prebuilt binaries from GitHub
[github](https://github.com/zyedidia/eget)
`$ eget --help`

```
Usage:
  eget [OPTIONS] TARGET

Application Options:
  -t, --tag=           tagged release to use instead of latest
      --pre-release    include pre-releases when fetching the latest version
      --source         download the source code for the target repo instead of
                       a release
      --to=            move to given location after extracting
  -s, --system=        target system to download for (use "all" for all choices)
  -f, --file=          glob to select files for extraction
      --all            extract all candidate files
  -q, --quiet          only print essential output
  -d, --download-only  stop after downloading the asset (no extraction)
      --upgrade-only   only download if release is more recent than current
                       version
  -a, --asset=         download a specific asset containing the given string;
                       can be specified multiple times for additional
                       filtering; use ^ for anti-match
      --sha256         show the SHA-256 hash of the downloaded asset
      --verify-sha256= verify the downloaded asset checksum against the one
                       provided
      --rate           show GitHub API rate limiting information
  -r, --remove         remove the given file from $EGET_BIN or the current
                       directory
  -v, --version        show version information
  -h, --help           show this help message
  -D, --download-all   download all projects defined in the config file
  -k, --disable-ssl    disable SSL verification for download requests
```

```nix tangle:default.nix
      "eget"
```

## gallery-dl

Command-line program to download image-galleries and -collections from several image hosting sites
[github](https://github.com/mikf/gallery-dl)
`$ gallery-dl --help`

```
usage: gallery-dl [OPTION]... URL...

General Options:
  -h, --help                  Print this help message and exit
  --version                   Print program version and exit
  -f, --filename FORMAT       Filename format string for downloaded files
                              ('/O' for "original" filenames)
  -d, --destination PATH      Target location for file downloads
  -D, --directory PATH        Exact location for file downloads
  -X, --extractors PATH       Load external extractors from PATH
  --user-agent UA             User-Agent request header
  --clear-cache MODULE        Delete cached login sessions, cookies, etc. for
                              MODULE (ALL to delete everything)

Update Options:
  -U, --update-check          Check if a newer version is available

Input Options:
  -i, --input-file FILE       Download URLs found in FILE ('-' for stdin).
                              More than one --input-file can be specified
  -I, --input-file-comment FILE
                              Download URLs found in FILE. Comment them out
                              after they were downloaded successfully.
  -x, --input-file-delete FILE
                              Download URLs found in FILE. Delete them after
                              they were downloaded successfully.
  --no-input                  Do not prompt for passwords/tokens

Output Options:
  -q, --quiet                 Activate quiet mode
  -w, --warning               Print only warnings and errors
  -v, --verbose               Print various debugging information
  -g, --get-urls              Print URLs instead of downloading
  -G, --resolve-urls          Print URLs instead of downloading; resolve
                              intermediary URLs
  -j, --dump-json             Print JSON information
  -J, --resolve-json          Print JSON information; resolve intermediary
                              URLs
  -s, --simulate              Simulate data extraction; do not download
                              anything
  -E, --extractor-info        Print extractor defaults and settings
  -K, --list-keywords         Print a list of available keywords and example
                              values for the given URLs
  -e, --error-file FILE       Add input URLs which returned an error to FILE
  -N, --print [EVENT:]FORMAT  Write FORMAT during EVENT (default 'prepare') to
                              standard output. Examples: 'id' or
                              'post:{md5[:8]}'
  --print-to-file [EVENT:]FORMAT FILE
                              Append FORMAT during EVENT to FILE
  --list-modules              Print a list of available extractor modules
  --list-extractors CATEGORIES
                              Print a list of extractor classes with
                              description, (sub)category and example URL
  --write-log FILE            Write logging output to FILE
  --write-unsupported FILE    Write URLs, which get emitted by other
                              extractors but cannot be handled, to FILE
  --write-pages               Write downloaded intermediary pages to files in
                              the current directory to debug problems
  --print-traffic             Display sent and read HTTP traffic
  --no-colors                 Do not emit ANSI color codes in output

Networking Options:
  -R, --retries N             Maximum number of retries for failed HTTP
                              requests or -1 for infinite retries (default: 4)
  --http-timeout SECONDS      Timeout for HTTP connections (default: 30.0)
  --proxy URL                 Use the specified proxy
  --source-address IP         Client-side IP address to bind to
  -4, --force-ipv4            Make all connections via IPv4
  -6, --force-ipv6            Make all connections via IPv6
  --no-check-certificate      Disable HTTPS certificate validation

Downloader Options:
  -r, --limit-rate RATE       Maximum download rate (e.g. 500k or 2.5M)
  --chunk-size SIZE           Size of in-memory data chunks (default: 32k)
  --sleep SECONDS             Number of seconds to wait before each download.
                              This can be either a constant value or a range
                              (e.g. 2.7 or 2.0-3.5)
  --sleep-request SECONDS     Number of seconds to wait between HTTP requests
                              during data extraction
  --sleep-extractor SECONDS   Number of seconds to wait before starting data
                              extraction for an input URL
  --no-part                   Do not use .part files
  --no-skip                   Do not skip downloads; overwrite existing files
  --no-mtime                  Do not set file modification times according to
                              Last-Modified HTTP response headers
  --no-download               Do not download any files

Configuration Options:
  -o, --option KEY=VALUE      Additional options. Example: -o browser=firefox
  -c, --config FILE           Additional configuration files
  --config-yaml FILE          Additional configuration files in YAML format
  --config-toml FILE          Additional configuration files in TOML format
  --config-create             Create a basic configuration file
  --config-status             Show configuration file status
  --config-open               Open configuration file in external application
  --config-ignore             Do not read default configuration files

Authentication Options:
  -u, --username USER         Username to login with
  -p, --password PASS         Password belonging to the given username
  --netrc                     Enable .netrc authentication data

Cookie Options:
  -C, --cookies FILE          File to load additional cookies from
  --cookies-export FILE       Export session cookies to FILE
  --cookies-from-browser BROWSER[/DOMAIN][+KEYRING][:PROFILE][::CONTAINER]
                              Name of the browser to load cookies from, with
                              optional domain prefixed with '/', keyring name
                              prefixed with '+', profile prefixed with ':',
                              and container prefixed with '::' ('none' for no
                              container (default), 'all' for all containers)

Selection Options:
  -A, --abort N               Stop current extractor run after N consecutive
                              file downloads were skipped
  -T, --terminate N           Stop current and parent extractor runs after N
                              consecutive file downloads were skipped
  --filesize-min SIZE         Do not download files smaller than SIZE (e.g.
                              500k or 2.5M)
  --filesize-max SIZE         Do not download files larger than SIZE (e.g.
                              500k or 2.5M)
  --download-archive FILE     Record all downloaded or skipped files in FILE
                              and skip downloading any file already in it
  --range RANGE               Index range(s) specifying which files to
                              download. These can be either a constant value,
                              range, or slice (e.g. '5', '8-20', or '1:24:3')
  --chapter-range RANGE       Like '--range', but applies to manga chapters
                              and other delegated URLs
  --filter EXPR               Python expression controlling which files to
                              download. Files for which the expression
                              evaluates to False are ignored. Available keys
                              are the filename-specific ones listed by '-K'.
                              Example: --filter "image_width >= 1000 and
                              rating in ('s', 'q')"
  --chapter-filter EXPR       Like '--filter', but applies to manga chapters
                              and other delegated URLs

Post-processing Options:
  -P, --postprocessor NAME    Activate the specified post processor
  --no-postprocessors         Do not run any post processors
  -O, --postprocessor-option KEY=VALUE
                              Additional post processor options
  --write-metadata            Write metadata to separate JSON files
  --write-info-json           Write gallery metadata to a info.json file
  --write-tags                Write image tags to separate text files
  --zip                       Store downloaded files in a ZIP archive
  --cbz                       Store downloaded files in a CBZ archive
  --mtime NAME                Set file modification times according to
                              metadata selected by NAME. Examples: 'date' or
                              'status[date]'
  --rename FORMAT             Rename previously downloaded files from FORMAT
                              to the current filename format
  --rename-to FORMAT          Rename previously downloaded files from the
                              current filename format to FORMAT
  --ugoira FMT                Convert Pixiv Ugoira to FMT using FFmpeg.
                              Supported formats are 'webm', 'mp4', 'gif',
                              'vp8', 'vp9', 'vp9-lossless', 'copy', 'zip'.
  --exec CMD                  Execute CMD for each downloaded file. Supported
                              replacement fields are {} or {_path},
                              {_directory}, {_filename}. Example: --exec
                              "convert {} {}.png && rm {}"
  --exec-after CMD            Execute CMD after all files were downloaded.
                              Example: --exec-after "cd {_directory} &&
                              convert * ../doc.pdf"
```

```nix tangle:default.nix
      "gallery-dl"
```

## nyaa

A tui tool for browsing and downloading torrents
[github](https://github.com/Beastwick18/nyaa)

```nix tangle:default.nix
      "nyaa"
```

## raw_novel_illustrations

Download novel illust

```nix tangle:default.nix
      "raw_novel_illustrations"
```

## transmission

Fast, easy and free BitTorrent client
[official site](http://www.transmissionbt.com/)
`$ transmission-cli --help`

```
transmission-cli 4.0.6 (0)
A fast and easy BitTorrent client

Usage: transmission-cli [options] <file|url|magnet>

Options:
 -h  --help                               Display this help page and exit
 -b  --blocklist                          Enable peer blocklists
 -B  --no-blocklist                       Disable peer blocklists
 -d  --downlimit            <speed>       Set max download speed in kB/s
 -D  --no-downlimit                       Don't limit the download speed
 -er --encryption-required                Encrypt all peer connections
 -ep --encryption-preferred               Prefer encrypted peer connections
 -et --encryption-tolerated               Prefer unencrypted peer connections
 -f  --finish               <script>      Run a script when the torrent finishes
 -g  --config-dir           <path>        Where to find configuration files
 -m  --portmap                            Enable portmapping via NAT-PMP or UPnP
 -M  --no-portmap                         Disable portmapping
 -p  --port                 <port>        Port for incoming peers (Default:
                                          51413)
 -t  --tos                  <dscp-or-tos> Peer socket DSCP / ToS setting
                                          (number, or a DSCP string, e.g.
                                          'af11' or 'cs0', default=le)
 -u  --uplimit              <speed>       Set max upload speed in kB/s
 -U  --no-uplimit                         Don't limit the upload speed
 -v  --verify                             Verify the specified torrent
 -V  --version                            Show version number and exit
 -w  --download-dir         <path>        Where to save downloaded data
```

```nix tangle:default.nix
      "transmission"
```

## yt-dlp

Command-line tool to download videos from YouTube.com and other sites (youtube-dl fork)
[github](https://github.com/yt-dlp/yt-dlp/)
`$ yt-dlp --help`

```
Usage: yt-dlp [OPTIONS] URL [URL...]

Options:
  General Options:
    -h, --help                      Print this help text and exit
    --version                       Print program version and exit
    -U, --update                    Check if updates are available. You
                                    installed yt-dlp with pip or using the wheel
                                    from PyPi; Use that to update
    --no-update                     Do not check for updates (default)
    --update-to [CHANNEL]@[TAG]     Upgrade/downgrade to a specific version.
                                    CHANNEL can be a repository as well. CHANNEL
                                    and TAG default to "stable" and "latest"
                                    respectively if omitted; See "UPDATE" for
                                    details. Supported channels: stable,
                                    nightly, master
    -i, --ignore-errors             Ignore download and postprocessing errors.
                                    The download will be considered successful
                                    even if the postprocessing fails
    --no-abort-on-error             Continue with next video on download errors;
                                    e.g. to skip unavailable videos in a
                                    playlist (default)
    --abort-on-error                Abort downloading of further videos if an
                                    error occurs (Alias: --no-ignore-errors)
    --dump-user-agent               Display the current user-agent and exit
    --list-extractors               List all supported extractors and exit
    --extractor-descriptions        Output descriptions of all supported
                                    extractors and exit
    --use-extractors NAMES          Extractor names to use separated by commas.
                                    You can also use regexes, "all", "default"
                                    and "end" (end URL matching); e.g. --ies
                                    "holodex.*,end,youtube". Prefix the name
                                    with a "-" to exclude it, e.g. --ies
                                    default,-generic. Use --list-extractors for
                                    a list of extractor names. (Alias: --ies)
    --default-search PREFIX         Use this prefix for unqualified URLs. E.g.
                                    "gvsearch2:python" downloads two videos from
                                    google videos for the search term "python".
                                    Use the value "auto" to let yt-dlp guess
                                    ("auto_warning" to emit a warning when
                                    guessing). "error" just throws an error. The
                                    default value "fixup_error" repairs broken
                                    URLs, but emits an error if this is not
                                    possible instead of searching
    --ignore-config                 Don't load any more configuration files
                                    except those given to --config-locations.
                                    For backward compatibility, if this option
                                    is found inside the system configuration
                                    file, the user configuration is not loaded.
                                    (Alias: --no-config)
    --no-config-locations           Do not load any custom configuration files
                                    (default). When given inside a configuration
                                    file, ignore all previous --config-locations
                                    defined in the current file
    --config-locations PATH         Location of the main configuration file;
                                    either the path to the config or its
                                    containing directory ("-" for stdin). Can be
                                    used multiple times and inside other
                                    configuration files
    --plugin-dirs PATH              Path to an additional directory to search
                                    for plugins. This option can be used
                                    multiple times to add multiple directories.
                                    Note that this currently only works for
                                    extractor plugins; postprocessor plugins can
                                    only be loaded from the default plugin
                                    directories
    --flat-playlist                 Do not extract a playlist's URL result
                                    entries; some entry metadata may be missing
                                    and downloading may be bypassed
    --no-flat-playlist              Fully extract the videos of a playlist
                                    (default)
    --live-from-start               Download livestreams from the start.
                                    Currently only supported for YouTube
                                    (Experimental)
    --no-live-from-start            Download livestreams from the current time
                                    (default)
    --wait-for-video MIN[-MAX]      Wait for scheduled streams to become
                                    available. Pass the minimum number of
                                    seconds (or range) to wait between retries
    --no-wait-for-video             Do not wait for scheduled streams (default)
    --mark-watched                  Mark videos watched (even with --simulate)
    --no-mark-watched               Do not mark videos watched (default)
    --color [STREAM:]POLICY         Whether to emit color codes in output,
                                    optionally prefixed by the STREAM (stdout or
                                    stderr) to apply the setting to. Can be one
                                    of "always", "auto" (default), "never", or
                                    "no_color" (use non color terminal
                                    sequences). Use "auto-tty" or "no_color-tty"
                                    to decide based on terminal support only.
                                    Can be used multiple times
    --compat-options OPTS           Options that can help keep compatibility
                                    with youtube-dl or youtube-dlc
                                    configurations by reverting some of the
                                    changes made in yt-dlp. See "Differences in
                                    default behavior" for details
    --alias ALIASES OPTIONS         Create aliases for an option string. Unless
                                    an alias starts with a dash "-", it is
                                    prefixed with "--". Arguments are parsed
                                    according to the Python string formatting
                                    mini-language. E.g. --alias get-audio,-X
                                    "-S=aext:{0},abr -x --audio-format {0}"
                                    creates options "--get-audio" and "-X" that
                                    takes an argument (ARG0) and expands to
                                    "-S=aext:ARG0,abr -x --audio-format ARG0".
                                    All defined aliases are listed in the --help
                                    output. Alias options can trigger more
                                    aliases; so be careful to avoid defining
                                    recursive options. As a safety measure, each
                                    alias may be triggered a maximum of 100
                                    times. This option can be used multiple
                                    times

  Network Options:
    --proxy URL                     Use the specified HTTP/HTTPS/SOCKS proxy. To
                                    enable SOCKS proxy, specify a proper scheme,
                                    e.g. socks5://user:pass@127.0.0.1:1080/.
                                    Pass in an empty string (--proxy "") for
                                    direct connection
    --socket-timeout SECONDS        Time to wait before giving up, in seconds
    --source-address IP             Client-side IP address to bind to
    --impersonate CLIENT[:OS]       Client to impersonate for requests. E.g.
                                    chrome, chrome-110, chrome:windows-10. Pass
                                    --impersonate="" to impersonate any client.
                                    Note that forcing impersonation for all
                                    requests may have a detrimental impact on
                                    download speed and stability
    --list-impersonate-targets      List available clients to impersonate.
    -4, --force-ipv4                Make all connections via IPv4
    -6, --force-ipv6                Make all connections via IPv6
    --enable-file-urls              Enable file:// URLs. This is disabled by
                                    default for security reasons.

  Geo-restriction:
    --geo-verification-proxy URL    Use this proxy to verify the IP address for
                                    some geo-restricted sites. The default proxy
                                    specified by --proxy (or none, if the option
                                    is not present) is used for the actual
                                    downloading
    --xff VALUE                     How to fake X-Forwarded-For HTTP header to
                                    try bypassing geographic restriction. One of
                                    "default" (only when known to be useful),
                                    "never", an IP block in CIDR notation, or a
                                    two-letter ISO 3166-2 country code

  Video Selection:
    -I, --playlist-items ITEM_SPEC  Comma separated playlist_index of the items
                                    to download. You can specify a range using
                                    "[START]:[STOP][:STEP]". For backward
                                    compatibility, START-STOP is also supported.
                                    Use negative indices to count from the right
                                    and negative STEP to download in reverse
                                    order. E.g. "-I 1:3,7,-5::2" used on a
                                    playlist of size 15 will download the items
                                    at index 1,2,3,7,11,13,15
    --min-filesize SIZE             Abort download if filesize is smaller than
                                    SIZE, e.g. 50k or 44.6M
    --max-filesize SIZE             Abort download if filesize is larger than
                                    SIZE, e.g. 50k or 44.6M
    --date DATE                     Download only videos uploaded on this date.
                                    The date can be "YYYYMMDD" or in the format
                                    [now|today|yesterday][-
                                    N[day|week|month|year]]. E.g. "--date
                                    today-2weeks" downloads only videos uploaded
                                    on the same day two weeks ago
    --datebefore DATE               Download only videos uploaded on or before
                                    this date. The date formats accepted are the
                                    same as --date
    --dateafter DATE                Download only videos uploaded on or after
                                    this date. The date formats accepted are the
                                    same as --date
    --match-filters FILTER          Generic video filter. Any "OUTPUT TEMPLATE"
                                    field can be compared with a number or a
                                    string using the operators defined in
                                    "Filtering Formats". You can also simply
                                    specify a field to match if the field is
                                    present, use "!field" to check if the field
                                    is not present, and "&" to check multiple
                                    conditions. Use a "\" to escape "&" or
                                    quotes if needed. If used multiple times,
                                    the filter matches if at least one of the
                                    conditions is met. E.g. --match-filters
                                    !is_live --match-filters "like_count>?100 &
                                    description~='(?i)\bcats \& dogs\b'" matches
                                    only videos that are not live OR those that
                                    have a like count more than 100 (or the like
                                    field is not available) and also has a
                                    description that contains the phrase "cats &
                                    dogs" (caseless). Use "--match-filters -" to
                                    interactively ask whether to download each
                                    video
    --no-match-filters              Do not use any --match-filters (default)
    --break-match-filters FILTER    Same as "--match-filters" but stops the
                                    download process when a video is rejected
    --no-break-match-filters        Do not use any --break-match-filters
                                    (default)
    --no-playlist                   Download only the video, if the URL refers
                                    to a video and a playlist
    --yes-playlist                  Download the playlist, if the URL refers to
                                    a video and a playlist
    --age-limit YEARS               Download only videos suitable for the given
                                    age
    --download-archive FILE         Download only videos not listed in the
                                    archive file. Record the IDs of all
                                    downloaded videos in it
    --no-download-archive           Do not use archive file (default)
    --max-downloads NUMBER          Abort after downloading NUMBER files
    --break-on-existing             Stop the download process when encountering
                                    a file that is in the archive supplied with
                                    the --download-archive option
    --no-break-on-existing          Do not stop the download process when
                                    encountering a file that is in the archive
                                    (default)
    --break-per-input               Alters --max-downloads, --break-on-existing,
                                    --break-match-filters, and autonumber to
                                    reset per input URL
    --no-break-per-input            --break-on-existing and similar options
                                    terminates the entire download queue
    --skip-playlist-after-errors N  Number of allowed failures until the rest of
                                    the playlist is skipped

  Download Options:
    -N, --concurrent-fragments N    Number of fragments of a dash/hlsnative
                                    video that should be downloaded concurrently
                                    (default is 1)
    -r, --limit-rate RATE           Maximum download rate in bytes per second,
                                    e.g. 50K or 4.2M
    --throttled-rate RATE           Minimum download rate in bytes per second
                                    below which throttling is assumed and the
                                    video data is re-extracted, e.g. 100K
    -R, --retries RETRIES           Number of retries (default is 10), or
                                    "infinite"
    --file-access-retries RETRIES   Number of times to retry on file access
                                    error (default is 3), or "infinite"
    --fragment-retries RETRIES      Number of retries for a fragment (default is
                                    10), or "infinite" (DASH, hlsnative and ISM)
    --retry-sleep [TYPE:]EXPR       Time to sleep between retries in seconds
                                    (optionally) prefixed by the type of retry
                                    (http (default), fragment, file_access,
                                    extractor) to apply the sleep to. EXPR can
                                    be a number, linear=START[:END[:STEP=1]] or
                                    exp=START[:END[:BASE=2]]. This option can be
                                    used multiple times to set the sleep for the
                                    different retry types, e.g. --retry-sleep
                                    linear=1::2 --retry-sleep fragment:exp=1:20
    --skip-unavailable-fragments    Skip unavailable fragments for DASH,
                                    hlsnative and ISM downloads (default)
                                    (Alias: --no-abort-on-unavailable-fragments)
    --abort-on-unavailable-fragments
                                    Abort download if a fragment is unavailable
                                    (Alias: --no-skip-unavailable-fragments)
    --keep-fragments                Keep downloaded fragments on disk after
                                    downloading is finished
    --no-keep-fragments             Delete downloaded fragments after
                                    downloading is finished (default)
    --buffer-size SIZE              Size of download buffer, e.g. 1024 or 16K
                                    (default is 1024)
    --resize-buffer                 The buffer size is automatically resized
                                    from an initial value of --buffer-size
                                    (default)
    --no-resize-buffer              Do not automatically adjust the buffer size
    --http-chunk-size SIZE          Size of a chunk for chunk-based HTTP
                                    downloading, e.g. 10485760 or 10M (default
                                    is disabled). May be useful for bypassing
                                    bandwidth throttling imposed by a webserver
                                    (experimental)
    --playlist-random               Download playlist videos in random order
    --lazy-playlist                 Process entries in the playlist as they are
                                    received. This disables n_entries,
                                    --playlist-random and --playlist-reverse
    --no-lazy-playlist              Process videos in the playlist only after
                                    the entire playlist is parsed (default)
    --xattr-set-filesize            Set file xattribute ytdl.filesize with
                                    expected file size
    --hls-use-mpegts                Use the mpegts container for HLS videos;
                                    allowing some players to play the video
                                    while downloading, and reducing the chance
                                    of file corruption if download is
                                    interrupted. This is enabled by default for
                                    live streams
    --no-hls-use-mpegts             Do not use the mpegts container for HLS
                                    videos. This is default when not downloading
                                    live streams
    --download-sections REGEX       Download only chapters that match the
                                    regular expression. A "*" prefix denotes
                                    time-range instead of chapter. Negative
                                    timestamps are calculated from the end.
                                    "*from-url" can be used to download between
                                    the "start_time" and "end_time" extracted
                                    from the URL. Needs ffmpeg. This option can
                                    be used multiple times to download multiple
                                    sections, e.g. --download-sections
                                    "*10:15-inf" --download-sections "intro"
    --downloader [PROTO:]NAME       Name or path of the external downloader to
                                    use (optionally) prefixed by the protocols
                                    (http, ftp, m3u8, dash, rstp, rtmp, mms) to
                                    use it for. Currently supports native,
                                    aria2c, avconv, axel, curl, ffmpeg, httpie,
                                    wget. You can use this option multiple times
                                    to set different downloaders for different
                                    protocols. E.g. --downloader aria2c
                                    --downloader "dash,m3u8:native" will use
                                    aria2c for http/ftp downloads, and the
                                    native downloader for dash/m3u8 downloads
                                    (Alias: --external-downloader)
    --downloader-args NAME:ARGS     Give these arguments to the external
                                    downloader. Specify the downloader name and
                                    the arguments separated by a colon ":". For
                                    ffmpeg, arguments can be passed to different
                                    positions using the same syntax as
                                    --postprocessor-args. You can use this
                                    option multiple times to give different
                                    arguments to different downloaders (Alias:
                                    --external-downloader-args)

  Filesystem Options:
    -a, --batch-file FILE           File containing URLs to download ("-" for
                                    stdin), one URL per line. Lines starting
                                    with "#", ";" or "]" are considered as
                                    comments and ignored
    --no-batch-file                 Do not read URLs from batch file (default)
    -P, --paths [TYPES:]PATH        The paths where the files should be
                                    downloaded. Specify the type of file and the
                                    path separated by a colon ":". All the same
                                    TYPES as --output are supported.
                                    Additionally, you can also provide "home"
                                    (default) and "temp" paths. All intermediary
                                    files are first downloaded to the temp path
                                    and then the final files are moved over to
                                    the home path after download is finished.
                                    This option is ignored if --output is an
                                    absolute path
    -o, --output [TYPES:]TEMPLATE   Output filename template; see "OUTPUT
                                    TEMPLATE" for details
    --output-na-placeholder TEXT    Placeholder for unavailable fields in
                                    --output (default: "NA")
    --restrict-filenames            Restrict filenames to only ASCII characters,
                                    and avoid "&" and spaces in filenames
    --no-restrict-filenames         Allow Unicode characters, "&" and spaces in
                                    filenames (default)
    --windows-filenames             Force filenames to be Windows-compatible
    --no-windows-filenames          Sanitize filenames only minimally
    --trim-filenames LENGTH         Limit the filename length (excluding
                                    extension) to the specified number of
                                    characters
    -w, --no-overwrites             Do not overwrite any files
    --force-overwrites              Overwrite all video and metadata files. This
                                    option includes --no-continue
    --no-force-overwrites           Do not overwrite the video, but overwrite
                                    related files (default)
    -c, --continue                  Resume partially downloaded files/fragments
                                    (default)
    --no-continue                   Do not resume partially downloaded
                                    fragments. If the file is not fragmented,
                                    restart download of the entire file
    --part                          Use .part files instead of writing directly
                                    into output file (default)
    --no-part                       Do not use .part files - write directly into
                                    output file
    --mtime                         Use the Last-modified header to set the file
                                    modification time (default)
    --no-mtime                      Do not use the Last-modified header to set
                                    the file modification time
    --write-description             Write video description to a .description
                                    file
    --no-write-description          Do not write video description (default)
    --write-info-json               Write video metadata to a .info.json file
                                    (this may contain personal information)
    --no-write-info-json            Do not write video metadata (default)
    --write-playlist-metafiles      Write playlist metadata in addition to the
                                    video metadata when using --write-info-json,
                                    --write-description etc. (default)
    --no-write-playlist-metafiles   Do not write playlist metadata when using
                                    --write-info-json, --write-description etc.
    --clean-info-json               Remove some internal metadata such as
                                    filenames from the infojson (default)
    --no-clean-info-json            Write all fields to the infojson
    --write-comments                Retrieve video comments to be placed in the
                                    infojson. The comments are fetched even
                                    without this option if the extraction is
                                    known to be quick (Alias: --get-comments)
    --no-write-comments             Do not retrieve video comments unless the
                                    extraction is known to be quick (Alias:
                                    --no-get-comments)
    --load-info-json FILE           JSON file containing the video information
                                    (created with the "--write-info-json"
                                    option)
    --cookies FILE                  Netscape formatted file to read cookies from
                                    and dump cookie jar in
    --no-cookies                    Do not read/dump cookies from/to file
                                    (default)
    --cookies-from-browser BROWSER[+KEYRING][:PROFILE][::CONTAINER]
                                    The name of the browser to load cookies
                                    from. Currently supported browsers are:
                                    brave, chrome, chromium, edge, firefox,
                                    opera, safari, vivaldi, whale. Optionally,
                                    the KEYRING used for decrypting Chromium
                                    cookies on Linux, the name/path of the
                                    PROFILE to load cookies from, and the
                                    CONTAINER name (if Firefox) ("none" for no
                                    container) can be given with their
                                    respective separators. By default, all
                                    containers of the most recently accessed
                                    profile are used. Currently supported
                                    keyrings are: basictext, gnomekeyring,
                                    kwallet, kwallet5, kwallet6
    --no-cookies-from-browser       Do not load cookies from browser (default)
    --cache-dir DIR                 Location in the filesystem where yt-dlp can
                                    store some downloaded information (such as
                                    client ids and signatures) permanently. By
                                    default ${XDG_CACHE_HOME}/yt-dlp
    --no-cache-dir                  Disable filesystem caching
    --rm-cache-dir                  Delete all filesystem cache files

  Thumbnail Options:
    --write-thumbnail               Write thumbnail image to disk
    --no-write-thumbnail            Do not write thumbnail image to disk
                                    (default)
    --write-all-thumbnails          Write all thumbnail image formats to disk
    --list-thumbnails               List available thumbnails of each video.
                                    Simulate unless --no-simulate is used

  Internet Shortcut Options:
    --write-link                    Write an internet shortcut file, depending
                                    on the current platform (.url, .webloc or
                                    .desktop). The URL may be cached by the OS
    --write-url-link                Write a .url Windows internet shortcut. The
                                    OS caches the URL based on the file path
    --write-webloc-link             Write a .webloc macOS internet shortcut
    --write-desktop-link            Write a .desktop Linux internet shortcut

  Verbosity and Simulation Options:
    -q, --quiet                     Activate quiet mode. If used with --verbose,
                                    print the log to stderr
    --no-quiet                      Deactivate quiet mode. (Default)
    --no-warnings                   Ignore warnings
    -s, --simulate                  Do not download the video and do not write
                                    anything to disk
    --no-simulate                   Download the video even if printing/listing
                                    options are used
    --ignore-no-formats-error       Ignore "No video formats" error. Useful for
                                    extracting metadata even if the videos are
                                    not actually available for download
                                    (experimental)
    --no-ignore-no-formats-error    Throw error when no downloadable video
                                    formats are found (default)
    --skip-download                 Do not download the video but write all
                                    related files (Alias: --no-download)
    -O, --print [WHEN:]TEMPLATE     Field name or output template to print to
                                    screen, optionally prefixed with when to
                                    print it, separated by a ":". Supported
                                    values of "WHEN" are the same as that of
                                    --use-postprocessor (default: video).
                                    Implies --quiet. Implies --simulate unless
                                    --no-simulate or later stages of WHEN are
                                    used. This option can be used multiple times
    --print-to-file [WHEN:]TEMPLATE FILE
                                    Append given template to the file. The
                                    values of WHEN and TEMPLATE are the same as
                                    that of --print. FILE uses the same syntax
                                    as the output template. This option can be
                                    used multiple times
    -j, --dump-json                 Quiet, but print JSON information for each
                                    video. Simulate unless --no-simulate is
                                    used. See "OUTPUT TEMPLATE" for a
                                    description of available keys
    -J, --dump-single-json          Quiet, but print JSON information for each
                                    URL or infojson passed. Simulate unless
                                    --no-simulate is used. If the URL refers to
                                    a playlist, the whole playlist information
                                    is dumped in a single line
    --force-write-archive           Force download archive entries to be written
                                    as far as no errors occur, even if -s or
                                    another simulation option is used (Alias:
                                    --force-download-archive)
    --newline                       Output progress bar as new lines
    --no-progress                   Do not print progress bar
    --progress                      Show progress bar, even if in quiet mode
    --console-title                 Display progress in console titlebar
    --progress-template [TYPES:]TEMPLATE
                                    Template for progress outputs, optionally
                                    prefixed with one of "download:" (default),
                                    "download-title:" (the console title),
                                    "postprocess:",  or "postprocess-title:".
                                    The video's fields are accessible under the
                                    "info" key and the progress attributes are
                                    accessible under "progress" key. E.g.
                                    --console-title --progress-template
                                    "download-
                                    title:%(info.id)s-%(progress.eta)s"
    --progress-delta SECONDS        Time between progress output (default: 0)
    -v, --verbose                   Print various debugging information
    --dump-pages                    Print downloaded pages encoded using base64
                                    to debug problems (very verbose)
    --write-pages                   Write downloaded intermediary pages to files
                                    in the current directory to debug problems
    --print-traffic                 Display sent and read HTTP traffic

  Workarounds:
    --encoding ENCODING             Force the specified encoding (experimental)
    --legacy-server-connect         Explicitly allow HTTPS connection to servers
                                    that do not support RFC 5746 secure
                                    renegotiation
    --no-check-certificates         Suppress HTTPS certificate validation
    --prefer-insecure               Use an unencrypted connection to retrieve
                                    information about the video (Currently
                                    supported only for YouTube)
    --add-headers FIELD:VALUE       Specify a custom HTTP header and its value,
                                    separated by a colon ":". You can use this
                                    option multiple times
    --bidi-workaround               Work around terminals that lack
                                    bidirectional text support. Requires bidiv
                                    or fribidi executable in PATH
    --sleep-requests SECONDS        Number of seconds to sleep between requests
                                    during data extraction
    --sleep-interval SECONDS        Number of seconds to sleep before each
                                    download. This is the minimum time to sleep
                                    when used along with --max-sleep-interval
                                    (Alias: --min-sleep-interval)
    --max-sleep-interval SECONDS    Maximum number of seconds to sleep. Can only
                                    be used along with --min-sleep-interval
    --sleep-subtitles SECONDS       Number of seconds to sleep before each
                                    subtitle download

  Video Format Options:
    -f, --format FORMAT             Video format code, see "FORMAT SELECTION"
                                    for more details
    -S, --format-sort SORTORDER     Sort the formats by the fields given, see
                                    "Sorting Formats" for more details
    --format-sort-force             Force user specified sort order to have
                                    precedence over all fields, see "Sorting
                                    Formats" for more details (Alias: --S-force)
    --no-format-sort-force          Some fields have precedence over the user
                                    specified sort order (default)
    --video-multistreams            Allow multiple video streams to be merged
                                    into a single file
    --no-video-multistreams         Only one video stream is downloaded for each
                                    output file (default)
    --audio-multistreams            Allow multiple audio streams to be merged
                                    into a single file
    --no-audio-multistreams         Only one audio stream is downloaded for each
                                    output file (default)
    --prefer-free-formats           Prefer video formats with free containers
                                    over non-free ones of the same quality. Use
                                    with "-S ext" to strictly prefer free
                                    containers irrespective of quality
    --no-prefer-free-formats        Don't give any special preference to free
                                    containers (default)
    --check-formats                 Make sure formats are selected only from
                                    those that are actually downloadable
    --check-all-formats             Check all formats for whether they are
                                    actually downloadable
    --no-check-formats              Do not check that the formats are actually
                                    downloadable
    -F, --list-formats              List available formats of each video.
                                    Simulate unless --no-simulate is used
    --merge-output-format FORMAT    Containers that may be used when merging
                                    formats, separated by "/", e.g. "mp4/mkv".
                                    Ignored if no merge is required. (currently
                                    supported: avi, flv, mkv, mov, mp4, webm)

  Subtitle Options:
    --write-subs                    Write subtitle file
    --no-write-subs                 Do not write subtitle file (default)
    --write-auto-subs               Write automatically generated subtitle file
                                    (Alias: --write-automatic-subs)
    --no-write-auto-subs            Do not write auto-generated subtitles
                                    (default) (Alias: --no-write-automatic-subs)
    --list-subs                     List available subtitles of each video.
                                    Simulate unless --no-simulate is used
    --sub-format FORMAT             Subtitle format; accepts formats preference
                                    separated by "/", e.g. "srt" or
                                    "ass/srt/best"
    --sub-langs LANGS               Languages of the subtitles to download (can
                                    be regex) or "all" separated by commas, e.g.
                                    --sub-langs "en.*,ja" (where "en.*" is a
                                    regex pattern that matches "en" followed by
                                    0 or more of any character). You can prefix
                                    the language code with a "-" to exclude it
                                    from the requested languages, e.g. --sub-
                                    langs all,-live_chat. Use --list-subs for a
                                    list of available language tags

  Authentication Options:
    -u, --username USERNAME         Login with this account ID
    -p, --password PASSWORD         Account password. If this option is left
                                    out, yt-dlp will ask interactively
    -2, --twofactor TWOFACTOR       Two-factor authentication code
    -n, --netrc                     Use .netrc authentication data
    --netrc-location PATH           Location of .netrc authentication data;
                                    either the path or its containing directory.
                                    Defaults to ~/.netrc
    --netrc-cmd NETRC_CMD           Command to execute to get the credentials
                                    for an extractor.
    --video-password PASSWORD       Video-specific password
    --ap-mso MSO                    Adobe Pass multiple-system operator (TV
                                    provider) identifier, use --ap-list-mso for
                                    a list of available MSOs
    --ap-username USERNAME          Multiple-system operator account login
    --ap-password PASSWORD          Multiple-system operator account password.
                                    If this option is left out, yt-dlp will ask
                                    interactively
    --ap-list-mso                   List all supported multiple-system operators
    --client-certificate CERTFILE   Path to client certificate file in PEM
                                    format. May include the private key
    --client-certificate-key KEYFILE
                                    Path to private key file for client
                                    certificate
    --client-certificate-password PASSWORD
                                    Password for client certificate private key,
                                    if encrypted. If not provided, and the key
                                    is encrypted, yt-dlp will ask interactively

  Post-Processing Options:
    -x, --extract-audio             Convert video files to audio-only files
                                    (requires ffmpeg and ffprobe)
    --audio-format FORMAT           Format to convert the audio to when -x is
                                    used. (currently supported: best (default),
                                    aac, alac, flac, m4a, mp3, opus, vorbis,
                                    wav). You can specify multiple rules using
                                    similar syntax as --remux-video
    --audio-quality QUALITY         Specify ffmpeg audio quality to use when
                                    converting the audio with -x. Insert a value
                                    between 0 (best) and 10 (worst) for VBR or a
                                    specific bitrate like 128K (default 5)
    --remux-video FORMAT            Remux the video into another container if
                                    necessary (currently supported: avi, flv,
                                    gif, mkv, mov, mp4, webm, aac, aiff, alac,
                                    flac, m4a, mka, mp3, ogg, opus, vorbis,
                                    wav). If the target container does not
                                    support the video/audio codec, remuxing will
                                    fail. You can specify multiple rules; e.g.
                                    "aac>m4a/mov>mp4/mkv" will remux aac to m4a,
                                    mov to mp4 and anything else to mkv
    --recode-video FORMAT           Re-encode the video into another format if
                                    necessary. The syntax and supported formats
                                    are the same as --remux-video
    --postprocessor-args NAME:ARGS  Give these arguments to the postprocessors.
                                    Specify the postprocessor/executable name
                                    and the arguments separated by a colon ":"
                                    to give the argument to the specified
                                    postprocessor/executable. Supported PP are:
                                    Merger, ModifyChapters, SplitChapters,
                                    ExtractAudio, VideoRemuxer, VideoConvertor,
                                    Metadata, EmbedSubtitle, EmbedThumbnail,
                                    SubtitlesConvertor, ThumbnailsConvertor,
                                    FixupStretched, FixupM4a, FixupM3u8,
                                    FixupTimestamp and FixupDuration. The
                                    supported executables are: AtomicParsley,
                                    FFmpeg and FFprobe. You can also specify
                                    "PP+EXE:ARGS" to give the arguments to the
                                    specified executable only when being used by
                                    the specified postprocessor. Additionally,
                                    for ffmpeg/ffprobe, "_i"/"_o" can be
                                    appended to the prefix optionally followed
                                    by a number to pass the argument before the
                                    specified input/output file, e.g. --ppa
                                    "Merger+ffmpeg_i1:-v quiet". You can use
                                    this option multiple times to give different
                                    arguments to different postprocessors.
                                    (Alias: --ppa)
    -k, --keep-video                Keep the intermediate video file on disk
                                    after post-processing
    --no-keep-video                 Delete the intermediate video file after
                                    post-processing (default)
    --post-overwrites               Overwrite post-processed files (default)
    --no-post-overwrites            Do not overwrite post-processed files
    --embed-subs                    Embed subtitles in the video (only for mp4,
                                    webm and mkv videos)
    --no-embed-subs                 Do not embed subtitles (default)
    --embed-thumbnail               Embed thumbnail in the video as cover art
    --no-embed-thumbnail            Do not embed thumbnail (default)
    --embed-metadata                Embed metadata to the video file. Also
                                    embeds chapters/infojson if present unless
                                    --no-embed-chapters/--no-embed-info-json are
                                    used (Alias: --add-metadata)
    --no-embed-metadata             Do not add metadata to file (default)
                                    (Alias: --no-add-metadata)
    --embed-chapters                Add chapter markers to the video file
                                    (Alias: --add-chapters)
    --no-embed-chapters             Do not add chapter markers (default) (Alias:
                                    --no-add-chapters)
    --embed-info-json               Embed the infojson as an attachment to
                                    mkv/mka video files
    --no-embed-info-json            Do not embed the infojson as an attachment
                                    to the video file
    --parse-metadata [WHEN:]FROM:TO
                                    Parse additional metadata like title/artist
                                    from other fields; see "MODIFYING METADATA"
                                    for details. Supported values of "WHEN" are
                                    the same as that of --use-postprocessor
                                    (default: pre_process)
    --replace-in-metadata [WHEN:]FIELDS REGEX REPLACE
                                    Replace text in a metadata field using the
                                    given regex. This option can be used
                                    multiple times. Supported values of "WHEN"
                                    are the same as that of --use-postprocessor
                                    (default: pre_process)
    --xattrs                        Write metadata to the video file's xattrs
                                    (using Dublin Core and XDG standards)
    --concat-playlist POLICY        Concatenate videos in a playlist. One of
                                    "never", "always", or "multi_video"
                                    (default; only when the videos form a single
                                    show). All the video files must have the
                                    same codecs and number of streams to be
                                    concatenable. The "pl_video:" prefix can be
                                    used with "--paths" and "--output" to set
                                    the output filename for the concatenated
                                    files. See "OUTPUT TEMPLATE" for details
    --fixup POLICY                  Automatically correct known faults of the
                                    file. One of never (do nothing), warn (only
                                    emit a warning), detect_or_warn (the
                                    default; fix the file if we can, warn
                                    otherwise), force (try fixing even if the
                                    file already exists)
    --ffmpeg-location PATH          Location of the ffmpeg binary; either the
                                    path to the binary or its containing
                                    directory
    --exec [WHEN:]CMD               Execute a command, optionally prefixed with
                                    when to execute it, separated by a ":".
                                    Supported values of "WHEN" are the same as
                                    that of --use-postprocessor (default:
                                    after_move). The same syntax as the output
                                    template can be used to pass any field as
                                    arguments to the command. If no fields are
                                    passed, %(filepath,_filename|)q is appended
                                    to the end of the command. This option can
                                    be used multiple times
    --no-exec                       Remove any previously defined --exec
    --convert-subs FORMAT           Convert the subtitles to another format
                                    (currently supported: ass, lrc, srt, vtt).
                                    Use "--convert-subs none" to disable
                                    conversion (default) (Alias: --convert-
                                    subtitles)
    --convert-thumbnails FORMAT     Convert the thumbnails to another format
                                    (currently supported: jpg, png, webp). You
                                    can specify multiple rules using similar
                                    syntax as "--remux-video". Use "--convert-
                                    thumbnails none" to disable conversion
                                    (default)
    --split-chapters                Split video into multiple files based on
                                    internal chapters. The "chapter:" prefix can
                                    be used with "--paths" and "--output" to set
                                    the output filename for the split files. See
                                    "OUTPUT TEMPLATE" for details
    --no-split-chapters             Do not split video based on chapters
                                    (default)
    --remove-chapters REGEX         Remove chapters whose title matches the
                                    given regular expression. The syntax is the
                                    same as --download-sections. This option can
                                    be used multiple times
    --no-remove-chapters            Do not remove any chapters from the file
                                    (default)
    --force-keyframes-at-cuts       Force keyframes at cuts when
                                    downloading/splitting/removing sections.
                                    This is slow due to needing a re-encode, but
                                    the resulting video may have fewer artifacts
                                    around the cuts
    --no-force-keyframes-at-cuts    Do not force keyframes around the chapters
                                    when cutting/splitting (default)
    --use-postprocessor NAME[:ARGS]
                                    The (case-sensitive) name of plugin
                                    postprocessors to be enabled, and
                                    (optionally) arguments to be passed to it,
                                    separated by a colon ":". ARGS are a
                                    semicolon ";" delimited list of NAME=VALUE.
                                    The "when" argument determines when the
                                    postprocessor is invoked. It can be one of
                                    "pre_process" (after video extraction),
                                    "after_filter" (after video passes filter),
                                    "video" (after --format; before
                                    --print/--output), "before_dl" (before each
                                    video download), "post_process" (after each
                                    video download; default), "after_move"
                                    (after moving the video file to its final
                                    location), "after_video" (after downloading
                                    and processing all formats of a video), or
                                    "playlist" (at end of playlist). This option
                                    can be used multiple times to add different
                                    postprocessors

  SponsorBlock Options:
    Make chapter entries for, or remove various segments (sponsor,
    introductions, etc.) from downloaded YouTube videos using the
    SponsorBlock API (https://sponsor.ajay.app)

    --sponsorblock-mark CATS        SponsorBlock categories to create chapters
                                    for, separated by commas. Available
                                    categories are sponsor, intro, outro,
                                    selfpromo, preview, filler, interaction,
                                    music_offtopic, poi_highlight, chapter, all
                                    and default (=all). You can prefix the
                                    category with a "-" to exclude it. See [1]
                                    for descriptions of the categories. E.g.
                                    --sponsorblock-mark all,-preview [1] https:/
                                    /wiki.sponsor.ajay.app/w/Segment_Categories
    --sponsorblock-remove CATS      SponsorBlock categories to be removed from
                                    the video file, separated by commas. If a
                                    category is present in both mark and remove,
                                    remove takes precedence. The syntax and
                                    available categories are the same as for
                                    --sponsorblock-mark except that "default"
                                    refers to "all,-filler" and poi_highlight,
                                    chapter are not available
    --sponsorblock-chapter-title TEMPLATE
                                    An output template for the title of the
                                    SponsorBlock chapters created by
                                    --sponsorblock-mark. The only available
                                    fields are start_time, end_time, category,
                                    categories, name, category_names. Defaults
                                    to "[SponsorBlock]: %(category_names)l"
    --no-sponsorblock               Disable both --sponsorblock-mark and
                                    --sponsorblock-remove
    --sponsorblock-api URL          SponsorBlock API location, defaults to
                                    https://sponsor.ajay.app

  Extractor Options:
    --extractor-retries RETRIES     Number of retries for known extractor errors
                                    (default is 3), or "infinite"
    --allow-dynamic-mpd             Process dynamic DASH manifests (default)
                                    (Alias: --no-ignore-dynamic-mpd)
    --ignore-dynamic-mpd            Do not process dynamic DASH manifests
                                    (Alias: --no-allow-dynamic-mpd)
    --hls-split-discontinuity       Split HLS playlists to different formats at
                                    discontinuities such as ad breaks
    --no-hls-split-discontinuity    Do not split HLS playlists into different
                                    formats at discontinuities such as ad breaks
                                    (default)
    --extractor-args IE_KEY:ARGS    Pass ARGS arguments to the IE_KEY extractor.
                                    See "EXTRACTOR ARGUMENTS" for details. You
                                    can use this option multiple times to give
                                    arguments for different extractors

See full documentation at  https://github.com/yt-dlp/yt-dlp#readme
```

```nix tangle:default.nix
      "yt-dlp"
      # keep-sorted end
    ];
  }
)
```
