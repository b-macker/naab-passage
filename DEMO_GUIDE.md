# NAAb Passage - Recording Demos for GitHub

This guide shows how to create visual demos for your README.

## Quick Demo

```bash
cd demos
./passage-demo.sh
```

This runs an **automated demo** showing Passage blocking PII and detecting smuggling attacks.

---

## Recording Options

### Option 1: Screenshot (Easiest) ⭐

**Best for:** Quick visual proof, no tools needed

1. Run the demo:
   ```bash
   ./passage-demo.sh
   ```

2. Screenshot the PII detection section (red BLOCKED):
   - **Termux**: Power + Volume Down
   - **Desktop**: Your OS screenshot tool

3. Add to README:
   ```markdown
   ![Passage PII Detection](demos/pii-blocked.png)
   ```

**Recommended screenshots:**
- Test 2: PII detection showing SSN, credit card, email
- The red "REQUEST BLOCKED" message
- The summary showing 1 allowed, 2 blocked

---

### Option 2: Terminal Recording with asciinema

**Best for:** Embeddable terminal player

1. Install asciinema:
   ```bash
   pkg install asciinema
   ```

2. Record:
   ```bash
   asciinema rec passage-demo.cast
   ./passage-demo.sh
   # Press Ctrl+D when done
   ```

3. Upload:
   ```bash
   asciinema upload passage-demo.cast
   ```

4. Add to README:
   ```markdown
   [![asciicast](https://asciinema.org/a/YOUR_ID.svg)](https://asciinema.org/a/YOUR_ID)
   ```

---

### Option 3: Live Demo (Most Impressive)

**Best for:** Real-world demonstration

1. Start Passage:
   ```bash
   ./naab/build/naab-lang main.naab
   ```

2. In another terminal, send requests:
   ```bash
   # Clean request - ALLOWED
   curl -X POST http://localhost:8091/ \
     -H "Content-Type: application/json" \
     -d @demos/examples/clean_request.json

   # PII request - BLOCKED
   curl -X POST http://localhost:8091/ \
     -H "Content-Type: application/json" \
     -d @demos/examples/pii_request.json
   ```

3. Screenshot both the gateway output AND curl responses

---

## What to Capture

### Key Moments:

1. **Clean Request** (green ✓)
   - All checks passing
   - Risk score: 0
   - "REQUEST ALLOWED"

2. **PII Detection** (most important!)
   - Red ✗ marks
   - SSN detected: 123-45-6789
   - Credit card detected: 4532-****-****-9010
   - Email detected: john.doe@example.com
   - Risk score: 200
   - "REQUEST BLOCKED"

3. **Anti-Smuggling**
   - Schema validation failure
   - _hidden_payload detected
   - "REQUEST BLOCKED"

---

## Adding to README

### Example 1: Side-by-Side Comparison
```markdown
## How It Works

| Clean Request ✓ | PII Detected ✗ |
|----------------|----------------|
| ![Allowed](demos/allowed.png) | ![Blocked](demos/blocked.png) |

**Passage detected and blocked:**
- Social Security Numbers (SSN)
- Credit card numbers
- Email addresses
- Schema smuggling attempts
```

### Example 2: Flow Diagram
```markdown
## Demo

**Input:** API request with SSN `123-45-6789`

**Passage Processing:**
1. ✓ Schema validation
2. ✗ PII detection: SSN found (score: 100)
3. ✗ Risk score: 100 (threshold: 90)
4. 🛑 Action: BLOCK

**Output:** Request blocked with reason: "High-risk PII detected"

![PII Detection Demo](demos/pii-detection.png)
```

---

## Tips for Best Results

- **Show the red BLOCKED**: Very visual and impactful
- **Highlight PII patterns**: SSN, credit cards make it real
- **Include risk scores**: Shows the math behind decisions
- **Show success case too**: Green ALLOWED builds trust

---

## Editing the Demo

The demo script is at `demos/passage-demo.sh`. You can:

- Add more PII patterns (phone numbers, addresses)
- Change risk score thresholds
- Add custom examples from your use case
- Show redaction instead of blocking

Example custom PII:
```json
{
  "model": "gpt-4",
  "messages": [{
    "role": "user",
    "content": "My phone is 555-123-4567 and I live at 123 Main St"
  }]
}
```

---

## Real-World Examples

### LLM Gateway Protection
```markdown
## Use Case: ChatGPT Proxy

Passage sits between your app and OpenAI, ensuring zero PII leakage:

![Gateway Flow](demos/gateway-flow.png)

**Before Passage:**
- User accidentally pastes SSN in prompt
- Sent directly to OpenAI
- 💥 PII leakage

**With Passage:**
- User pastes SSN in prompt
- Passage detects and blocks
- ✅ Zero PII leakage
```
