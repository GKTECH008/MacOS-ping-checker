# 🖥️ macOS Ping Checker

This is a simple bash script for macOS that uses GUI dialogs (via `osascript`) to prompt the user for a website or IP address, then performs a ping test with two selectable modes: 4 packets or infinite ping.

## 🚀 Features

- ✅ GUI prompt to enter IP or hostname
- 🔄 Select between 4-packet ping or infinite ping
- 📊 Shows average latency after test
- ❌ Alerts when host is unreachable

## 🛠 Requirements

- macOS
- Terminal access
- (Optional) Automator for launching as a native macOS app

## 📦 Installation

1. Clone the repository:

```bash
git clone https://github.com/GKTECH008/macos-ping-check.git
cd macos-ping-check
chmod +x ping_check.sh
