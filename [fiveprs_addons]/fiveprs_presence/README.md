# fiveprs_presence

Shows each player's FivePRS activity in their Discord status. An official addon from [FivePRS/addons](https://github.com/FivePRS/addons).

## Installation
1. Install [FivePRS](https://github.com/FivePRS/core) first.
2. Download `fiveprs_addons.zip` from the latest [release](https://github.com/FivePRS/addons/releases). It contains every official addon in a `[fiveprs_addons]` folder.
3. Copy the `fiveprs_presence` folder into your server's `resources/` folder.
4. Add it to `server.cfg` after FivePRS:

```cfg
ensure fiveprs
ensure fiveprs_presence
```

## Usage
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
