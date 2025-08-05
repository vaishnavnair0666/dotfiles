# config.py for qutebrowser — Wayland + pywal compatible

import json
from pathlib import Path
config.load_autoconfig(True)
c.editor.command = ['ghostty', '-e', 'nvim', '{}']
# Read pywal colors
wal_colors_path = Path.home() / ".cache" / "wal" / "colors.json"
with open(wal_colors_path) as f:
    wal = json.load(f)

colors = wal["colors"]
special = wal["special"]

# Transparency support
transparent = "#00000000"

# Statusbar
c.colors.statusbar.normal.bg = transparent
c.colors.statusbar.command.bg = transparent
c.colors.statusbar.command.fg = special["foreground"]
c.colors.statusbar.normal.fg = colors["color14"]
c.colors.statusbar.passthrough.fg = colors["color14"]
c.colors.statusbar.url.fg = colors["color13"]
c.colors.statusbar.url.success.https.fg = colors["color13"]
c.colors.statusbar.url.hover.fg = colors["color12"]

# Tabs
c.colors.tabs.even.bg = transparent
c.colors.tabs.odd.bg = transparent
c.colors.tabs.bar.bg = transparent
c.colors.tabs.even.fg = colors["color0"]
c.colors.tabs.odd.fg = colors["color0"]
c.colors.tabs.selected.even.bg = special["foreground"]
c.colors.tabs.selected.odd.bg = special["foreground"]
c.colors.tabs.selected.even.fg = special["background"]
c.colors.tabs.selected.odd.fg = special["background"]

# Completions
c.colors.completion.item.selected.match.fg = colors["color6"]
c.colors.completion.match.fg = colors["color6"]
c.colors.completion.odd.bg = special["background"]
c.colors.completion.even.bg = special["background"]
c.colors.completion.fg = special["foreground"]
c.colors.completion.category.bg = special["background"]
c.colors.completion.category.fg = special["foreground"]
c.colors.completion.item.selected.bg = special["background"]
c.colors.completion.item.selected.fg = special["foreground"]

# Messages / Downloads
c.colors.messages.info.bg = special["background"]
c.colors.messages.info.fg = special["foreground"]
c.colors.messages.error.bg = special["background"]
c.colors.messages.error.fg = special["foreground"]
c.colors.downloads.bar.bg = special["background"]
c.colors.downloads.error.bg = special["background"]
c.colors.downloads.error.fg = special["foreground"]
c.colors.downloads.start.bg = colors["color10"]
c.colors.downloads.start.fg = special["foreground"]
c.colors.downloads.stop.bg = colors["color8"]
c.colors.downloads.stop.fg = special["foreground"]

# Webpage
c.colors.tooltip.bg = special["background"]
c.colors.webpage.bg = special["background"]
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# Tabs + Hints
c.tabs.show = "multiple"
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0
c.tabs.width = '7%'
c.hints.border = special["foreground"]
c.colors.hints.bg = special["background"]
c.colors.hints.fg = special["foreground"]
c.colors.tabs.indicator.start = colors["color10"]
c.colors.tabs.indicator.stop = colors["color8"]

# Fonts
c.fonts.default_family = []
c.fonts.default_size = '13pt'
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'
c.fonts.web.size.default = 20

# Search Engines
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    '!aw': 'https://wiki.archlinux.org/?search={}',
    '!apkg': 'https://archlinux.org/packages/?q={}',
    '!gh': 'https://github.com/search?q={}',
    '!yt': 'https://www.youtube.com/results?search_query={}',
}
c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

# Session / Misc
c.auto_save.session = True
c.tabs.title.format = "{audio}{current_title}"

# Keybindings
config.bind('=', 'cmd-set-text -s :open')
config.bind('h', 'history')
config.bind('cs', 'cmd-set-text -s :config-source')
config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('sH', 'config-cycle statusbar.show always never')
config.bind('T', 'hint links tab')
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('pt', 'open -t -- {clipboard}')
config.bind('qm', 'macro-record')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('gJ', 'tab-move +')
config.bind('gK', 'tab-move -')
config.bind('gm', 'tab-move')

# Privacy
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)

# Adblocking
c.content.blocking.enabled = True
# Uncomment if you install `python-adblock`
# c.content.blocking.method = 'adblock'
# c.content.blocking.adblock.lists = [ ... ]

