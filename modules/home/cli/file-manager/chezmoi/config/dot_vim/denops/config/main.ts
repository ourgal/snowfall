import * as fn from "https://deno.land/x/denops_std@v5.1.0/function/mod.ts";
// import * as mapping from "https://deno.land/x/denops_std@v5.1.0/mapping/mod.ts";
import {Denops} from "https://deno.land/x/denops_std@v5.1.0/mod.ts";
import {ensure, is} from "https://deno.land/x/unknownutil@v3.11.0/mod.ts";
// import {execute} from "https://deno.land/x/denops_std@v5.1.0/helper/mod.ts";
// import {globals} from "https://deno.land/x/denops_std@v5.1.0/variable/mod.ts";

import {Dvpm} from "https://deno.land/x/dvpm@3.6.0/mod.ts";

export async function main(denops: Denops): Promise<void> {
    const base_path = (await fn.has(denops, "nvim")) ? "~/.cache/nvim/dvpm" : "~/.cache/vim/dvpm";
    const base = ensure(await fn.expand(denops, base_path), is.String);

    const dvpm = await Dvpm.begin(denops, {base});
    const plugins = '~/.vim/plugins/'

    // theme
    await dvpm.add({url: "ghifarit53/tokyonight-vim", afterFile: plugins + "tokyonight_vim.vim"});

    // undo menu
    await dvpm.add({url: "mbbill/undotree", afterFile: plugins + "undotree.vim"});

    // auto session
    await dvpm.add({url: "thaerkh/vim-workspace", afterFile: plugins + "vim_workspace.vim"});

    // buftabline and statusline
    await dvpm.add({url: "vim-airline/vim-airline", beforeFile: plugins + "vim_airline.vim"});

    // auto pair
    await dvpm.add({url: "cohama/lexima.vim"});

    // comment
    await dvpm.add({url: "tyru/caw.vim", afterFile: plugins + "caw_vim.vim"});

    // column hint
    await dvpm.add({url: "mhinz/vim-signify"});

    // replace motion
    await dvpm.add({url: "svermeulen/vim-subversive", afterFile: plugins + "vim_subversive.vim"});

    await dvpm.add({url: "neoclide/coc.nvim", branch: "release", afterFile: plugins + "coc_nvim.vim"});

    // markdown format
    await dvpm.add({url: "hotoo/pangu.vim", afterFile: plugins + "pangu_vim.vim"});

    // c-a/c-x
    await dvpm.add({url: "z775729168/vim-cycle", afterFile: plugins + "vim_cycle.vim"});

    // terminal
    await dvpm.add({url: "voldikss/vim-floaterm", afterFile: plugins + "vim_floaterm.vim"});

    // textobj
    await dvpm.add({url: "wellle/targets.vim"});

    // rainbow brackets
    await dvpm.add({url: "luochen1990/rainbow", afterFile: plugins + "rainbow.vim"});

    // yank highlight
    await dvpm.add({url: "machakann/vim-highlightedyank"});

    // nocopy
    await dvpm.add({url: "svermeulen/vim-cutlass", afterFile: plugins + "vim_cutlass.vim"});

    await dvpm.add({url: "tpope/vim-fugitive"});

    // templates
    await dvpm.add({url: "tibabit/vim-templates", afterFile: plugins + "vim_cutlass.vim"});

    // markdown syntax
    await dvpm.add({url: "plasticboy/vim-markdown", dependencies: [{url: 'godlygeek/tabular'}]});

    // share codes
    await dvpm.add({url: "kristijanhusak/vim-carbon-now-sh"});
    await dvpm.add({url: "segeljakt/vim-silicon"});

    // dot
    await dvpm.add({url: "tpope/vim-repeat"});

    // cmd/search autocompletion
    await dvpm.add({url: "girishji/autosuggest.vim", afterFile: plugins + "autosuggest_vim.vim"});

    // cmd/search autocompletion
    await dvpm.add({url: "justinmk/vim-sneak", afterFile: plugins + "vim_sneak.vim"});

    await dvpm.add({url: "junegunn/fzf.vim"});

    await dvpm.add({url: "pearofducks/ansible-vim"});

    await dvpm.end();

    console.log("Load completed !");
}
