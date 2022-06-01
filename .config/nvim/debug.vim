nnoremap <silent> <Leader>xc <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <Leader>xx <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <Leader>xi <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <Leader>xo <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>xb <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>xB <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>xr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>xl <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <Leader>xz <Cmd>lua require'dapui'.toggle()<CR>
