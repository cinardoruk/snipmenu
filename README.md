# snipmenu

A simple snippet manager using dmenu for quick access to text snippets.

## Features

- **Create** new snippets
- **Read** snippets (copy to clipboard)
- **Update** existing snippets
- **Delete** snippets
- Stores snippets in `~/.config/snipmenu/snippets`

## Dependencies

- `dmenu` - Menu interface
- `xclip` - Clipboard management
- `$EDITOR` - Your preferred text editor

## Installation

```bash
git clone https://github.com/YOUR_USERNAME/snipmenu.git
cd snipmenu
chmod +x snipmenu.sh
```

Optionally, add to your PATH:
```bash
sudo cp snipmenu.sh /usr/local/bin/snipmenu
```

## Usage

```bash
./snipmenu.sh create    # Create new snippet
./snipmenu.sh read      # Select and copy snippet to clipboard
./snipmenu.sh update    # Edit existing snippet
./snipmenu.sh delete    # Delete snippet
```

## Keybindings (suggested)

Add to your window manager config:

```bash
# Example for i3/sway
bindsym $mod+s exec ~/path/to/snipmenu.sh read
```

## License

MIT
