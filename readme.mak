# Prompt: Build My Ultimate Neovim Configuration

I want you to build a complete Neovim configuration from scratch.

This should **NOT** be just a collection of plugins. I want it to be a well-designed, modular, maintainable, future-proof editor configuration with a clean architecture.

The goal is to create something comparable to a professional IDE while preserving Neovim's speed, simplicity, and flexibility.

---

# Overall Philosophy

Design principles:

* Minimalistic
* Beautiful UI
* Extremely productive
* Consistent user experience
* Fast startup
* Lazy-loaded wherever possible
* Modular architecture
* Easy to maintain
* Easy to customize
* Easy to extend
* Future-proof
* Well documented
* Every plugin should have a clear purpose
* Avoid plugin overlap and redundancy

The UI should always prioritize useful information over visual effects.

---

# Plugin Manager

* lazy.nvim

Use best practices for lazy loading.

---

# Core Plugins

* lazy.nvim
* plenary.nvim
* nui.nvim
* nvim-web-devicons

---

# UI

## Theme

Use Catppuccin as the base theme, but structure everything so creating my own custom colorscheme later is straightforward.

Include:

* catppuccin
* lush.nvim

## Dashboard

* alpha-nvim

## Statusline

* lualine.nvim

## Buffer Line

* bufferline.nvim

## Breadcrumbs

* dropbar.nvim

## Notifications

* nvim-notify

## Command Line & Popup UI

* noice.nvim

## Keybinding Popup

* which-key.nvim

## Window Layout

* edgy.nvim

## Smooth Scrolling

* neoscroll.nvim

## Indentation Guides

* indent-blankline.nvim

## Rainbow Parentheses

* rainbow-delimiters.nvim

## Sticky Context

* nvim-treesitter-context

## Color Preview

* nvim-highlight-colors

---

# Treesitter

Install and configure:

* nvim-treesitter
* nvim-treesitter-textobjects
* nvim-ts-autotag
* nvim-ts-context-commentstring
* vim-matchup

Automatically install parsers for all common programming languages.

---

# File Explorer

Use:

* neo-tree.nvim

Requirements:

* Git status
* Diagnostics
* File icons
* Preview
* Good keyboard navigation

---

# Searching

Use:

* fzf
* fzf-lua
* fzy-lua-native

Configure fast searching using:

* ripgrep
* fd

Integrate:

* zoxide

---

# Navigation

Use:

* flash.nvim

---

# LSP

Use:

* mason.nvim
* mason-lspconfig.nvim
* nvim-lspconfig

Automatically install and configure language servers.

---

# Completion

Use:

* blink.cmp

Do not use nvim-cmp.

Configure:

* snippets
* LSP completion
* path completion
* buffer completion
* ghost text

---

# AI Integration

Use:

* minuet-ai.nvim

The backend AI model will run locally using **llama.cpp**.

Requirements:

* OpenAI-compatible API
* Inline ghost text completion
* Cursor-like experience
* Accept suggestion
* Reject suggestion
* Multi-line completion
* Streaming completion
* No cloud dependency

The configuration should make it easy to switch to another local backend (Ollama, LM Studio, vLLM, etc.) in the future without changing the rest of the setup.

---

# Formatting

Use:

* conform.nvim

Configure language-specific formatters.

---

# Linting

Use:

* nvim-lint

Configure language-specific linters.

---

# Diagnostics

Use:

* trouble.nvim
* tiny-inline-diagnostic.nvim
* glance.nvim
* lsp_signature.nvim

Diagnostics should be informative without being visually noisy.

---

# Git

Use:

* gitsigns.nvim
* diffview.nvim
* gitgraph.nvim

Requirements:

* Beautiful diff UI
* Branch graph visualization
* File history
* Git signs
* No Git command wrappers

---

# Debugging

Use:

* nvim-dap
* nvim-dap-ui
* nvim-dap-virtual-text
* mason-nvim-dap.nvim

Create a clean debugging layout.

Display:

* Variables
* Watches
* Breakpoints
* Threads
* Call Stack
* REPL
* Console

Show inline variable values.

The debugging experience should feel close to VS Code while remaining minimal.

---

# Search & Replace

Use:

* grug-far.nvim

---

# Terminal

Use:

* toggleterm.nvim

---

# Projects

Use:

* project.nvim

---

# Sessions

Use:

* persisted.nvim

---

# Editing

Use:

* Comment.nvim
* autoclose.nvim
* mini.align
* smartyank.nvim
* vim-sleuth

---

# Markdown

Use:

* render-markdown.nvim
* markdown-preview.nvim

---

# TODO Management

Use:

* todo-comments.nvim

---

# Quickfix

Use:

* nvim-bqf

---

# Scrollbar

Use:

* nvim-scrollview

Display:

* Diagnostics
* Git changes
* Search matches
* Cursor position

---

# Protected Files

Use:

* suda.vim

---

# Code Runner

Use:

* sniprun

---

# Theme Development

The configuration should make creating and maintaining a custom theme easy.

Structure the theme cleanly.

Use:

* lush.nvim

Create a separate folder dedicated to theme overrides and custom highlight groups.

---

# External Tools

Integrate and document:

* ripgrep
* fd
* zoxide
* bat
* eza
* delta
* lazygit

---

# UI Guidelines

The UI should feel like a modern IDE.

It should provide useful information without clutter.

Every UI component should have a purpose.

Notifications should be clean.

Floating windows should share the same border style.

Use consistent rounded borders.

Use consistent spacing.

Use consistent highlight groups.

Use consistent icons.

Make all floating windows visually consistent.

---

# Keybindings

Create a well-organized keybinding system.

Group related mappings together.

Examples:

Leader + f

* Find files
* Live grep
* Buffers
* Recent files

Leader + g

* Git graph
* Git diff
* Git history

Leader + d

* Debugging

Leader + l

* LSP

Leader + t

* Terminal

Leader + p

* Projects

Leader + s

* Search & Replace

Leader + c

* Code actions

Leader + b

* Buffers

Leader + w

* Windows

Leader + x

* Diagnostics

Document every keybinding.

Avoid conflicts.

---

# Project Structure

Organize everything into modules.

Example:

lua/

* config/
* core/
* plugins/
* ui/
* lsp/
* cmp/
* ai/
* dap/
* git/
* treesitter/
* formatter/
* lint/
* keymaps/
* autocmds/
* themes/
* utils/

Avoid putting everything in one file.

---

# Performance

* Lazy-load plugins
* Optimize startup
* Avoid unnecessary autocommands
* Reduce redraws
* Minimize startup allocations

---

# Future Proofing

The configuration should make replacing plugins easy.

Examples:

* Replace blink.cmp later
* Replace AI backend later
* Replace file explorer later

No plugin should be tightly coupled to the rest of the configuration.

Prefer adapter-style abstractions where appropriate.

---

# Documentation

Document:

* Every module
* Every plugin
* Every keybinding
* Every custom function
* Configuration rationale

The project should be understandable after several years.

---

# My Custom Color Palette

Use this palette as the base for the theme and highlight groups.

```lua
return {
    -- Foreground colors
    red     = "#fe605e",
    green   = "#8daf62",
    blue    = "#85afd6",
    orange  = "#fbb065",
    white   = "#bebfb8",
    brown   = "#977c48",
    purple  = "#a983ac",

    -- Backgrounds
    bg      = "#000000",
    bg2     = "#000000",
    bg3     = "#2b2620",
    bg4     = "#313131",
    bg5     = "#383430",

    quartz  = "#cfcfc6",
    orangebg = "#d19a66",
}
```

Use these colors consistently throughout:

* Statusline
* Bufferline
* Floating windows
* Diagnostics
* Git highlights
* DAP UI
* Search highlights
* Completion menu
* Ghost text
* Telescope/FZF-Lua interfaces (or equivalent)
* Notifications
* Markdown rendering
* Treesitter highlights
* Popup menus

The final result should feel cohesive, elegant, readable, and professional.

The configuration should prioritize maintainability, modularity, performance, and a polished user experience.
