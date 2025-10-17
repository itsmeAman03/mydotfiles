var panel = new Panel
panel.location = "bottom"
panel.hiding = "dodgewindows"
panel.height = 51
panel.alignment = "center"
panel.floating = 1
panel.lengthMode = "fit"

const width = screenGeometry(panel.screen).width

panel_clock = panel.addWidget("org.kde.plasma.digitalclock")
panel_clock.currentConfigGroup = ["Appearance"]
panel_clock.writeConfig("fontSize", "11")
panel_clock.writeConfig("autoFontAndSize", "false")

panel.addWidget("Nori.Weather")

panel_start = panel.addWidget("Start.Next.Menu")
panel_start.currentConfigGroup = ["General"]
panel_start.writeConfig("displayPosition", "Center")
panel_start.writeConfig("icon", "start-here-kde-symbolic")

panel.addWidget("org.kde.plasma.icontasks")

/*systemtray*/
var systraprev = panel.addWidget("org.kde.plasma.systemtray")
var SystrayContainmentId = systraprev.readConfig("SystrayContainmentId")
const systray = desktopById(SystrayContainmentId)
systray.currentConfigGroup = ["General"]
systray.writeConfig("iconSpacing", 1)
//systray.writeConfig("extraItems", "")
systray.writeConfig("hiddenItems", "org.kde.plasma.volume,org.kde.plasma.brightness,org.kde.plasma.battery,org.kde.plasma.bluetooth,org.kde.plasma.mediacontroller")
systray.writeConfig("shownItems", "org.kde.plasma.weather,org.kde.plasma.battery,org.kde.plasma.brightness,org.kde.plasma.battery,org.kde.plasma.bluetooth")

controlHub = panel.addWidget("Plasma.Flex.Hub")
controlHub.currentConfigGroup = ["General"]
controlHub.writeConfig("elements", "12,17,1,9,10,11,25,8")
controlHub.writeConfig("xElements", "0,0,2,0,0,2,2,3")
controlHub.writeConfig("yElements", "0,1,0,2,3,3,2,2")
controlHub.writeConfig("selected_theme", "Custom")



panel.addWidget("luisbocanegra.panel.colorizer")


/*Buttons of aurorae*/
Buttons = ConfigFile("kwinrc")
Buttons.group = "org.kde.kdecoration2"
Buttons.writeEntry("ButtonsOnRight", "IAX")
Buttons.writeEntry("ButtonsOnLeft", "")

/* accent color config*/
ColorAccetFile = ConfigFile("kdeglobals")
ColorAccetFile.group = "General"
ColorAccetFile.writeEntry("accentColorFromWallpaper", "false")
ColorAccetFile.deleteEntry("AccentColor")
ColorAccetFile.deleteEntry("LastUsedCustomAccentColor")

splash = ConfigFile("ksplashrc")
splash.group = "KSplash"
splash.writeEntry("Theme", "Kde.Splash.Dinamic")
