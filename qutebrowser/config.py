# Autogenerated config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'w': 'session-save', 'wq': 'quit --save', 'foo': 'message-info foo'}

# Load a restored tab as soon as it takes focus.
# Type: Bool
c.session.lazy_restore = True

# Backend to use to display websites. qutebrowser supports two different
# web rendering engines / backends, QtWebKit and QtWebEngine. QtWebKit
# was discontinued by the Qt project with Qt 5.6, but picked up as a
# well maintained fork: https://github.com/annulen/webkit/wiki -
# qutebrowser only supports the fork. QtWebEngine is Qt's official
# successor to QtWebKit. It's slightly more resource hungry than
# QtWebKit and has a couple of missing features in qutebrowser, but is
# generally the preferred choice.
# Type: String
# Valid values:
#   - webengine: Use QtWebEngine (based on Chromium).
#   - webkit: Use QtWebKit (based on WebKit, similar to Safari).
c.backend = 'webengine'

# Time interval (in milliseconds) between auto-saves of
# config/cookies/etc.
# Type: Int
c.auto_save.interval = 60000

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Allow websites to lock your mouse pointer.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.mouse_lock = False

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://drive.google.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to record audio/video.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.media.audio_video_capture', True, 'https://teams.microsoft.com')

# Allow websites to register protocol handlers via
# `navigator.registerProtocolHandler`.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.register_protocol_handler', False, 'https://mail.google.com?extsrc=mailto&url=%25s')

# Number of commands to save in the command history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.cmd_history_max_items = 1000

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = '64%'

# Shrink the completion to be smaller than the configured size if there
# are no scrollbars.
# Type: Bool
c.completion.shrink = False

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '/home/alex/downloads'

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = True

# What to display in the download filename input.
# Type: String
# Valid values:
#   - path: Show only the download path.
#   - filename: Show only download filename.
#   - both: Show download path and filename.
c.downloads.location.suggestion = 'path'

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = 'bottom'

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = -1

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined:  * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['st', '-c', 'quick-editor', 'vim', '{}']

# Encoding to use for the editor.
# Type: Encoding
c.editor.encoding = 'utf-8'

# Languages to use for spell checking. You can check for available
# languages and install dictionaries using scripts/dictcli.py. Run the
# script with -h/--help for instructions.
# Type: List of String
# Valid values:
#   - af-ZA: Afrikaans (South Africa)
#   - bg-BG: Bulgarian (Bulgaria)
#   - ca-ES: Catalan (Spain)
#   - cs-CZ: Czech (Czech Republic)
#   - da-DK: Danish (Denmark)
#   - de-DE: German (Germany)
#   - el-GR: Greek (Greece)
#   - en-AU: English (Australia)
#   - en-CA: English (Canada)
#   - en-GB: English (United Kingdom)
#   - en-US: English (United States)
#   - es-ES: Spanish (Spain)
#   - et-EE: Estonian (Estonia)
#   - fa-IR: Farsi (Iran)
#   - fo-FO: Faroese (Faroe Islands)
#   - fr-FR: French (France)
#   - he-IL: Hebrew (Israel)
#   - hi-IN: Hindi (India)
#   - hr-HR: Croatian (Croatia)
#   - hu-HU: Hungarian (Hungary)
#   - id-ID: Indonesian (Indonesia)
#   - it-IT: Italian (Italy)
#   - ko: Korean
#   - lt-LT: Lithuanian (Lithuania)
#   - lv-LV: Latvian (Latvia)
#   - nb-NO: Norwegian (Norway)
#   - nl-NL: Dutch (Netherlands)
#   - pl-PL: Polish (Poland)
#   - pt-BR: Portuguese (Brazil)
#   - pt-PT: Portuguese (Portugal)
#   - ro-RO: Romanian (Romania)
#   - ru-RU: Russian (Russia)
#   - sh: Serbo-Croatian
#   - sk-SK: Slovak (Slovakia)
#   - sl-SI: Slovenian (Slovenia)
#   - sq: Albanian
#   - sr: Serbian
#   - sv-SE: Swedish (Sweden)
#   - ta-IN: Tamil (India)
#   - tg-TG: Tajik (Tajikistan)
#   - tr-TR: Turkish (Turkey)
#   - uk-UA: Ukrainian (Ukraine)
#   - vi-VN: Vietnamese (Viet Nam)
c.spellcheck.languages = []

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# Which tab to select when the focused tab is removed.
# Type: SelectOnRemove
# Valid values:
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
#   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = 'prev'

# Width (in pixels or as percentage of the window) of the tab bar if
# it's vertical.
# Type: PercOrInt
c.tabs.width = '2%'

# Wrap when changing tabs.
# Type: Bool
c.tabs.wrap = True

# Default zoom level.
# Type: Perc
c.zoom.default = '125%'

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = '#d8dee9'

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#2e3440'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#2e3440'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#e5e9f0'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = '#3b4252'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#3b4252'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#3b4252'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#2e3440'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#81a1c1'

# Top border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.top = '#4c566a'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = '#4c566a'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#b48ead'
c.colors.completion.item.selected.match.fg = '#e5e9f0'
#c.colors.completion.item.selected.match.fg = '#b48ead'


# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = '#3b4252'

# Color of the scrollbar in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.bg = '#2e3440'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = '#2e3440'

# Color gradient stop for download backgrounds.
# Type: QtColor
c.colors.downloads.stop.bg = '#88c0d0'
c.colors.downloads.start.bg = '#4c566a'
c.colors.downloads.start.fg = '#88c0d0'
c.colors.downloads.stop.fg = '#4c566a'

# Color gradient interpolation system for download backgrounds.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.downloads.system.bg = 'none'

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = '#e5e9f0'

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = '#bf616a'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#2e3440'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = '#88c0d0'

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = '#bf616a'

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = '#2e3440'

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = '#e5e9f0'

# Background color of the keyhint widget.
# Type: QssColor
c.colors.keyhint.bg = '#81a1c1'

# Foreground color of an error message.
# Type: QssColor
c.colors.messages.error.fg = '#2e3440'

# Background color of an error message.
# Type: QssColor
c.colors.messages.error.bg = '#bf616a'

# Border color of an error message.
# Type: QssColor
c.colors.messages.error.border = '#bf616a'

# Foreground color of a warning message.
# Type: QssColor
c.colors.messages.warning.fg = '#2e3440'

# Background color of a warning message.
# Type: QssColor
c.colors.messages.warning.bg = '#d08770'

# Border color of a warning message.
# Type: QssColor
c.colors.messages.warning.border = '#d08770'

# Foreground color of an info message.
# Type: QssColor
c.colors.messages.info.fg = '#e5e9f0'

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = '#81a1c1'

# Border color of an info message.
# Type: QssColor
c.colors.messages.info.border = '#81a1c1'

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = '#e5e9f0'

# Border used around UI elements in prompts.
# Type: String
c.colors.prompts.border = '1px solid #e5e9f0'

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = '#2e3440'

# Background color for the selected item in filename prompts.
# Type: QssColor
c.colors.prompts.selected.bg = '#80a1c1'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = '#e5e9f0'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#2e3440'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = '#3b4252'

# Background color of the statusbar in insert mode.
# Type: QssColor
#c.colors.statusbar.insert.bg = '#46c9b3'
c.colors.statusbar.insert.bg = '#81a1c1'

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.fg = '#e5e9f0'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#5e81ac'

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = '#e5e9f0'

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = '#4c566a'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = '#e5e9f0'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#434c5e'

# Foreground color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.fg = '#e5e9f0'

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = '#434c5e'

# Foreground color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.fg = '#e5e9f0'

# Background color of the statusbar in caret mode.
# Type: QssColor
c.colors.statusbar.caret.bg = '#b48ead'

# Foreground color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.fg = '#e5e9f0'

# Background color of the statusbar in caret mode with a selection.
# Type: QssColor
c.colors.statusbar.caret.selection.bg = '#b48ead'

# Background color of the progress bar.
# Type: QssColor
c.colors.statusbar.progress.bg = '#e5e9f0'

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = '#e5e9f0'

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = '#bf616a'

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = '#88c0d0'

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = '#e5e9f0'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = '#81a1c1'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = '#d08770'

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = '#2e3440'

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = '#bf616a'
c.colors.tabs.indicator.stop = '#81a1c1'
c.colors.tabs.indicator.start = '#2e3440'

# Color gradient interpolation system for the tab indicator.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.tabs.indicator.system = 'RGB'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#e5e9f0'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#2e3440'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#e5e9f0'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#2e3440'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = '#2e3440'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#81a1c1'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#2e3440'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#81a1c1'

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
c.colors.webpage.bg = '#2e3440'


c.colors.contextmenu.menu.bg = '#2e3440'
c.colors.contextmenu.menu.fg = '#e5e9f0'
c.colors.contextmenu.selected.bg = '#81a1c1'
c.colors.contextmenu.selected.fg = '#2e3440'
c.colors.contextmenu.disabled.bg = '#4c566a'

# Default font families to use. Whenever "default_family" is used in a
# font setting, it's replaced with the fonts listed here. If set to an
# empty value, a system-specific monospace default is used.
# Type: List of Font, or Font
c.fonts.default_family = ['Iosevka', 'Hack', 'Oxygen Mono', 'xos4 Terminus', 'Terminus']

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '14pt default_family'

c.fonts.contextmenu = '14pt default_family'
# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'bold 14pt default_family'

# Font used for the debugging console.
# Type: Font
c.fonts.debug_console = '14pt default_family'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = '14pt default_family'

# Font used for the hints.
# Type: Font
c.fonts.hints = 'bold 14pt default_family'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = '14pt default_family'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = '14pt default_family'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = '14pt default_family'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = '10pt default_family'

# Font used for prompts.
# Type: Font
c.fonts.prompts = '14pt default_family'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '14pt default_family'

# Font used for selected tabs.
# Type: Font
c.fonts.tabs.selected = '12pt default_family'

c.tabs.show = 'switching'
c.tabs.show_switching_delay = 5000

c.statusbar.show = 'in-mode'


# Font used for unselected tabs.
# Type: Font
c.fonts.tabs.unselected = '12pt default_family'


c.fonts.web.family.standard = 'Iosevka'

# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {'<Ctrl+[>': '<Escape>', '<Ctrl+6>': '<Ctrl+^>', '<Ctrl+m>': '<Return>', '<Ctrl+j>': '<Return>', '<Ctrl+i>': '<Tab>', '<Shift+Return>': '<Return>', '<Enter>': '<Return>', '<Shift+Enter>': '<Return>', '<Ctrl+Enter>': '<Ctrl+Return>', '<Alt+Right>': 'J', '<Alt+Left>': 'K'}

# Bindings for normal mode
config.bind('<Alt+Shift+Left>', 'tab-move -')
config.bind('<Alt+Shift+Right>', 'tab-move +')
# Change speed of youtube playlist
config.bind('<Ctrl+\>', "jseval document.getElementsByClassName('html5-main-video')[0].playbackRate = document.getElementsByClassName('html5-main-video')[0].playbackRate + 0.25")
config.bind("<Ctrl+'>", "jseval document.getElementsByClassName('html5-main-video')[0].playbackRate = document.getElementsByClassName('html5-main-video')[0].playbackRate - 0.25")
config.bind('<Ctrl+[>', "jseval document.getElementsByClassName('html5-main-video')[0].playbackRate = 1")
config.bind('<Ctrl+]>', "jseval document.getElementsByClassName('html5-main-video')[0].playbackRate = 2.5")
config.bind('  ', "jseval document.getElementsByClassName('html5-main-video')[0].paused ? document.getElementsByClassName('html5-main-video')[0].play() : document.getElementsByClassName('html5-main-video')[0].pause();  'Toggle play'")
config.bind('{', 'scroll-page 0 -0.5')
config.bind('}', 'scroll-page 0 0.5')

# Dark mode set
config.set('colors.webpage.darkmode.enabled', True)

config.bind('M', 'hint links spawn mpv --ytdl-format="bestvideo[height<=480]+bestaudio/best[height<=480]" {hint-url}')
config.bind(' r', 'spawn --userscript readability')
config.bind(' p', 'spawn --userscript playlist/addTrackToPlaylist.sh')
config.bind(',c', 'spawn --userscript keep_ytchannel.sh')
config.bind(',k', 'spawn --userscript keep_tracks.sh')
config.bind(' l', 'hint links userscript add_track_to_playlist.sh')

config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')

config.bind(',ap', 'config-cycle content.user_stylesheets /home/alex/.config/perso/qutebrowser/themes/custom_css/nord-dark-all-sites.css ""')

config.load_autoconfig(False)
