# Hide/ Reveal User Experience Flow

## Overview
User wants to hide a selected folder/file from File Explorer/Finder, but keep it on disk. Visibility is toggled via a terminal command with an optional secret code.

## Workflow

### 1. Hide
1. User runs: `reveal.sh hide /path/to/secret_folder`
2. Script prompts for secret code (if configured)
3. On correct code:
   - Windows: `attrib +h "/path/to/secret_folder"`
   - macOS: `chflags hidden "/path/to/secret_folder"`
   - Linux: `mv "/path/to/secret_folder" "/path/to/.secret_folder"`
4. Folder disappears from normal file manager view
5. Script outputs: `Hidden: /path/to/secret_folder`

### 2. Reveal
1. User runs: `reveal.sh show /path/to/secret_folder` or `reveal.sh toggle`
2. Script prompts for secret code
3. On correct code:
   - Windows: `attrib -h "/path/to/secret_folder"`
   - macOS: `chflags nohidden "/path/to/secret_folder"`
   - Linux: `mv "/path/to/.secret_folder" "/path/to/secret_folder"`
4. Folder reappears instantly in file manager
5. Script outputs: `Shown: /path/to/secret_folder`

### 3. Safety
- No data is moved off disk, only attributes/renames
- Reversible with one command
- Optional password gate prevents accidental reveal
- Dry-run mode: `--dry-run` prints commands without executing
