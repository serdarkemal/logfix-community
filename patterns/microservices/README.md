# Microservices (gRPC/REST) Patterns

Noise reduction patterns for microservices architectures.

## 🎯 Use Case

Filter out service mesh health checks, load balancer pings, and inter-service communication noise.

## 📁 Files

- `grpc-patterns.yaml` - gRPC-specific patterns
- `rest-patterns.yaml` - REST API patterns

## 🚀 Usage

```bash
# Use with your microservice
./your-service 2>&1 | logfix --patterns grpc-patterns.yaml
```

## 📊 Expected Results

- **Before:** 1000+ log lines (health checks every 5s)
- **After:** ~50 critical lines
- **Reduction:** ~95%

## 🔧 Patterns Included

**gRPC:**
- Health check responses
- Circuit breaker status
- Load balancer pings
- Service discovery

**REST:**
- /health endpoints
- /metrics requests
- CORS preflight
- Keep-alive checks

## ✅ Tested With

- Kubernetes clusters
- Istio service mesh
- Envoy proxy
- Consul service discovery

## 🤝 Contribution

Add your service mesh patterns via PR!
