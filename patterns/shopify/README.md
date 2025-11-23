# Shopify App Development Patterns

Noise reduction patterns for Shopify app development.

## 🎯 Common Noise Patterns

Shopify CLI and development server generate lots of repetitive logs. These patterns filter them out.

## 📁 Files

- `noise-patterns.yaml` - Main pattern file

## 🚀 Usage

```bash
# Copy to your project
cp noise-patterns.yaml ~/.logfix-patterns.yaml

# Use with Shopify dev
npm run dev 2>&1 | logfix
```

## 📊 Expected Results

- **Before:** 500+ log lines
- **After:** ~100 critical lines
- **Reduction:** ~80%

## 🔧 Patterns Included

- LLMS Upload logs
- App Embed detection
- Access scope grants
- GraphiQL server status
- Webhook receipts
- CDN URL generation

## ✅ Tested With

- Shopify App Template (Node.js)
- Shopify CLI 3.x
- Remix-based apps

## 🤝 Contribution

Found more noisy patterns? Submit a PR!
