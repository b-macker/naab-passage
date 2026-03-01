#!/bin/bash
# NAAb Passage - GitHub Publication Script (SSH)
set -e

REPO_NAME="naab-passage"
REPO_OWNER="b-macker"

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║         NAAb Passage - GitHub Publication (SSH)           ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Check if we're in the right directory
if [ ! -f "main.naab" ]; then
    echo "❌ Error: Not in naab-passage directory"
    exit 1
fi

echo "📋 Repository: $REPO_OWNER/$REPO_NAME"
echo ""

# Check if repository exists on GitHub by trying to fetch
echo "🔍 Checking if repository exists on GitHub..."
if git ls-remote git@github.com:$REPO_OWNER/$REPO_NAME.git &>/dev/null; then
    echo "✅ Repository exists on GitHub"
    REPO_EXISTS=true
else
    echo "⚠️  Repository does not exist on GitHub yet"
    REPO_EXISTS=false
fi

if [ "$REPO_EXISTS" = false ]; then
    echo ""
    echo "📝 Please create the repository on GitHub first:"
    echo ""
    echo "   1. Go to: https://github.com/new"
    echo "   2. Repository name: $REPO_NAME"
    echo "   3. Description: Sovereign data gateway and PII protection platform - Part of the NAAb Ecosystem"
    echo "   4. Visibility: Public"
    echo "   5. Click 'Create repository'"
    echo ""
    read -p "Press Enter when repository is created..."
fi

# Add remote if not already added
echo ""
echo "🔗 Setting up remote..."
if git remote get-url origin &>/dev/null; then
    echo "Remote 'origin' already exists"
    CURRENT_URL=$(git remote get-url origin)
    echo "Current URL: $CURRENT_URL"
else
    git remote add origin git@github.com:$REPO_OWNER/$REPO_NAME.git
    echo "✅ Remote 'origin' added"
fi

# Push to main
echo ""
echo "⬆️  Pushing to main branch..."
if git push -u origin main; then
    echo "✅ Pushed to main branch"
else
    echo "❌ Push failed - check SSH keys and repository access"
    exit 1
fi

# Create and push tag
echo ""
echo "🏷️  Creating v1.0.0 tag..."
if git tag -a v1.0.0 -m "NAAb Passage v1.0.0 - Production Release" 2>/dev/null; then
    echo "✅ Tag created"
else
    echo "⚠️  Tag already exists locally"
fi

echo "⬆️  Pushing tag..."
if git push origin v1.0.0; then
    echo "✅ Tag pushed"
else
    echo "⚠️  Tag may already exist on remote"
fi

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "✅ Publication Complete!"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "🌐 Repository: https://github.com/$REPO_OWNER/$REPO_NAME"
echo "📦 Releases: https://github.com/$REPO_OWNER/$REPO_NAME/releases"
echo ""
echo "Next steps:"
echo "  1. Create release on GitHub: https://github.com/$REPO_OWNER/$REPO_NAME/releases/new"
echo "     - Tag: v1.0.0"
echo "     - Title: NAAb Passage v1.0.0 - Production Release"
echo "  2. Update NAAb ecosystem docs to include Passage"
echo ""
