#!/bin/bash
# Next.js Development Workflow with LogFix
# 
# Description: Stream Next.js dev server logs through LogFix
# Usage: ./nextjs-dev-workflow.sh

set -e

echo "🚀 Starting Next.js dev server with LogFix..."

# Custom patterns file (optional)
PATTERNS_FILE=".logfix-patterns.yaml"

# Check if LogFix is installed
if ! command -v logfix &> /dev/null; then
    echo "❌ LogFix not found. Please install first."
    exit 1
fi

# Check if custom patterns exist
if [ -f "$PATTERNS_FILE" ]; then
    echo "✅ Using custom patterns: $PATTERNS_FILE"
    PATTERNS_ARG="--patterns $PATTERNS_FILE"
else
    echo "ℹ️  Using built-in patterns"
    PATTERNS_ARG=""
fi

# Run Next.js dev with LogFix
npm run dev 2>&1 | logfix \
    $PATTERNS_ARG \
    --output markdown \
    --min-level info \
    --stats

# Alternative: Save logs while filtering
# npm run dev 2>&1 | tee dev.log | logfix --output markdown
