#!/bin/bash
# Deploy script for SRS Recovery Tools
# Pushes to both GitHub and GitLab

echo "🚀 Deploying SRS Recovery Tools..."

# Add and commit any changes
if [[ -n $(git status -s) ]]; then
    echo "📝 Committing changes..."
    git add .
    git commit -m "$1"
fi

# Push to GitHub (public, GitHub Pages)
echo "📤 Pushing to GitHub..."
git push origin main

# Push to GitLab (private backup)
echo "📤 Pushing to GitLab..."
git push gitlab main

# Check GitHub Pages status
echo "🌐 Checking deployment status..."
sleep 2
gh api repos/JackReis/srs-recovery-tools/pages | grep status

echo "✅ Deployment complete!"
echo ""
echo "🔗 Live URLs:"
echo "  GitHub Pages: https://jackreis.github.io/srs-recovery-tools/"
echo "  GitHub Repo:  https://github.com/JackReis/srs-recovery-tools"
echo "  GitLab Repo:  https://gitlab.com/jackrei/srs-recovery-tools"
echo ""
echo "💡 For Google Cloud deployment, see GOOGLE-CLOUD-DEPLOYMENT.md"