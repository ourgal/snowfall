vim9script

const lspOpts = {
           aleSupport: false,
           autoComplete: true,
           autoHighlight: false,
           autoHighlightDiags: true,
           autoPopulateDiags: false,
           completionMatcher: 'case',
           completionMatcherValue: 1,
           diagSignErrorText: 'E>',
           diagSignHintText: 'H>',
           diagSignInfoText: 'I>',
           diagSignWarningText: 'W>',
           echoSignature: false,
           hideDisabledCodeActions: false,
           highlightDiagInline: true,
           hoverInPreview: false,
           ignoreMissingServer: false,
           keepFocusInDiags: true,
           keepFocusInReferences: true,
           completionTextEdit: false,
           diagVirtualTextAlign: 'above',
           diagVirtualTextWrap: 'default',
           noNewlineInCompletion: false,
           omniComplete: null,
           outlineOnRight: false,
           outlineWinSize: 20,
           semanticHighlight: true,
           showDiagInBalloon: true,
           showDiagInPopup: true,
           showDiagOnStatusLine: false,
           showDiagWithSign: true,
           showDiagWithVirtualText: true,
           showInlayHints: true,
           showSignature: true,
           snippetSupport: false,
           ultisnipsSupport: false,
           useBufferCompletion: false,
           usePopupInCodeAction: false,
           useQuickfixForLocations: false,
           vsnipSupport: false,
           bufferCompletionTimeout: 100,
           customCompletionKinds: false,
           completionKinds: {},
           filterCompletionDuplicates: false,
	 }

autocmd User LspSetup call LspOptionsSet(lspOpts)

final lspServers = [
    {'name': 'pyright', 'filetype': 'python', 'path': expand('$HOME/.nix-profile/bin/pyright'), 'args':  ['--stdio']},
    {'name': 'vimls', 'filetype': 'vim', 'path': expand('$HOME/.nix-profile/bin/vim-language-server'), 'args': ['--stdio']},
    {'name': 'fennel-ls', 'filetype': 'fennel', 'path': expand('$HOME/.nix-profile/bin/fennel-ls')},
    {'name': 'nil', 'filetype': 'nix', 'path': expand('$HOME/.nix-profile/bin/nil'), 'initializationOptions': {'formatting': {'command': [ 'nixfmt' ]}}}
]

autocmd User LspSetup call LspAddServer(lspServers)

nnoremap <silent> K <cmd>LspHover<CR>
nmap <silent> [d <cmd>LspDiag prev<cr>
nmap <silent> ]d <cmd>LspDiag next<cr>
