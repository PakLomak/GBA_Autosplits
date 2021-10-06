state("emuhawk", "1.13.2") //RAM 0x00 == "mgba.dll", 0x000CB04C, 0x8, 0x14, 0x00;
{
    byte start:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x88;
    byte screen:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x10;
    byte room:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x9F;
    byte Area:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x9E;
    byte defeated:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x37F;
    byte defeated1:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x37E;
    byte graham:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x135F;
}
state("emuhawk", "2.6.3") //RAM 0x00 == "mgba.dll", 0x000F9448, 0x10, 0x28, 0x00;
{
    byte start:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x88;
    byte screen:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x10;
    byte room:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x9F;
    byte Area:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x9E;
    byte defeated:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x37F;
    byte defeated1:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x37E;
    byte graham:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x135F;
}
state("retroarch", "1.9.8") //RAM 0x00 == "mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x00;
{
    byte start:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x88;
    byte screen:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x10;
    byte room:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x9F;
    byte Area:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x9E;
    byte defeated:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x37F;
    byte defeated1:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x37E;
    byte graham:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x135F;
}
init
{
    if (modules.First().ModuleMemorySize == 4562944)
        version = "2.6.3";
    else if (modules.First().ModuleMemorySize == 6488064)
        version = "1.13.2";
}
start 
{
    return (current.start == 0x1C && current.screen == 0x02);
}
update
{
    //print(modules.First().ModuleMemorySize.ToString());
    //print(current.defeated.ToString("X2"));
}
split
{
    if (settings["U_C"] && old.room == 0x04 && current.room == 0x05 && current.Area == 0x00) return true; //Underground Reservoir -> Castle Corridor
    if (settings["C_U"] && current.room == 0x00 && old.Area == 0x00 && current.Area == 0x07) return true; //Castle Corridor -> Underground Reservoir
    if (settings["U_A"] && current.room == 0x14 && old.Area == 0x07 && current.Area == 0x08) return true; //Underground Reservoir -> The Arena
    if (settings["A_U"] && old.room == 0x26 && current.room == 0x04 && current.Area == 0x07) return true; //The Arena -> Underground Reservoir
    if (settings["C_Ch"] && current.room == 0x04 && old.Area == 0x00 && current.Area == 0x01) return true; //Castle Corridor -> Chapel
    if (settings["Ch_C"] && old.room == 0x20 && current.room == 0x1A && current.Area == 0x00) return true; //Chapel -> Castle Corridor
    if (settings["S_Ch"] && old.room == 0x0D && current.room == 0x00 && current.Area == 0x01) return true; //Study -> Chapel
    if (settings["Ch_S"] && current.room == 0x06 && old.Area == 0x01 && current.Area == 0x02) return true; //Chapel -> Study
    if (settings["U_FA"] && old.room == 0x07 && current.room == 0x00 && current.Area == 0x0A) return true; //Underground Reservoir -> Forbidden Area
    if (settings["FA_U"] && current.room == 0x1B && old.Area == 0x0A && current.Area == 0x07) return true; //Forbidden Area -> Underground Reservoir
    if (settings["FA_S"] && old.room == 0x0D && current.room == 0x0E && current.Area == 0x02) return true; //Forbidden Area -> Study
    if (settings["S_FA"] && current.room == 0x01 && old.Area == 0x02 && current.Area == 0x0A) return true; //Study -> Forbidden Area
    if (settings["C_DH"] && current.room == 0x0E && old.Area == 0x00 && current.Area == 0x03) return true; //Castle Corridor -> Dance Hall
    if (settings["DH_C"] && old.room == 0x07 && current.room == 0x08 && current.Area == 0x00) return true; //Dance Hall -> Castle Corridor
    if (settings["DH_IQ"] && current.room == 0x03 && old.Area == 0x03 && current.Area == 0x04) return true; //Dance Hall -> Inner Quarters
    if (settings["IQ_DH"] && old.room == 0x17 && current.room == 0x0D && current.Area == 0x03) return true; //Inner Quarters -> Dance Hall
    if (settings["IQ_TF"] && current.room == 0x0A && old.Area == 0x04 && current.Area == 0x09) return true; //Inner Quarters -> Top Floor
    if (settings["TF_IQ"] && old.room == 0x0F && current.room == 0x13 && current.Area == 0x04) return true; //Top Floor -> Inner Quarters
    if (settings["TF_CT"] && current.room == 0x00 && old.Area == 0x09 && current.Area == 0x06) return true; //Top Floor -> Clock Tower
    if (settings["CT_TF"] && old.room == 0x18 && current.room == 0x12 && current.Area == 0x09) return true; //Clock Tower -> Top Floor
    if (settings["Room_Garaham"] && current.Area == 0x09 && old.room == 0x01 && current.room == 0x04) return true; //Top Floor Room Graham
    if (current.room == 0x0F && ((old.defeated >> 0x07) & 1) != 1 && ((current.defeated >> 0x07) & 1) == 1) return true; //Great Armor
    if (current.room == 0x06 && ((old.defeated >> 0x02) & 1) != 1 && ((current.defeated >> 0x02) & 1) == 1) return true; //Manticore
    if (current.room == 0x0A && ((old.defeated >> 0x03) & 1) != 1 && ((current.defeated >> 0x03) & 1) == 1) return true; //Creaking Skull
    if (current.room == 0x13 && ((old.defeated >> 0x04) & 1) != 1 && ((current.defeated >> 0x04) & 1) == 1) return true; //Big Golem
    if (current.room == 0x0B && ((old.defeated1 >> 0x04) & 1) != 1 && ((current.defeated1 >> 0x04) & 1) == 1) return true; //Headhunter
    if (current.room == 0x25 && ((old.defeated1 >> 0x05) & 1) != 1 && ((current.defeated1 >> 0x05) & 1) == 1) return true; //Legion
    if (current.room == 0x01 && ((old.defeated1 >> 0x06) & 1) != 1 && ((current.defeated1 >> 0x06) & 1) == 1) return true; //Balore
    if (current.room == 0x07 && ((old.defeated1 >> 0x01) & 1) != 1 && ((current.defeated1 >> 0x01) & 1) == 1) return true; //Death
    if (current.room == 0x04 && current.Area == 0x09 && old.graham != 0x02 && current.graham == 0x02) return true; //Graham
    //if (current.room == 0x04 && ((old.defeated1 >> 0x00) & 1) != 1 && ((current.defeated1 >> 0x00) & 1) == 1) return true; //Graham
}
reset
{
    return (current.screen == 0x00 && current.start == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Castlevania - Aria of Sorrow by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("JULIUS", true, "JULIUS All Bosses");
	settings.Add("C_U", true, "Castle Corridor -> Underground Reservoir", "JULIUS");
	settings.Add("U_FA", true, "Underground Reservoir -> Forbidden Area", "JULIUS");
	settings.Add("FA_S", false, "Forbidden Area -> Study", "JULIUS");
    settings.Add("S_Ch", true, "Study -> Chapel", "JULIUS");
    settings.Add("C_DH", true, "Castle Corridor -> Dance Hall", "JULIUS");
    settings.Add("DH_IQ", false, "Dance Hall -> Inner Quarters", "JULIUS");
    settings.Add("IQ_TF", true, "Inner Quarters -> Top Floor", "JULIUS");
    settings.Add("U_A", true, "Underground Reservoir -> The Arena", "JULIUS");
    settings.Add("TF_CT", true, "Top Floor -> Clock Tower", "JULIUS");
    settings.Add("CT_TF", false, "Clock Tower -> Top Floor", "JULIUS");
    settings.Add("Room_Garaham", true, "Room Garaham", "JULIUS");
}