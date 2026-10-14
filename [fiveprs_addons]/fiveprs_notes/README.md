# fiveprs_notes

A Notes app for the FivePRS terminal, and the reference example of a terminal app made from a resource. An official addon from [FivePRS/addons](https://github.com/FivePRS/addons).

## Installation
1. Install [FivePRS](https://github.com/FivePRS/core) first.
2. Download `fiveprs_addons.zip` from the latest [release](https://github.com/FivePRS/addons/releases). It contains every official addon in a `[fiveprs_addons]` folder.
3. Copy the `fiveprs_notes` folder into your server's `resources/` folder.
4. Add it to `server.cfg` after FivePRS:

```cfg
ensure fiveprs
ensure fiveprs_notes
```

## Usage
`fiveprs_notes` adds a **Notes** app to the FivePRS terminal: a personal notepad for plates, names and anything else worth remembering. Notes are saved on the player's own PC, and the app shows a dot on the home screen while there are notes. `Ctrl+S` saves.

It is also the reference example of a terminal app made from a resource: `client.lua` registers the app with `exports.fiveprs:registerApp` and handles its actions in `fiveprs:appAction`, and `html/` is the app page, which uses the FivePRS app SDK. Copy it as a starting point for your own apps.
