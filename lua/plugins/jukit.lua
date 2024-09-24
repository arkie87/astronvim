return {
  "luk400/vim-jukit",
  config = function()
    vim.g.jukit_mappings = 0
    local keymap = vim.keymap

    keymap.set("n", "<leader>j", "", { desc = "Jukit Mappings" })
    keymap.set("n", "<leader>jo", "<cmd> call jukit#splits#output()<cr>", { desc = "Open output window" })
    keymap.set(
      "n",
      "<leader>jx",
      ":call jukit#splits#close_output_split()<cr>",
      { noremap = true, desc = "Close output window" }
    )

    keymap.set("n", "<leader>js", ":call jukit#splits#output()<cr>", { noremap = true }) -- Opens a new output window and executes the command specified in `g:jukit_shell_cmd`
    keymap.set("n", "<leader>jst", ":call jukit#splits#term()<cr>", { noremap = true }) -- Opens a new output window without executing any command
    keymap.set("n", "<leader>jho", ":call jukit#splits#history()<cr>", { noremap = true }) -- Opens a new output-history window, where saved ipython outputs are displayed
    keymap.set("n", "<leader>jhx", ":call jukit#splits#close_history()<cr>", { noremap = true }) -- Close output-history window

    keymap.set("n", "<leader>jhs", ":call jukit#splits#output_and_history()<cr>", { noremap = true }) -- Shortcut for opening output terminal and output-history
    keymap.set("n", "<leader>jhd", ":call jukit#splits#close_output_and_history(1)<cr>", { noremap = true }) -- Close both windows. Argument: Whether or not to ask you to confirm before closing.
    keymap.set("n", "<leader>jo", ":call jukit#splits#show_last_cell_output(1)<cr>", { noremap = true }) -- Show output of current cell (determined by current cursor position) in output-history window. Argument: Whether or not to reload outputs if cell id of outputs to display is the same as the last cell id for which outputs were displayed
    keymap.set("n", "<leader>jj", ":call jukit#splits#out_hist_scroll(1)<cr>", { noremap = true }) -- Scroll down in output-history window. Argument: whether to scroll down (1) or up (0)
    keymap.set("n", "<leader>jk", ":call jukit#splits#out_hist_scroll(0)<cr>", { noremap = true }) -- Scroll up in output-history window. Argument: whether to scroll down (1) or up (0)
    keymap.set("n", "<leader>jh", ":call jukit#splits#toggle_auto_hist()<cr>", { noremap = true }) -- Create/delete autocmd for displaying saved output on CursorHold.
    keymap.set("n", "<leader>jsl", ":call jukit#layouts#set_layout()<cr>", { noremap = true }) -- Apply layout (see `g:jukit_layout`) to current splits - NOTE: it is expected that this function is called from the main file buffer/split

    keymap.set("n", "<leader><space>", ":call jukit#send#section(0)<cr>", { noremap = true }) -- Send code within the current cell to output split (also saves the output if ipython is used and `g:jukit_save_output==1`). Argument: if 1, will move the cursor to the next cell below after sending the code to the split, otherwise cursor position stays the same.
    keymap.set("n", "<leader><cr>", ":call jukit#send#line()<cr>", { noremap = true }) -- Send current line to output split
    keymap.set("v", "<leader><cr>", ":<C-U>call jukit#send#selection()<cr>", { noremap = true }) -- Send visually selected code to output split
    keymap.set("n", "<leader>jcc", ":call jukit#send#until_current_section()<cr>", { noremap = true }) -- Execute all cells until the current cell
    keymap.set("n", "<leader>jall", ":call jukit#send#all()<cr>", { noremap = true }) -- Execute all cells
    keymap.set("n", "<leader>jn", ":call jukit#cells#jump_to_next_cell()<cr>", { noremap = true }) -- Jump to next cell
    keymap.set("n", "<leader>jp", ":call jukit#cells#jump_to_previous_cell()<cr>", { noremap = true }) -- Jump to previous cell

    keymap.set("n", "<leader>jco", ":call jukit#cells#create_below(0)<cr>", { noremap = true }) -- Create new code cell below. Argument: Whether to create code cell (0) or markdown cell (1)
    keymap.set("n", "<leader>jcO", ":call jukit#cells#create_above(0)<cr>", { noremap = true }) -- Create new code cell above. Argument: Whether to create code cell (0) or markdown cell (1)
    keymap.set("n", "<leader>jct", ":call jukit#cells#create_below(1)<cr>", { noremap = true }) -- Create new textcell below. Argument: Whether to create code cell (0) or markdown cell (1)
    keymap.set("n", "<leader>jcT", ":call jukit#cells#create_above(1)<cr>", { noremap = true }) -- Create new textcell above. Argument: Whether to create code cell (0) or markdown cell (1)
    keymap.set("n", "<leader>jcd", ":call jukit#cells#delete()<cr>", { noremap = true }) -- Delete current cell
    keymap.set("n", "<leader>jcs", ":call jukit#cells#split()<cr>", { noremap = true }) -- Split current cell (saved output will then be assigned to the resulting cell above)
    keymap.set("n", "<leader>jcM", ":call jukit#cells#merge_above()<cr>", { noremap = true }) -- Merge current cell with the cell above
    keymap.set("n", "<leader>jcm", ":call jukit#cells#merge_below()<cr>", { noremap = true }) -- Merge current cell with the cell below
    keymap.set("n", "<leader>jck", ":call jukit#cells#move_up()<cr>", { noremap = true }) -- Move current cell up
    keymap.set("n", "<leader>jcj", ":call jukit#cells#move_down()<cr>", { noremap = true }) -- Move current cell down
    keymap.set("n", "<leader>jJ", ":call jukit#cells#jump_to_next_cell()<cr>", { noremap = true }) -- Jump to the next cell below
    keymap.set("n", "<leader>jK", ":call jukit#cells#jump_to_previous_cell()<cr>", { noremap = true }) -- Jump to the previous cell above
    keymap.set("n", "<leader>jddo", ":call jukit#cells#delete_outputs(0)<cr>", { noremap = true }) -- Delete saved output of current cell. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)
    keymap.set("n", "<leader>jdda", ":call jukit#cells#delete_outputs(1)<cr>", { noremap = true }) -- Delete saved outputs of all cells. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0
    keymap.set("n", "<leader>jnp", ":call jukit#convert#notebook_convert('jupyter-notebook')<cr>", { noremap = true }) -- Convert from ipynb to py or vice versa. Argument: Optional. If an argument is specified, then its value is used to open the resulting ipynb file after converting script.
    keymap.set("n", "<leader>jht", ":call jukit#convert#save_nb_to_file(0,1,'html')<cr>", { noremap = true }) -- Convert file to html (including all saved outputs) and open it using the command specified in `g:jukit_html_viewer'. If `g:jukit_html_viewer` is not defined, then will default to `g:jukit_html_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to
    keymap.set("n", "<leader>jrht", ":call jukit#convert#save_nb_to_file(1,1,'html')<cr>", { noremap = true }) -- same as above, but will (re-)run all cells when converting to html
    keymap.set("n", "<leader>jpd", ":call jukit#convert#save_nb_to_file(0,1,'pdf')<cr>", { noremap = true }) -- Convert file to pdf (including all saved outputs) and open it using the command specified in `g:jukit_pdf_viewer'. If `g:jukit_pdf_viewer` is not defined, then will default to `g:jukit_pdf_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues.
    keymap.set("n", "<leader>jrpd", ":call jukit#convert#save_nb_to_file(1,1,'pdf')<cr>", { noremap = true }) -- same as above, but will (re-)run all cells when converting to pdf. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues.
    keymap.set("n", "<leader>jpos", ":call jukit#ueberzug#set_default_pos()<cr>", { noremap = true }) -- set position and dimension of überzug windo
  end,
}
