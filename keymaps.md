# Neovim Macros (Keymaps)

## Normal Mode (`n`)

| Key              | Action                        | Description                     |
|-------------------|-------------------------------|---------------------------------|
| `<leader>1..9`   | `BufferLineGoToBuffer N`      | Go to buffer N                 |
| `<leader>0`      | `BufferLineGoToBuffer -1`     | Go to last buffer tab          |
| `<Tab>`          | `BufferLineCycleNext`         | Next buffer tab                |
| `<S-Tab>`        | `BufferLineCyclePrev`         | Previous buffer tab            |
| `<leader>dt`     | `dap.toggle_breakpoint`       | Toggle breakpoint              |
| `<leader>dc`     | `dap.continue`               | Continue execution in debugger |
| `]c`             | `gitsigns.next_hunk`          | Next Git hunk                  |
| `[c`             | `gitsigns.prev_hunk`          | Previous Git hunk              |
| `<leader>gp`     | `gitsigns.preview_hunk`       | Preview Git hunk               |
| `<leader>gd`     | `gitsigns.diffthis`           | Show diff                      |
| `<leader>lg`     | `:LazyGit<CR>`               | Open LazyGit                   |
| `<C-b>`          | `:Neotree toggle left<CR>`   | Toggle Neotree sidebar         |
| `<leader>gf`     | `vim.lsp.buf.format`          | Format file via LSP            |
| `K`              | `vim.lsp.buf.hover`           | Show hover info                |
| `<leader>fd`     | `vim.lsp.buf.definition`      | Go to definition               |
| `<leader>fr`     | `vim.lsp.buf.references`      | Show references                |
| `<leader>ca`     | `vim.lsp.buf.code_action`     | Show code actions              |
| `<C-v>`          | `"+p`                        | Paste from clipboard           |
| `<C-z>`          | `u`                          | Undo                           |
| `<C-y>`          | `<C-r>`                      | Redo                           |
| `<leader>tt`     | `:vert botright terminal<CR>` | Open terminal in vertical split|
| `<C-f>`          | `/`                          | Start search                   |
| `<CS-f>`         | `:vimgrep /`                 | Grep search                    |
| `<leader>e`      | `vim.diagnostic.open_float`   | Open diagnostics float         |
| `<leader>gd`     | `tabnew + lsp.buf.definition()` | Definition in new tab        |
| `<leader>q`      | `:bd<CR>`                    | Close current buffer           |

## Visual Mode (`v`)

| Key              | Action                        | Description                     |
|-------------------|-------------------------------|---------------------------------|
| `<leader>gs`     | `:Gitsigns stage_hunk<CR>`    | Stage Git hunk                 |
| `<leader>gr`     | `:Gitsigns reset_hunk<CR>`    | Reset Git hunk                 |
| `<CR>` (in cmp)  | `cmp.confirm()`              | Confirm autocomplete selection |

## Insert Mode (`i`)

| Key              | Action                        | Description                     |
|-------------------|-------------------------------|---------------------------------|
| `<C-Space>` (in cmp) | `cmp.mapping.complete()`  | Trigger autocomplete           |

---

# TMUX Macros

## Copy Mode (VI)

| Key              | Action                        | Description                     |
|-------------------|-------------------------------|---------------------------------|
| `y`              | `send -X copy-selection`      | Copy selection in vi mode       |

### Other Options

- `setw -g mode-keys vi`: Use Vim-style bindings in copy mode.

