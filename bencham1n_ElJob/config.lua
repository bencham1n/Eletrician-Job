Config = {}

Config.Eletrician = {
    pedModel = "a_m_y_business_01",
    pedCoords = vec3(737.8840, 132.9975, 79.6678),
    pedHeading = 250.0, -- NPC heading
    carmodel = 'rumpo2',
    carspawnloc = vec4(746.6363, 128.7514, 79.2999, 230.9617)
}

Config.blip = {
    coords = vec3(737.8840, 132.9975, 79.6678), -- should be same as pedcoords
    sprite = 498,
    colour = 2,
    distance = true, -- Blip will only appear when you're close
    size = 0.8
}
Config.Locations = {
    vec4(77.5377, -1116.3407, 29.2954, 87.9101),
    vector4(19.0418, -1335.5822, 29.2788, 253.7859),
    vector4(508.1099, -1702.3708, 29.3207, 307.7922),
    vector4(372.0196, -825.4507, 29.2927, 282.3094),
    vector4(704.5371, 109.5434, 80.9392, 159.2671),
    vector4(707.4541, 108.4712, 80.9391, 148.9802),
    vector4(701.5596, 110.7307, 80.9369, 153.2063),
    vector4(-30.9429, 285.5522, 106.8493, 57.0261),
    vector4(40.1237, -1039.4054, 29.5251, 335.6029)
}

Config.WaitTime = 10000 ---20 seconds
Config.NotifyType = 'ox'  ---esx,ox,okok
Config.rewardel = {
    classic = 200
}


Config.npc = {
    number = 1,  --After How much will show notif about real Client(Npc)
    clientcoord = vec4(-1204.4562, -1329.3342, 3.8684, 144.9124), ---Coords Npc
    repaircoordsclient = vec4(-1208.5983, -1328.1746, 5.1422, 23.2559), ---Location of reapiring something
    waittime = 2000 
}