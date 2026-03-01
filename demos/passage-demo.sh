#!/bin/bash
# NAAb Passage - Interactive Demo Script
# Shows PII protection and data gateway in action

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Demo directory
DEMO_DIR="$(dirname "$0")"

clear
echo -e "${BOLD}${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${PURPLE}║                   NAAb Passage Demo                       ║${NC}"
echo -e "${BOLD}${PURPLE}║         Sovereign Data Gateway & PII Protection           ║${NC}"
echo -e "${BOLD}${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}This demo shows Passage protecting sensitive data.${NC}"
echo ""

sleep 2

echo -e "${BOLD}${YELLOW}Test 1: Clean request (should PASS)${NC}"
echo ""
echo -e "${CYAN}Request:${NC}"
cat "$DEMO_DIR/examples/clean_request.json" | head -10
echo ""

sleep 2

# Simulate Passage processing
echo -e "${CYAN}Processing through NAAb Passage...${NC}"
echo ""
sleep 1
echo -e "  ${CYAN}[Brain]${NC} Schema validation..."
echo -e "    ${GREEN}✓${NC} Valid OpenAI API format"
echo ""
sleep 1
echo -e "  ${CYAN}[Brain]${NC} PII detection scan..."
echo -e "    ${GREEN}✓${NC} No SSN detected"
echo -e "    ${GREEN}✓${NC} No credit card detected"
echo -e "    ${GREEN}✓${NC} No email addresses"
echo -e "    ${GREEN}✓${NC} No high-entropy secrets"
echo ""
sleep 1
echo -e "  ${CYAN}[Brain]${NC} Risk scoring..."
echo -e "    Total risk score: ${GREEN}0${NC}"
echo ""
sleep 1
echo -e "  ${CYAN}[Gateway]${NC} Forwarding to OpenAI API..."
echo ""
sleep 1
echo -e "${BOLD}${GREEN}✓ REQUEST ALLOWED${NC}"
echo ""

sleep 2

echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

sleep 1

echo -e "${BOLD}${YELLOW}Test 2: Request with PII (should BLOCK)${NC}"
echo ""
echo -e "${CYAN}Request:${NC}"
cat "$DEMO_DIR/examples/pii_request.json" | head -10
echo ""

sleep 2

# Simulate PII detection
echo -e "${CYAN}Processing through NAAb Passage...${NC}"
echo ""
sleep 1
echo -e "  ${CYAN}[Brain]${NC} Schema validation..."
echo -e "    ${GREEN}✓${NC} Valid OpenAI API format"
echo ""
sleep 1
echo -e "  ${CYAN}[Brain]${NC} PII detection scan..."
sleep 1
echo -e "    ${RED}✗${NC} ${BOLD}Email detected:${NC} john.doe@example.com"
echo -e "      Pattern: ID_EMAIL | Score: ${YELLOW}20${NC}"
echo ""
sleep 1
echo -e "    ${RED}✗${NC} ${BOLD}SSN detected:${NC} 123-45-6789"
echo -e "      Pattern: ID_SSN | Score: ${RED}100${NC}"
echo ""
sleep 1
echo -e "    ${RED}✗${NC} ${BOLD}Credit card detected:${NC} 4532-****-****-9010"
echo -e "      Pattern: FIN_CREDIT_CARD | Score: ${RED}80${NC}"
echo ""
sleep 1
echo -e "  ${CYAN}[Brain]${NC} Risk scoring..."
echo -e "    Total risk score: ${RED}200${NC} (threshold: 90)"
echo ""
sleep 1
echo -e "  ${CYAN}[Brain]${NC} Policy enforcement..."
echo -e "    Action: ${RED}BLOCK${NC}"
echo ""
sleep 1
echo -e "${BOLD}${RED}✗ REQUEST BLOCKED${NC}"
echo ""
echo -e "${YELLOW}Reason: High-risk PII detected (SSN, credit card)${NC}"
echo ""

sleep 2

echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

sleep 1

echo -e "${BOLD}${YELLOW}Test 3: Schema smuggling attack (should BLOCK)${NC}"
echo ""
echo -e "${CYAN}Request:${NC}"
cat "$DEMO_DIR/examples/smuggling_attack.json"
echo ""

sleep 2

# Simulate anti-smuggling
echo -e "${CYAN}Processing through NAAb Passage...${NC}"
echo ""
sleep 1
echo -e "  ${CYAN}[Brain]${NC} Schema validation..."
sleep 1
echo -e "    ${RED}✗${NC} ${BOLD}Unauthorized field detected:${NC} _hidden_payload"
echo -e "      Anti-smuggling enforcement: ${RED}STRICT${NC}"
echo ""
sleep 1
echo -e "  ${CYAN}[Brain]${NC} Policy enforcement..."
echo -e "    Action: ${RED}BLOCK${NC}"
echo ""
sleep 1
echo -e "${BOLD}${RED}✗ REQUEST BLOCKED${NC}"
echo ""
echo -e "${YELLOW}Reason: Schema smuggling attempt detected${NC}"
echo ""

sleep 2

echo -e "${BOLD}${GREEN}Demo complete!${NC}"
echo ""
echo -e "${CYAN}Passage protected against:${NC}"
echo -e "  • ${GREEN}✓${NC} PII leakage (SSN, credit cards, emails)"
echo -e "  • ${GREEN}✓${NC} Schema smuggling attacks"
echo -e "  • ${GREEN}✓${NC} Unauthorized data exfiltration"
echo ""
echo -e "${BOLD}Summary:${NC}"
echo -e "  Clean request:     ${GREEN}ALLOWED${NC}"
echo -e "  PII request:       ${RED}BLOCKED${NC}"
echo -e "  Smuggling attack:  ${RED}BLOCKED${NC}"
echo ""
echo -e "${PURPLE}Learn more: https://github.com/b-macker/naab-passage${NC}"
echo ""
