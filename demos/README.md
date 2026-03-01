# NAAb Passage - Demo Scripts

Visual demonstrations of Passage's PII protection and data gateway capabilities.

## Quick Start

```bash
# Run the interactive demo
./passage-demo.sh
```

The demo will:
1. Process a clean request (ALLOWED)
2. Detect PII in request (BLOCKED)
3. Catch schema smuggling attack (BLOCKED)
4. Show risk scoring and policy enforcement

## Recording for README

### Option 1: Screenshot (easiest)
```bash
# Run demo
./passage-demo.sh

# Screenshot the PII detection section (shows red BLOCKED)
# On Termux: Use Android screenshot (Power + Volume Down)
```

### Option 2: Terminal Recording
```bash
# Install asciinema (optional)
pkg install asciinema

# Record the demo
asciinema rec passage-demo.cast
./passage-demo.sh
# Press Ctrl+D when done

# Upload to asciinema.org
asciinema upload passage-demo.cast
```

### Option 3: Live Test (if Passage is running)
```bash
# Start Passage gateway in one terminal
cd ~/naab-passage
./naab/build/naab-lang main.naab

# In another terminal, send test requests
curl -X POST http://localhost:8091/ \
  -H "Content-Type: application/json" \
  -d @demos/examples/clean_request.json

curl -X POST http://localhost:8091/ \
  -H "Content-Type: application/json" \
  -d @demos/examples/pii_request.json
```

## Files

- `passage-demo.sh` - Interactive demo script
- `examples/clean_request.json` - Safe API request
- `examples/pii_request.json` - Request with SSN, credit card, email
- `examples/smuggling_attack.json` - Schema smuggling attempt

## What the Demo Shows

- ✓ Schema validation
- ✓ PII detection (SSN, credit cards, emails)
- ✓ Risk scoring
- ✓ Policy enforcement (BLOCK/ALLOW)
- ✓ Anti-smuggling protection

## Customizing

Edit `passage-demo.sh` to:
- Add more PII patterns
- Change risk thresholds
- Show redaction examples
- Add audit logging output
