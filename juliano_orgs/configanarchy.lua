Config                           = {}
ConfigAnarchy                            = {}
ConfigAnarchy.DrawDistance               = 100.0
ConfigAnarchy.MarkerType                 = 20
ConfigAnarchy.MarkerSize                 = { x = 1.0, y = 1.0, z = 1.0 }
ConfigAnarchy.MarkerColor                = { r = 204, g = 0, b = 0 }
ConfigAnarchy.EnablePlayerManagement     = true
ConfigAnarchy.EnableArmoryManagement     = true
ConfigAnarchy.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
ConfigAnarchy.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
ConfigAnarchy.EnableSocietyOwnedVehicles = false
ConfigAnarchy.EnableLicenses             = false
ConfigAnarchy.MaxInService               = -1
ConfigAnarchy.Locale                     = 'br'
Config.Locale                     = 'br'

ConfigAnarchy.anarchyStations = {

  sonsanarchy = {

    Blip = {
      Pos     = { },
      Sprite  = 60,

    },

    AuthorizedWeapons = {
	  
    },

	  AuthorizedVehicles = {

	  },

    Cloakrooms = {
      { x = 972.5831, y = -98.1962, z = 74.870 }, 
    },

    Armories = {
      { x = 977.9237, y = -95.0719, z = 74.868 },
    }, 
 
    Vehicles = {
      {
        Spawner    = { },
        SpawnPoint = { },
        Heading    = 90.0,
      }
    },
	
	Helicopters = {

    },

    VehicleDeleters = { 
      { x = 969.8241, y = -123.988, z = 74.353 },
    },

    BossActions = {
      { x = 977.2079, y = -104.168, z = 74.845 } 
     },  

  },

}
