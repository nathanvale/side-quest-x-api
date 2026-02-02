# @side-quest/x-api

Read-only Twitter/X API v2 — tweets, threads, timelines, user profiles. Published as both an npm library and an MCP server for Claude Code.

## Quick Start (Claude Code)

```bash
claude mcp add -e X_BEARER_TOKEN=your-token-here x-api -- bunx --bun @side-quest/x-api
```

That's it. The MCP tools are now available in Claude Code.

### Get a Bearer Token

1. Go to the [Twitter Developer Portal](https://developer.x.com/en/portal/dashboard)
2. Create a project and app
3. Generate a **Bearer Token** (read-only access is sufficient)

## MCP Tools

| Tool | Description |
|------|-------------|
| `x_get_tweet` | Get a single tweet by ID with author info and engagement metrics |
| `x_get_thread` | Get a full conversation thread from a tweet ID |
| `x_get_timeline` | Get a user's recent tweets by username |
| `x_get_user` | Get a user profile — bio, follower counts, tweet count |
| `x_get_replies` | Get replies to a specific tweet |
| `x_search` | Search recent tweets (7-day window) |

## Claude Desktop

### One-Click Install (Desktop Extension)

Download the latest `x-api.mcpb` from [GitHub Releases](https://github.com/nathanvale/side-quest-x-api/releases) and double-click to install. Claude Desktop will prompt you for your Bearer Token.

### Manual Setup

Add to `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS):

```json
{
  "mcpServers": {
    "x-api": {
      "command": "bunx",
      "args": ["--bun", "@side-quest/x-api"],
      "env": {
        "X_BEARER_TOKEN": "your-token-here"
      }
    }
  }
}
```

### Environment Variable

Instead of hardcoding the token, set it in your shell:

```bash
export X_BEARER_TOKEN="your-token-here"
```

Then use `${X_BEARER_TOKEN}` in the config:

```bash
claude mcp add -e X_BEARER_TOKEN='${X_BEARER_TOKEN}' x-api -- bunx --bun @side-quest/x-api
```

## Library Usage

```typescript
import { createXApiClient } from '@side-quest/x-api';

const client = createXApiClient({ bearerToken: process.env.X_BEARER_TOKEN });

const user = await client.getUser('elonmusk');
const tweets = await client.getTimeline('elonmusk', { maxResults: 10 });
const tweet = await client.getTweet('1234567890');
```

## License

MIT
