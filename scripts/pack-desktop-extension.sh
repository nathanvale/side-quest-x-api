#!/usr/bin/env bash
# Purpose: Build and pack a minimal .mcpb Desktop Extension for Claude Desktop.
#
# Creates a staging directory with only the files needed for the extension:
# - manifest.json (Desktop Extension config)
# - dist/ (compiled MCP server + library)
# - node_modules/ (production dependencies only)
# - package.json (for Node.js module resolution)
#
# Usage: Run from the repo root: bash scripts/pack-desktop-extension.sh
# Output: x-api.mcpb in the repo root

set -euo pipefail

STAGE_DIR=".mcpb-stage"
OUTPUT="x-api.mcpb"

echo "==> Syncing manifest.json version from package.json..."
VERSION=$(node -p "require('./package.json').version")
node -e "
  const fs = require('fs');
  const m = JSON.parse(fs.readFileSync('manifest.json', 'utf8'));
  m.version = '${VERSION}';
  fs.writeFileSync('manifest.json', JSON.stringify(m, null, '\t') + '\n');
"
echo "    manifest.json version → ${VERSION}"

echo "==> Building project..."
bun run build

echo "==> Staging minimal extension directory..."
rm -rf "$STAGE_DIR"
mkdir -p "$STAGE_DIR"

# Copy only what the extension needs
cp manifest.json "$STAGE_DIR/"
cp package.json "$STAGE_DIR/"
cp -r dist "$STAGE_DIR/"

# Install production-only dependencies
echo "==> Installing production dependencies..."
cd "$STAGE_DIR"
npm install --omit=dev --ignore-scripts 2>&1 | tail -1
cd ..

echo "==> Packing .mcpb bundle..."
rm -f "$OUTPUT"
npx @anthropic-ai/mcpb pack "$STAGE_DIR" "$OUTPUT"

echo "==> Cleaning up staging directory..."
rm -rf "$STAGE_DIR"

SIZE=$(ls -lh "$OUTPUT" | awk '{print $5}')
echo ""
echo "Done! Created ${OUTPUT} (${SIZE})"
echo ""
echo "To install: double-click x-api.mcpb in Finder, or share the file."
echo "To inspect: npx @anthropic-ai/mcpb info x-api.mcpb"
