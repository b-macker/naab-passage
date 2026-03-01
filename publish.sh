#!/bin/bash
# NAAb Passage - GitHub Publication Script
set -e

REPO_NAME="naab-passage"
REPO_OWNER="b-macker"
REPO_DESC="Sovereign data gateway and PII protection platform - Part of the NAAb Ecosystem"

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║         NAAb Passage - GitHub Publication                 ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Check if we're in the right directory
if [ ! -f "main.naab" ]; then
    echo "❌ Error: Not in naab-passage directory"
    exit 1
fi

echo "📋 Repository: $REPO_OWNER/$REPO_NAME"
echo "📝 Description: $REPO_DESC"
echo ""

# Check if gh is authenticated
echo "🔐 Checking GitHub CLI authentication..."
if gh auth status &>/dev/null; then
    echo "✅ GitHub CLI authenticated"
    USE_GH=true
else
    echo "⚠️  GitHub CLI not authenticated"
    echo ""
    echo "Options:"
    echo "  1. Authenticate gh CLI now (recommended)"
    echo "  2. Manual setup (create repo on GitHub web, push manually)"
    echo ""
    read -p "Choose option (1 or 2): " choice

    if [ "$choice" = "1" ]; then
        echo ""
        echo "Running: gh auth login"
        gh auth login
        USE_GH=true
    else
        USE_GH=false
    fi
fi

if [ "$USE_GH" = true ]; then
    echo ""
    echo "📦 Creating GitHub repository..."

    # Check if repo already exists
    if gh repo view "$REPO_OWNER/$REPO_NAME" &>/dev/null; then
        echo "⚠️  Repository already exists"
        read -p "Continue with push anyway? (y/n): " confirm
        if [ "$confirm" != "y" ]; then
            echo "Aborted"
            exit 0
        fi
    else
        # Create repository
        gh repo create "$REPO_NAME" --public \
            --description "$REPO_DESC" \
            --source=. \
            --remote=origin
        echo "✅ Repository created"
    fi

    echo ""
    echo "⬆️  Pushing to GitHub..."
    git push -u origin main
    echo "✅ Pushed to main branch"

    echo ""
    echo "🏷️  Creating v1.0.0 tag..."
    git tag -a v1.0.0 -m "NAAb Passage v1.0.0 - Production Release" 2>/dev/null || echo "Tag already exists"
    git push origin v1.0.0
    echo "✅ Tag pushed"

    echo ""
    echo "📝 Creating GitHub Release..."
    gh release create v1.0.0 \
        --title "NAAb Passage v1.0.0 - Production Release" \
        --notes "First production release of NAAb Passage - sovereign data gateway and PII protection platform.

## Features
- ✅ Sovereign architecture with NAAb brain
- ✅ Self-synthesizing polyglot workers (Go, Rust)
- ✅ PII detection (SSN, credit cards, emails, secrets)
- ✅ Schema enforcement (anti-smuggling protection)
- ✅ Hardware isolation (CPU pinning, network namespaces)
- ✅ Forensic source shredding (3-pass overwrite)
- ✅ SHA-256 binary caching
- ✅ Complete test suite

## Quick Start
\`\`\`bash
git clone --recursive https://github.com/$REPO_OWNER/$REPO_NAME.git
cd $REPO_NAME
bash build.sh
./naab/build/naab-lang main.naab
\`\`\`

## Part of the NAAb Ecosystem
- [NAAb Language](https://github.com/b-macker/NAAb)
- [NAAb BOLO](https://github.com/b-macker/naab-bolo)
- [NAAb Passage](https://github.com/b-macker/naab-passage) (this project)

---

🤖 Built with NAAb - Polyglot scripting with governance" 2>/dev/null || echo "Release may already exist"

    echo ""
    echo "═══════════════════════════════════════════════════════════"
    echo "✅ Publication Complete!"
    echo "═══════════════════════════════════════════════════════════"
    echo ""
    echo "🌐 Repository: https://github.com/$REPO_OWNER/$REPO_NAME"
    echo "📦 Release: https://github.com/$REPO_OWNER/$REPO_NAME/releases/tag/v1.0.0"
    echo ""

else
    # Manual instructions
    echo ""
    echo "═══════════════════════════════════════════════════════════"
    echo "📋 Manual Setup Instructions"
    echo "═══════════════════════════════════════════════════════════"
    echo ""
    echo "1. Create repository on GitHub:"
    echo "   https://github.com/new"
    echo ""
    echo "   Repository name: $REPO_NAME"
    echo "   Description: $REPO_DESC"
    echo "   Visibility: Public"
    echo ""
    echo "2. After creating, run these commands:"
    echo ""
    echo "   git remote add origin git@github.com:$REPO_OWNER/$REPO_NAME.git"
    echo "   git push -u origin main"
    echo "   git tag -a v1.0.0 -m \"NAAb Passage v1.0.0\""
    echo "   git push origin v1.0.0"
    echo ""
    echo "3. Create release on GitHub:"
    echo "   https://github.com/$REPO_OWNER/$REPO_NAME/releases/new"
    echo ""
fi
