---
'@side-quest/x-api': minor
---

feat: initial release — read-only Twitter/X API v2 client with MCP server

Extracted from side-quest-marketplace as a standalone package. Provides:
- `createXApiClient()` — resilient API client with retry, timeout, rate limit awareness
- 6 MCP tools: get_tweet, get_thread, get_timeline, search, get_user, get_replies
- Markdown and JSON formatters for all response types
- `bunx x-api-mcp` CLI for running the MCP server
