#!/bin/bash
# Script to commit and push the project

cd /Users/maksimborodajenko/Documents/08_Projects/03_Other/07_Test/test

echo "=== Git Status ==="
git status

echo ""
echo "=== Adding all files ==="
git add -A

echo ""
echo "=== Committing ==="
git commit -m "Add ChessTermModalDS component with Chess.com Design System

- Implement Term Definition Modal using real DS components
- Use CcModal, CcButton (x-large), CcCloseButton from @chesscom/design-system
- Add proper dark mode support with --color-text-boldest for title
- Set modal width constraints (min: 300px, max: 400px)
- Configure proper CSS imports and global setup per DS guidelines"

echo ""
echo "=== Pushing to origin/main ==="
git push origin main

echo ""
echo "=== Done ==="
