# Changelog

## 0.2.0

### Minor Changes

- [`db84122`](https://github.com/nathanvale/side-quest-x-api/commit/db84122dae8015b5067c71163d72c93d23b384b2) Thanks [@nathanvale](https://github.com/nathanvale)! - Add Claude Desktop Extension (.mcpb) for one-click install

## 0.1.1

### Patch Changes

- [#2](https://github.com/nathanvale/side-quest-x-api/pull/2) [`63cc8c2`](https://github.com/nathanvale/side-quest-x-api/commit/63cc8c29e8787dadf3a50aa2a097d62514a73f54) Thanks [@nathanvale](https://github.com/nathanvale)! - Add threads and timelines keywords to package metadata

## 0.1.0

### Minor Changes

- [`ce934ea`](https://github.com/nathanvale/side-quest-x-api/commit/ce934eae840776f5d9afb18fd4ed03cb42694983) Thanks [@nathanvale](https://github.com/nathanvale)! - feat: initial release — read-only Twitter/X API v2 client with MCP server

  Extracted from side-quest-marketplace as a standalone package. Provides:

  - `createXApiClient()` — resilient API client with retry, timeout, rate limit awareness
  - 6 MCP tools: get_tweet, get_thread, get_timeline, search, get_user, get_replies
  - Markdown and JSON formatters for all response types
  - `bunx x-api-mcp` CLI for running the MCP server

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Initial release.
