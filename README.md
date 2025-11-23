# 🎨 LogFix Community

**Community patterns, integrations, and examples for LogFix**

Welcome! This is the community hub for LogFix users to share custom patterns, integrations, and workflows.

---

## 🚀 Quick Start

### Installation

Download LogFix from releases and activate:

```bash
# Download and extract
wget https://github.com/serdarkemal/logfix/releases/latest/download/logfix.zip
unzip logfix.zip && cd logfix

# Activate your license
./logfix activate YOUR-LICENSE-KEY

# Start using
npm run dev 2>&1 | logfix
```

### Basic Usage

```bash
# Process log file
logfix --file app.log

# Live filtering
python app.py 2>&1 | logfix

# With custom patterns
logfix --file app.log --patterns my-patterns.yaml
```

---

## 📁 Repository Structure

```
community/
├── patterns/          # Custom noise patterns
├── integrations/      # IDE & tool integrations
├── examples/          # Real-world workflows
└── tools/            # Community-built tools
```

---

## 🎯 Popular Patterns

### Shopify Development
```yaml
# patterns/shopify/noise-patterns.yaml
noise_patterns:
  - "LLMS Upload] CDN URL"
  - "App Embed found"
  - "Access scopes auto-granted"
```

### Microservices (gRPC/REST)
```yaml
# patterns/microservices/grpc-patterns.yaml
noise_patterns:
  - "gRPC server listening"
  - "Service mesh health check"
  - "Circuit breaker"
```

### AI/ML Workflows
```yaml
# patterns/ai-ml/pytorch-patterns.yaml
noise_patterns:
  - "Model loaded"
  - "Tokenizer initialized"
  - "GPU memory allocated"
```

[Browse all patterns →](patterns/)

---

## 🔧 Integrations

### VS Code / Cursor
```json
// .vscode/tasks.json
{
  "tasks": [{
    "label": "Dev with LogFix",
    "type": "shell",
    "command": "npm run dev 2>&1 | logfix"
  }]
}
```

### GitHub Actions
```yaml
# .github/workflows/test.yml
- name: Run tests with LogFix
  run: npm test 2>&1 | logfix --output json > logs.json
```

[Browse all integrations →](integrations/)

---

## 📚 Examples

### Next.js Development
```bash
#!/bin/bash
# examples/nextjs-dev-workflow.sh
npm run dev 2>&1 | \
  logfix \
    --output markdown \
    --patterns .logfix-patterns.yaml
```

### Python Flask Pipeline
```bash
# examples/python-flask-pipeline.sh
python app.py 2>&1 | \
  tee dev.log | \
  logfix --min-level warn
```

[Browse all examples →](examples/)

---

## 🤝 Contributing

We welcome contributions! Here's how:

### 1. Share Your Patterns

Create a pattern file:
```yaml
# patterns/your-framework/noise-patterns.yaml
noise_patterns:
  - "Your repetitive log message"
  - "Another noisy pattern"

# Optional: regex patterns
regex_patterns:
  - pattern: "request_id:\\s+[a-z0-9-]+"
    replace: "request_id: ***"
```

### 2. Submit a PR

```bash
git checkout -b add-my-patterns
git add patterns/your-framework/
git commit -m "Add patterns for YourFramework"
git push origin add-my-patterns
```

### 3. Pattern Guidelines

**✅ Good patterns:**
- Infrastructure logs (health checks, cache hits)
- Framework boilerplate (ORM queries, middleware)
- Repeated status messages

**❌ Avoid:**
- Error messages
- Business logic
- Transaction logs
- Security events

---

## 💡 Community Tools

### Pattern Tester
```bash
# Test your patterns before using
cd tools/pattern-tester
./test-pattern.sh my-patterns.yaml sample.log
```

### Coverage Analyzer
```bash
# See how much reduction you're getting
logfix --file app.log --stats
```

---

## 📊 Built-in Patterns

LogFix ships with **111 noise patterns** covering:

| Framework | Patterns |
|-----------|----------|
| Django | 17 |
| Rails | 14 |
| Express/NestJS | 12 |
| Spring Boot | 11 |
| Laravel | 10 |
| Next.js | 10 |
| Universal | 37 |

[View all built-in patterns →](https://github.com/serdarkemal/logfix#-custom-noise-patterns)

---

## 🛟 Support

- 📖 **Documentation:** [Main README](https://github.com/serdarkemal/logfix)
- 💬 **Discussions:** [GitHub Discussions](https://github.com/serdarkemal/logfix-community/discussions)
- 🐛 **Issues:** [Report a bug](https://github.com/serdarkemal/logfix-community/issues)
- 📧 **Email:** hello@logfix.com

---

## 📜 License

Community contributions are licensed under MIT.

LogFix binary is proprietary - requires a license key for commercial use.

---

**Built with ❤️ by the LogFix community**
