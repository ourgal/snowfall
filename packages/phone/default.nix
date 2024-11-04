{
  pog,
  miniserve,
  kdeconnect,
  gopass,
  brotab,
  buku,
  ...
}:
pog.pog {
  name = "phone";
  version = "0.1.0";
  description = "A script for kde-connect-cli";

  flags = [
    {
      name = "clip";
      description = "share clipboard to device (default)";
      bool = true;
    }
    {
      name = "serve";
      argument = "dir";
      description = "start file server for device";
    }
    {
      name = "file";
      argument = "file";
      description = "share file to device";
    }
    {
      name = "url";
      argument = "url";
      description = "share url to device";
    }
    {
      name = "text";
      short = "";
      argument = "strings";
      description = "share text to device";
    }
    {
      name = "password";
      argument = "strings";
      description = "share gopass password to device";
    }
    {
      name = "tab";
      description = "share browser tab to device";
      bool = true;
    }
    {
      name = "bookmark";
      description = "share buku bookmark to device";
      bool = true;
    }
  ];

  runtimeInputs = [
    miniserve
    kdeconnect
    gopass
    brotab
    buku
  ];

  script =
    helpers: with helpers; ''
      chooseDevice() {
        declare -r devices=$(kdeconnect-cli --list-available --name-only)
        echo "$devices" | fzf
      }

      sendClipboard() {
        kdeconnect-cli --send-clipboard -n "$(chooseDevice)"
      }

      shareFilesOrURL() {
        kdeconnect-cli --share "$1" -n "$(chooseDevice)"
      }

      shareText() {
        kdeconnect-cli --share-text "$1" -n "$(chooseDevice)"
      }

      getIP() {
        ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
      }

      getPassword() {
        gopass show --password "$(gopass search "$1")"
      }

      getTab() {
        bt list | cut -f 3 | fzf
      }

      getBookmark() {
        declare -r id=$(buku --nc -p -f 3 | fzf | cut -f 1)
        buku --nc -p "$id" -f 10
      }

      if ${flag "serve"}; then
        shareFilesOrURL "$(getIP):8080"
        miniserve --dirs-first -upload-files --mkdir --hidden "$file"
      elif ${flag "file"}; then
        shareFilesOrURL "$file"
      elif ${flag "url"}; then
        shareFilesOrURL "$url"
      elif ${flag "text"}; then
        shareText "$text"
      elif ${flag "tab"}; then
        shareFilesOrURL "$(getTab)"
      elif ${flag "bookmark"}; then
        shareFilesOrURL "$(getBookmark)"
      elif ${flag "password"}; then
        shareText "$(getPassword "$text")"
      elif ${flag "clip"}; then
        sendClipboard
      else
        sendClipboard
      fi
    '';
}
