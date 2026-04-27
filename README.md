# completeDiscordQuest

A Vencord plugin that automatically completes Discord quests in the background.

> **Note:** This plugin requires building Vencord from source. The official Vencord installer won't work with userplugins.

---

## Quick Install (Windows)

### Prerequisites
You need these installed first:
- **Node.js v18+** - [Download](https://nodejs.org/) (LTS version recommended)
- **Git** - [Download](https://git-scm.com/download/win)
- **pnpm** - Run `npm install -g pnpm` after installing Node.js

### First Time Setup

1. **Clone Vencord** (if you haven't already):
   ```powershell
   cd $HOME\Documents
   git clone https://github.com/Vendicated/Vencord.git
   cd Vencord
   pnpm install --frozen-lockfile
   ```

2. **Add the Plugin**:
   - [Download the latest release ZIP](https://github.com/h1z1z1h16584/completeDiscordQuest/archive/refs/heads/main.zip)
   - Extract the files into: `Vencord\src\userplugins\completeDiscordQuest`

3. **Run the Installer**:
   - Navigate to the plugin folder and double-click **`Run Update.bat`**.
   - **Select Option 1 (Local Update)** for the initial setup.
   - The script will:
     - **Kill Discord** to prevent file lock errors.
     - Sync the files and run `pnpm build`.
     - **Auto-restart Discord** once finished.

4. **Enable the Plugin**:
   - Open Discord.
   - Go to **Settings → Vencord → Plugins**.
   - Search for **completeDiscordQuest** and enable it.

---

## Updating

This plugin features a smart "Dual-Mode" updater. To update, simply run **`Run Update.bat`** and choose your method:

### Option 1: Local Update
Use this if you have manually modified the plugin files or downloaded a new ZIP. It syncs your current folder to the Vencord source.

### Option 2: Online Update (Recommended)
Use this to automatically fetch the latest official bug fixes and features directly from GitHub. It performs a `git fetch` and `rebase` before rebuilding.

---

## Supported Quest Types

| Quest Type | Desktop |
| :--- | :---: | :---: |
| Video Quests | ✅ |
| Desktop Gameplay | ✅ |
| Stream Quests | ✅ |
| Activity Quests | ✅ |


---

## Troubleshooting

**Discord doesn't close or restart?**
- The script targets the standard `Discord.exe`. If you use **Discord Canary** or **PTB**, edit the `.ps1` files and change the `Stop-Process` name to match your version.

**"pnpm: command not found"**
- Ensure you ran `npm install -g pnpm`. You may need to restart your terminal or computer for the changes to take effect.

---

## Uninstalling

1. Delete the folder: `Vencord\src\userplugins\completeDiscordQuest`
2. Re-build Vencord to clean the injection:
   ```powershell
   cd $HOME\Documents\Vencord
   pnpm build
   pnpm inject
   ```
3. Restart Discord.
