vim9script

nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap g? <Plug>ZVOperator
# nmap <leader><leader>z <Plug>ZVKeyDocset

g:zv_file_types = {
    'scss': 'sass',
    'sh': 'bash',
    'tex': 'latex',
    'yaml.ansible': 'ansible',
}
