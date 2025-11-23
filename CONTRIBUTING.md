# Contributing to LogFix Community

Thank you for your interest in contributing! This guide will help you share your patterns and integrations.

---

## 🎯 Ways to Contribute

### 1. Share Custom Patterns
Submit patterns for frameworks LogFix doesn't cover yet

### 2. Add Integrations
Show how to use LogFix with tools (VS Code, CI/CD, etc.)

### 3. Write Examples
Real-world workflows and use cases

### 4. Build Tools
Community utilities to enhance LogFix

---

## 📝 Pattern Contribution Guide

### Structure

```yaml
# patterns/[framework-name]/noise-patterns.yaml
noise_patterns:
  - "Repetitive log message 1"
  - "Repetitive log message 2"

# Optional: Regex normalization
regex_patterns:
  - pattern: "user_id:\\s+\\d+"
    replace: "user_id: ***"

# Optional: Critical keywords
never_reduce:
  - "payment"
  - "transaction"
```

### Example: Shopify App

```yaml
# patterns/shopify/noise-patterns.yaml
noise_patterns:
  - "LLMS Upload] CDN URL"
  - "App Embed found"
  - "Access scopes auto-granted"
  - "Shopify API call"
  - "GraphiQL server started"
  - "Webhook received"
```

### Testing Your Patterns

```bash
# Test locally
logfix --file sample.log --patterns your-patterns.yaml --stats

# Expected: 60-80% reduction
```

---

## 🔧 Integration Contribution Guide

### VS Code / Cursor

Create a task configuration:

```json
// integrations/vscode/logfix-task.json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Dev with LogFix",
      "type": "shell",
      "command": "npm run dev 2>&1 | logfix",
      "presentation": {
        "reveal": "always",
        "panel": "new"
      }
    }
  ]
}
```

### CI/CD

GitHub Actions example:

```yaml
# integrations/ci-cd/github-actions.yml
name: Test with LogFix

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Download LogFix
        run: |
          wget https://github.com/serdarkemal/logfix/releases/latest/download/logfix-linux.zip
          unzip logfix-linux.zip
      
      - name: Run tests
        run: npm test 2>&1 | ./logfix --output json > test-logs.json
      
      - name: Upload logs
        uses: actions/upload-artifact@v3
        with:
          name: test-logs
          path: test-logs.json
```

---

## 📚 Example Contribution Guide

### Create a Workflow Script

```bash
#!/bin/bash
# examples/your-framework/dev-workflow.sh

# Description: LogFix workflow for YourFramework
# Usage: ./dev-workflow.sh

set -e

# Custom patterns
PATTERNS_FILE=".logfix-patterns.yaml"

# Run dev server with LogFix
your-framework dev 2>&1 | \
  logfix \
    --patterns "$PATTERNS_FILE" \
    --output markdown \
    --min-level info
```

Make it executable:
```bash
chmod +x examples/your-framework/dev-workflow.sh
```

---

## 🛠️ Tool Contribution Guide

### Pattern Tester Example

```bash
#!/bin/bash
# tools/pattern-tester/test-pattern.sh

PATTERN_FILE=$1
LOG_FILE=$2

if [ -z "$PATTERN_FILE" ] || [ -z "$LOG_FILE" ]; then
  echo "Usage: ./test-pattern.sh patterns.yaml sample.log"
  exit 1
fi

echo "Testing patterns..."
logfix --file "$LOG_FILE" --patterns "$PATTERN_FILE" --stats
```

---

## 🚀 Submission Process

### 1. Fork the Repository

```bash
git clone https://github.com/your-username/logfix-community.git
cd logfix-community
```

### 2. Create a Branch

```bash
git checkout -b add-shopify-patterns
```

### 3. Add Your Files

```bash
# Pattern example
mkdir -p patterns/shopify
vim patterns/shopify/noise-patterns.yaml

# Add README
vim patterns/shopify/README.md
```

### 4. Commit Changes

```bash
git add patterns/shopify/
git commit -m "Add Shopify development patterns

- LLMS upload logs
- App embed detection
- GraphiQL server logs
- Tested with shopify-app-template"
```

### 5. Push and Create PR

```bash
git push origin add-shopify-patterns
```

Then create a Pull Request on GitHub.

---

## ✅ PR Checklist

- [ ] Pattern file includes comments
- [ ] Tested with real logs (show stats)
- [ ] README.md in subdirectory
- [ ] No sensitive data (API keys, passwords)
- [ ] Follows naming convention
- [ ] Added to main README.md

---

## 📋 Pattern Quality Guidelines

### ✅ Good Patterns

```yaml
# Clear, specific, repetitive
noise_patterns:
  - "Establishing database connection"
  - "Cache warmed up successfully"
  - "Health check: status OK"
```

### ❌ Bad Patterns

```yaml
# Too broad, might hide important logs
noise_patterns:
  - "error"      # Too generic!
  - "failed"     # Might hide real errors!
  - "user"       # Way too broad!
```

---

## 🎨 Naming Conventions

### Folders

```
patterns/framework-name/
integrations/tool-name/
examples/use-case-name/
```

### Files

```
noise-patterns.yaml
integration-config.json
workflow-script.sh
README.md
```

---

## 💬 Getting Help

- **Questions:** [GitHub Discussions](https://github.com/serdarkemal/logfix-community/discussions)
- **Bugs:** [Issues](https://github.com/serdarkemal/logfix-community/issues)
- **Email:** hello@logfix.com

---

## 🏆 Recognition

Top contributors will be featured in:
- README.md Contributors section
- Monthly community spotlight
- Special badge on Discord (coming soon)

---

**Thank you for making LogFix better! 🎉**
