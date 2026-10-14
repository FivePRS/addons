# fiveprs_loadscreen

A FivePRS loading screen with load progress, rotating tips, background music and a welcome back card. An official addon from [FivePRS/addons](https://github.com/FivePRS/addons).

## Installation
1. Install [FivePRS](https://github.com/FivePRS/core) first.
2. Download `fiveprs_addons.zip` from the latest [release](https://github.com/FivePRS/addons/releases). It contains every official addon in a `[fiveprs_addons]` folder.
3. Copy the `fiveprs_loadscreen` folder into your server's `resources/` folder.
4. Add it to `server.cfg` after FivePRS:

```cfg
ensure fiveprs
ensure fiveprs_loadscreen
```

## Usage
`fiveprs_loadscreen` is a FivePRS-branded loading screen: load progress, rotating tips and a welcome back card with the player's agency and rank. Add `ensure fiveprs_loadscreen` to `server.cfg` to use it, and set your server name and tips in its `config.js`. Leave it out if your server already has a loading screen.

For background music, put `.mp3` or `.ogg` files in the addon's `music/` folder and list them under `music.tracks` in `config.js`, along with `volume` and `shuffle`. Direct links to audio files also work. No music ships with FivePRS, so only use tracks you have the rights to. Players can mute it from the button in the top-right corner, and the choice is remembered.
