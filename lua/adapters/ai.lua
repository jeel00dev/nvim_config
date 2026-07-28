-- adapters/ai.lua — AI provider abstraction
--
-- Purpose: Provider-agnostic AI interface. Today uses minuet-ai,
-- but the backend (llama.cpp, Ollama, LM Studio, vLLM) and the
-- plugin itself can be swapped by changing config and this adapter.

local M = {}

--- Get current AI config.
function M.get_config()
  local config = require("config")
  return {
    enabled = config.get("ai.enabled", true),
    provider = config.get("ai.provider", "minuet"),
    backend = config.get("ai.backend", "llama_cpp"),
    endpoint = config.get("ai.endpoint", "http://localhost:8080/v1"),
    model = config.get("ai.model", "llama-3.2-3b"),
    api_key = config.get("ai.api_key", "TERM"),
    context_window = config.get("ai.context_window", 1024),
    max_tokens = config.get("ai.max_tokens", 56),
  }
end

--- Check if AI is available.
function M.is_available()
  local cfg = M.get_config()
  return cfg.enabled
end

return M
