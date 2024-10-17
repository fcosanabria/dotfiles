# Dotfiles

Here are my dotfiles.

I made a refactor of my dotfiles. I deleted a lot of my configurations, since I'm not using Linux since a couple of years. I'm using macOS now, so I don't need a lot of configurations that I had before.

## Git-free install

```
cd ~/Downloads; curl -#L https://github.com/fcosanabria/dotfiles/tarball/main | tar -xzv --strip-components 1
```

## Karabiner-Elements

This is the modification that I use: [CAPS_LOCK to Hyper/Escape, Hyper + i/j/k/l Vim navigation and others](https://ke-complex-modifications.pqrs.org/#Jesse_Tutorial_Hyper_Plus_Others).

- `Caps` to `Hyper`/`Escape`
    - `Hyper` + `i`/`j`/`k`/`l`: Vim navigation
    - Toggle `Caps` by using `rshift` + `lshift`

> This configuration is only for vainilla ANSI keyboards.

## Shortcuts

Here are my common shorcuts, optimized for a vainilla ANSI keyboard:

### Window management

Here I'm using [yabai](https://github.com/koekeishiya/yabai) for window management and [skhd](https://github.com/koekeishiya/skhd) for shortcuts.

```bash
# Change Focus between external displays
hyper - q : yabai -m display --focus 1
hyper - w : yabai -m display --focus 2
hyper - e : yabai -m display --focus 3

# Change Windows focus within space
alt - j : yabai -m window --focus south
alt - k : yabai -m window --focus north
alt - h : yabai -m window --focus west
alt - l : yabai -m window --focus east

# Swap/move windows
hyper - u : yabai -m window --swap south
hyper - i : yabai -m window --swap north
hyper - y : yabai -m window --swap west
hyper - o : yabai -m window --swap east

# Modifying Windows
hyper - m : yabai -m window --toggle zoom-fullscreen # maximize a window
hyper - b : yabai -m space --balance # balance out tree of windows (resize to occupy same area)
hyper - r : yabai -m space --mirror y-axis                      # flip along y-axis
hyper - c : yabai -m window --toggle float --grid 4:4:1:1:2:2   # toggle window float

# Move window to space number 1-9
hyper - 1 : yabai -m window --space 1
hyper - 2 : yabai -m window --space 2
hyper - 3 : yabai -m window --space 3
hyper - 4 : yabai -m window --space 4
hyper - 5 : yabai -m window --space 5
hyper - 6 : yabai -m window --space 6
hyper - 7 : yabai -m window --space 7
hyper - 8 : yabai -m window --space 8
hyper - 9 : yabai -m window --space 9
```
### Raycast

I'm using [Raycast](https://raycast.com/) for my daily tasks based on my shortcuts. Here are my shortcuts:

- Manage Files: `ctrl + cmd + f`
- Search Menu Items aka Palette: `shift + cmd + p`
- Switch Windows list: `hyper + tab`
- RaycastAI Quick AI: `tab` (Inside Raycast)
- RaycastAI Chat: `ctrl + cmd + 0`
- RaycastAI Snippets: `ctrl + cmd + 9`
- Dictionary: `ctrl + cmd + 8` - if something is selected, it will search for the word, if not, it will open the dictionary.
- Translator: `ctrl + cmd + 7` and `tt` alias.
- Notes: `ctrl + cmd + n`
- Confetti: `ctrl + cmd + \`
- Search Snippets: `ctrl + cmd + 1`

### Global Shortcuts

- Show Launchpad: `ctrl + cmd + a`
- Mission Control: `ctrl + cmd + x`
- Move to Left Space: `ctrl + cmd + s`
- Move to Right Space: `ctrl + cmd + d`
- Switch to N Desktop: `ctrl + cmd + 1` to `9`
- By default I setup F1 to F12 as standard function keys.
