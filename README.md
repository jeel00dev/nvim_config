# nvim_config

Modular Neovim config built around `lazy.nvim`. Fast, lazy-loaded, easy to extend.

Standard stuff: LSP via `mason + lspconfig`, completion via `blink.cmp`, treesitter, formatting via `conform.nvim`, linting via `nvim-lint`, git, DAP, fzf-lua, neo-tree.

## Main thing: local AI harness

Cursor-like inline completion with zero cloud dependency.

How it works:

- `minuet-ai.nvim` provides ghost-text / virtualtext suggestions.
- Backend is `llama.cpp` via OpenAI-compatible API (`http://localhost:8080/v1`).
- Config is provider-agnostic: `lua/config/defaults.lua` -> `lua/adapters/ai.lua` -> `lua/features/ai/provider.lua` -> `lua/features/ai/minuet.lua`. Swap backend (Ollama, LM Studio, vLLM) by changing endpoint/model.
- `scripts/nvim-ai` starts `llama-server` with your `.gguf`, waits for `/health`, opens Neovim with `NVIM_AI=1`, then cleans up on exit. The AI plugin (`lua/plugins/ai.lua`) only loads when `NVIM_AI=1`.

Default model is Qwen2.5-Coder instruct (set via `LLAMA_MODEL` env or `ai.model` in config), context ~32k, temp 0.2.

Keymaps (ghost text):

- `<A-A>` accept full, `<A-a>` accept line, `<A-z>` accept n lines
- `<A-]>` / `<A-[>` next / prev, `<A-e>` dismiss

## Requirements

- Neovim 0.11+
- `ripgrep`, `fd`, `git`
- For AI mode: built `llama-server` from `llama.cpp` + a `.gguf` instruct/coder model

## Usage

```sh
# normal
nvim

# with local AI
./scripts/nvim-ai
# or
LLAMA_MODEL=/path/to/model.gguf LLAMA_PORT=8080 ./scripts/nvim-ai .
```

Override settings in `lua/config/user.lua`, e.g.:

```lua
return {
  ai = { endpoint = "http://localhost:11434/v1" },
}
```

## Layout

```
init.lua
lua/config/   -- defaults + user overrides
lua/adapters/ -- swappable abstractions (ai, completion, picker, git)
lua/features/ -- actual setup (ai, lsp, completion, ui, ...)
lua/plugins/  -- lazy.nvim specs
lua/keymaps/
lua/theme/
scripts/nvim-ai
```
