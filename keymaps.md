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

## 📋 Copy Mode (VI)

| Key               | Action                      | Description                    |
|------------------|-----------------------------|--------------------------------|
| `Ctrl-b [`        | Entra no modo de cópia      | Inicia o copy-mode (vi)        |
| `v`               | Inicia seleção              | Seleção visual estilo vim      |
| `y`               | `send -X copy-selection`    | Copia a seleção                |
| `Enter`           | Confirma cópia              | Copia e sai do modo de cópia   |
| `q` / `Esc`       | Sai do modo de cópia        | Cancela sem copiar             |

---

## 🖥️ Sessões

| Ação                    | Comando                          |
|-------------------------|----------------------------------|
| Iniciar uma sessão      | `tmux` ou `tmux new -s nomedases` |
| Separar (detach) da sessão | `Ctrl-b d`                    |
| Voltar para sessão      | `tmux attach -t nomedases`       |
| Listar sessões          | `tmux ls`                        |
| Matar sessão            | `tmux kill-session -t nomedases` |

---

## 🪟 Janelas & Paineis

| Ação                        | Comando     |
|-----------------------------|-------------|
| Nova janela                 | `Ctrl-b c`  |
| Próxima janela              | `Ctrl-b n`  |
| Janela anterior             | `Ctrl-b p`  |
| Dividir painel horizontal   | `Ctrl-b "`  |
| Dividir painel vertical     | `Ctrl-b %`  |
| Alternar entre painéis      | `Ctrl-b` + setas |
| Fechar painel/janela        | `exit`      |

### Other Options

- `setw -g mode-keys vi`: Use Vim-style bindings in copy mode.

