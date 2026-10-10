# FivePRS Addons

Official optional resources for [FivePRS](https://github.com/FivePRS/core). Each folder with an `fxmanifest.lua` is a standalone FiveM resource.

## Installation
Run `publish.ps1` to build `dist/fiveprs_addons.zip`. Extract it into your server's `resources/` folder; it contains a `[fiveprs_addons]` category folder. Then add the addons you want to `server.cfg` after `ensure fiveprs`:

```cfg
ensure fiveprs
ensure fiveprs_loadscreen
ensure fiveprs_presence
```

## fiveprs_loadscreen
`fiveprs_loadscreen` is a FivePRS-branded loading screen: load progress, rotating tips and a welcome back card with the player's agency and rank. Add `ensure fiveprs_loadscreen` to `server.cfg` to use it, and set your server name and tips in its `config.js`. Leave it out if your server already has a loading screen.

For background music, put `.mp3` or `.ogg` files in the addon's `music/` folder and list them under `music.tracks` in `config.js`, along with `volume` and `shuffle`. Direct links to audio files also work. No music ships with FivePRS, so only use tracks you have the rights to. Players can mute it from the button in the top-right corner, and the choice is remembered.

## fiveprs_presence
`fiveprs_presence` shows each player's FivePRS activity in their Discord status, such as `1-ADAM-12 · Responding to Shoplifting`, `1-ADAM-12 · Available in Mission Row` or `Civilian in Vinewood`. It refreshes every `RefreshSeconds` (10 by default) and reads its state from the `fiveprs` resource.

Settings are in its `config.lua`:

| Setting | Description |
|---|---|
| `AppId` | Discord application ID. Defaults to the official FivePRS application, which shows the FivePRS name and images. Set your own to brand it for your server, or leave it empty to show the text under FiveM's own presence without images or buttons. |
| `LargeImage` | Asset key and hover text for the large image. |
| `DepartmentImages` | Asset key and hover text for the small image shown while on duty, per department. |
| `CivilianImage` | Asset key and hover text for the small image shown off duty. Set it to `nil` to show none. |
| `Text` | Status text for `onCall`, `onDuty` and `offDuty`. |
| `Statuses` | Display names for unit statuses. |
| `Buttons` | Up to two buttons, each `{ label = 'Join Discord', url = 'https://discord.gg/...' }`. |

Text can use `{name}`, `{department}`, `{agency}`, `{callsign}`, `{rank}`, `{status}`, `{territory}`, `{call}`, `{callId}` and `{location}`. Duty and call values are only available while on duty.

To use your own application, create one in the [Discord Developer Portal](https://discord.com/developers/applications), copy its application ID into `AppId`, and upload images under Rich Presence > Art Assets using the asset keys in `config.lua` (`fiveprs_logo`, `police`, `ems`, `fire` and `civilian` by default).
