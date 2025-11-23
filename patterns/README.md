# Community Patterns

Custom noise patterns contributed by the LogFix community.

## 📂 Available Patterns

### Frameworks
- [Shopify](shopify/) - Shopify app development patterns
- [Microservices](microservices/) - gRPC and REST microservices

### Coming Soon
- Ruby Sinatra
- Elixir Phoenix
- Swift Vapor
- Unity Game Engine

## 🚀 How to Use

### 1. Copy Pattern File

```bash
cp patterns/shopify/noise-patterns.yaml ~/.logfix-patterns.yaml
```

### 2. Use with LogFix

```bash
# Automatic (if in $HOME)
logfix --file app.log

# Manual path
logfix --file app.log --patterns path/to/patterns.yaml
```

### 3. Combine Multiple Patterns

```yaml
# ~/.logfix-patterns.yaml
# Merge multiple pattern files

noise_patterns:
  # Shopify patterns
  - "LLMS Upload] CDN URL"
  - "App Embed found"
  
  # Your custom patterns
  - "My custom log message"
  - "Another repeated log"
```

## 🎯 Pattern Template

```yaml
# Pattern file structure
noise_patterns:
  - "Repetitive log message"
  - "Framework boilerplate"

regex_patterns:
  - pattern: "id:\\s+\\d+"
    replace: "id: ***"

never_reduce:
  - "critical"
  - "fatal"
```

## 📊 Testing Patterns

```bash
# See reduction stats
logfix --file sample.log --patterns your-patterns.yaml --stats

# Expected output:
# Reduction: 75.5%
# Estimated tokens saved: ~1,234
```

## 🤝 Contributing

Have patterns for a framework not listed? [Contribute!](../CONTRIBUTING.md)

1. Create folder: `patterns/your-framework/`
2. Add `noise-patterns.yaml`
3. Add `README.md`
4. Submit PR

## ✅ Quality Checklist

- [ ] Tested with real logs
- [ ] 60%+ reduction
- [ ] No false positives (errors hidden)
- [ ] Includes README
- [ ] Follows naming convention
