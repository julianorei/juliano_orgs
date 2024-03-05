Config                           = {}
Configcosanostra                            = {}
Configcosanostra.DrawDistance               = 100.0
Configcosanostra.MarkerType                 = 20
Configcosanostra.MarkerSize                 = { x = 1.0, y = 1.0, z = 1.0 }
Configcosanostra.MarkerColor                = { r = 204, g = 0, b = 0 }
Configcosanostra.EnablePlayerManagement     = true
Configcosanostra.EnableArmoryManagement     = true
Configcosanostra.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Configcosanostra.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Configcosanostra.EnableSocietyOwnedVehicles = false
Configcosanostra.EnableLicenses             = false
Configcosanostra.MaxInService               = -1
Configcosanostra.Locale                     = 'br'
Config.Locale                          = 'br'

Configcosanostra.cosanostraStations = {

  cosanostra = {

    Blip = {
      Pos     = { },--x = 425.130, y = -979.558, z = 30.711 },
      --Sprite  = 60,
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
      { x = -347.584, y = 521.8114, z = 120.53 },
    },

    Armories = {
      { x = 73.10, y = -1965.25, z = 20.74 },
    }, --73.105155944824,-1965.2521972656,20.743543624878
 
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
      { x = -361.658, y = 513.1624, z = 119.46 },
    },

    BossActions = {
      { x = -341.832, y = 523.3455, z = 120.15 } 
     },  --392.4111328125,-1107.1196289063,29.4186668396

  },

}
