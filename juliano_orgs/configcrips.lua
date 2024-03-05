Config                           = {}
Configcrips                            = {}
Configcrips.DrawDistance               = 100.0
Configcrips.MarkerType                 = 20
Configcrips.MarkerSize                 = { x = 1.0, y = 1.0, z = 1.0 }
Configcrips.MarkerColor                = { r = 204, g = 0, b = 0 }
Configcrips.EnablePlayerManagement     = true
Configcrips.EnableArmoryManagement     = true
Configcrips.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Configcrips.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Configcrips.EnableSocietyOwnedVehicles = false
Configcrips.EnableLicenses             = false
Configcrips.MaxInService               = -1
Configcrips.Locale                     = 'br'
Config.Locale                     = 'br'

Configcrips.cripsStations = {

  crips = {

    Blip = {
      Pos     = { },--x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      --Display = 4,
      --Scale   = 1.2,
      --Colour  = 29,
    },

    AuthorizedWeapons = {
    --   { name = 'WEAPON_COMBATPISTOL',     price = 4000 },
    --   { name = 'WEAPON_ASSAULTSMG',       price = 15000 },
    --   { name = 'WEAPON_ASSAULTRIFLE',     price = 25000 },
    --   { name = 'WEAPON_PUMPSHOTGUN',      price = 9000 },
    --   { name = 'WEAPON_STUNGUN',          price = 250 },
    --   { name = 'WEAPON_FLASHLIGHT',       price = 50 },
    --   { name = 'WEAPON_FIREEXTINGUISHER', price = 50 },
    --   { name = 'WEAPON_FLAREGUN',         price = 3000 },
    --   { name = 'GADGET_PARACHUTE',        price = 2000 },
    --   { name = 'WEAPON_SNIPERRIFLE',      price = 50000 },
    --   { name = 'WEAPON_FIREWORK',         price = 5000 },
    --   { name = 'WEAPON_BZGAS',            price = 8000 },
    --   { name = 'WEAPON_SMOKEGRENADE',     price = 8000 },
    --   { name = 'WEAPON_APPISTOL',         price = 12000 },
    --   { name = 'WEAPON_CARBINERIFLE',     price = 25000 },
    --   { name = 'WEAPON_HEAVYSNIPER',      price = 100000 },
    --   { name = 'WEAPON_FLARE',            price = 8000 },
    --   { name = 'WEAPON_SWITCHBLADE',      price = 500 },
	  -- { name = 'WEAPON_REVOLVER',         price = 6000 },
	  -- { name = 'WEAPON_POOLCUE',          price = 100 },
	  -- ----{ name = 'WEAPON_GUSENBERG',        price = 17500 },
	  
    },

	  AuthorizedVehicles = {
		  { name = 'schafter3',  label = 'Véhicule Civil' },
		  { name = 'btype',      label = 'Roosevelt' },
		  { name = 'sandking',   label = '4X4' },
		  { name = 'mule3',      label = 'Camion de Transport' },
		  { name = 'guardian',   label = 'Grand 4x4' },
		  { name = 'burrito3',   label = 'Fourgonnette' },
		  { name = 'mesa',       label = 'Tout-Terrain' },
	  },

    Cloakrooms = {
      { x = -100.531, y = -1635.486, z = 32.10486528335571 }, 
    },

    Armories = {
      { x = -86.67, y = -1638.13, z = 31.711 },
    }, ---86.672370910645,-1638.1313476563,31.711282730103
 
    Vehicles = {
      {
        Spawner    = { x = 13.40, y = 549.1, z = 175.187 },
        SpawnPoint = { x = 8.237, y = 556.963, z = 175.266 },
        Heading    = 90.0,
      }
    },
	
	Helicopters = {
      --{
       -- Spawner    = { x = 20.312, y = 535.667, z = 173.627 },
        --SpawnPoint = { x = 3.40, y = 525.56, z = 177.919 },
        --Heading    = 0.0,
      --}
    },

    VehicleDeleters = { 
      { x = -108.498, y = -1598.58, z = 31.640 },
    },

    BossActions = {
      { x = -86.46, y = -1635.89, z = 31.71 } 
     },  ---86.465072631836,-1635.8985595703,31.711282730103

  },

}
