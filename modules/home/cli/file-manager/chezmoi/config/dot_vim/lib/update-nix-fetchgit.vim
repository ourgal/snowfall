vim9script
# A helper to preserve the cursor location with filters
def Preserve(command: string)
  const w = winsaveview()
  silent execute command
  winrestview(w)
enddef

export def Update(): void
    const cmd = $":%!update-nix-fetchgit --location={line(".")}:{col(".")}"
    Preserve(cmd)
    echow "Updating finished"
enddef
