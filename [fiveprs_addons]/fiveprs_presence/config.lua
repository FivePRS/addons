Config = {}

Config.AppId = '1558258817790120108'

Config.RefreshSeconds = 10

Config.LargeImage = {
    asset = 'fiveprs_logo',
    text  = 'FivePRS',
}

Config.DepartmentImages = {
    Police = { asset = 'police', text = '{agency} · Rank {rank}' },
    EMS    = { asset = 'ems',    text = '{agency} · Rank {rank}' },
    Fire   = { asset = 'fire',   text = '{agency} · Rank {rank}' },
}

Config.CivilianImage = { asset = 'civilian', text = 'Civilian' }

Config.Text = {
    onCall  = '{callsign} · Responding to {call}',
    onDuty  = '{callsign} · {status} in {location}',
    offDuty = 'Civilian in {location}',
}

Config.Statuses = {
    Available = 'Available',
    EnRoute   = 'En route',
    OnScene   = 'On scene',
    Busy      = 'Busy',
}

Config.Buttons = {}
