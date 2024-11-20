vim9script
import autoload '../lib/update-nix-fetchgit.vim' as lib

command UpdateNixFetchgit lib.Update()

autocmd FileType nix map <nowait> <silent> <leader>.u <ScriptCmd>UpdateNixFetchgit<CR>
