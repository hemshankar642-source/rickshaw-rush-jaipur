# Rickshaw Rush — Jaipur Street Dash

A fast-paced HTML5 arcade driving game set across Jaipur-inspired routes.

## Play

https://hemshankar642-source.github.io/rickshaw-rush-jaipur/

## Updating the game

The Android app loads the latest HTTPS version when it opens and falls back to its bundled offline copy if the network is unavailable.

After cloning this repository and signing in to Git once, run this from PowerShell:

```powershell
.\update-game.ps1 -SourceFile "C:\path\to\new-index.html" -Message "Improve Jaipur traffic"
```

The script replaces `index.html`, commits it, and pushes to `main`. GitHub Pages then deploys the change automatically. Players receive the new game the next time they open the Android app online—no new APK is needed for HTML/CSS/JavaScript game updates.

A new APK is only required when native Android settings, permissions, package details, or app-store SDK code changes.

## Controls

- Touch: swipe left/right, boost and horn buttons
- Keyboard: arrow keys or A/D to steer, W/Up to boost, Space to horn
- P/Escape to pause and R to restart
