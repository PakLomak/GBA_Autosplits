state("emuhawk", "1.13.2") //RAM 0x00 == "mgba.dll", 0x000CB04C, 0x8, 0x14, 0x00;
{
    byte start:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x88;
    byte screen:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x10;
    byte room:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x9F;
    byte Area:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x9E;
    byte defeated:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x37F;
    byte defeated1:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x37E;
    byte location: "mgba.dll", 0x000CB04C, 0x8, 0x14, 0x37C;
    byte location1: "mgba.dll", 0x000CB04C, 0x8, 0x14, 0x37D;
    byte graham:"mgba.dll", 0x000CB04C, 0x8, 0x14, 0x135F;
    byte chaos : "mgba.dll", 0x000CB04C, 0x8, 0x14, 0x1388;
    byte charter: "mgba.dll", 0x000CB04C, 0x8, 0x14, 0x407;
}
state("emuhawk", "2.8.0") //RAM 0x00 == "mgba.dll", 0x000F9448, 0x10, 0x28, 0x00;
{
    byte start:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x88;
    byte screen:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x10;
    byte room:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x9F;
    byte Area:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x9E;
    byte defeated:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x37F;
    byte defeated1:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x37E;
    byte location: "mgba.dll", 0x000F9448, 0x10, 0x28, 0x37C;
    byte location1: "mgba.dll", 0x000F9448, 0x10, 0x28, 0x37D;
    byte graham:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x135F;
    byte chaos : "mgba.dll", 0x000F9448, 0x10, 0x28, 0x1388;
    byte charter:"mgba.dll", 0x000F9448, 0x10, 0x28, 0x407;
}
state("retroarch", "1.9.8") //RAM 0x00 == "mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x00;
{
    byte start:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x88;
    byte screen:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x10;
    byte room:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x9F;
    byte Area:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x9E;
    byte defeated:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x37F;
    byte defeated1:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x37E;
    byte location: "mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x37C;
    byte location1: "mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x37D;
    byte graham:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x135F;
    byte chaos : "mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x1388;
    byte charter:"mgba_libretro.dll", 0x0010E7A0, 0x8, 0x28, 0x407;
}
start 
{
    if (current.start == 0x1C && current.screen == 0x02)
    {
        vars.ur = true;
        vars.ct = true;
        vars.fg = true;
        vars.iq = true;
        vars.dh = true;
        vars.s = true;
        vars.c = true;
        vars.cc = true;
        vars.uc = true;
        vars.cr = true;
        vars.fa = true;
        vars.tf = true;
        vars.ta = true;
        vars.g = true;
        return true;
    }
}
split
{
    if (current.room == 0x0F && ((old.defeated >> 0x07) & 1) != 1 && ((current.defeated >> 0x07) & 1) == 1) return true; //Great Armor
    if (current.room == 0x06 && ((old.defeated >> 0x02) & 1) != 1 && ((current.defeated >> 0x02) & 1) == 1) return true; //Manticore
    if (current.room == 0x0A && ((old.defeated >> 0x03) & 1) != 1 && ((current.defeated >> 0x03) & 1) == 1) return true; //Creaking Skull
    if (current.room == 0x13 && ((old.defeated >> 0x04) & 1) != 1 && ((current.defeated >> 0x04) & 1) == 1) return true; //Big Golem
    if (current.room == 0x0B && ((old.defeated1 >> 0x04) & 1) != 1 && ((current.defeated1 >> 0x04) & 1) == 1) return true; //Headhunter
    if (current.room == 0x25 && ((old.defeated1 >> 0x05) & 1) != 1 && ((current.defeated1 >> 0x05) & 1) == 1) return true; //Legion
    if (current.room == 0x01 && ((old.defeated1 >> 0x06) & 1) != 1 && ((current.defeated1 >> 0x06) & 1) == 1) return true; //Balore
    if (current.room == 0x07 && ((old.defeated1 >> 0x01) & 1) != 1 && ((current.defeated1 >> 0x01) & 1) == 1) return true; //Death
    if (current.charter == 0x01 && current.room == 0x04 && current.Area == 0x09 && old.graham != 0x02 && current.graham == 0x02) return true; //Graham
    if (current.room == 0x04 && ((old.defeated1 >> 0x00) & 1) != 1 && ((current.defeated1 >> 0x00) & 1) == 1) return true; //Graham
    if (current.room == 0x16 && ((old.defeated1 >> 0x07) & 1) != 1 && ((current.defeated1 >> 0x07) & 1) == 1) return true; //Chaos
    if (current.room == 0x16 && current.Area == 0x0B && old.chaos != 0xF2 && current.chaos == 0xF2) return true; //Chaos
    if (current.room == 0x06 && ((old.defeated1 >> 0x02) & 1) != 1 && ((current.defeated1 >> 0x02) & 1) == 1) return true; //Julius
    if (settings["UR"] && ((old.location >> 0x07) & 1) != 1 && ((current.location >> 0x07) & 1) == 1 && vars.ur == true)   {vars.ur = false;
    return true;} //Underground resivour
    if (settings["CT"] && ((old.location >> 0x06) & 1) != 1 && ((current.location >> 0x06) & 1) == 1 && vars.ct == true)   {vars.ct = false;
    return true;} //Clock tower
    if (settings["FG"] && ((old.location >> 0x05) & 1) != 1 && ((current.location >> 0x05) & 1) == 1 && vars.fg == true)   {vars.fg = false;
    return true;} //Floating gardens
    if (settings["IQ"] && ((old.location >> 0x04) & 1) != 1 && ((current.location >> 0x04) & 1) == 1 && vars.iq == true)   {vars.iq = false;
    return true;} //Inner quators
    if (settings["DH"] && ((old.location >> 0x03) & 1) != 1 && ((current.location >> 0x03) & 1) == 1 && vars.dh == true)   {vars.dh = false;
    return true;} //Dance hall
    if (settings["S"] && ((old.location >> 0x02) & 1) != 1 && ((current.location >> 0x02) & 1) == 1 && vars.s == true)   {vars.s = false;
    return true;} //Stude
    if (settings["C"] && ((old.location >> 0x01) & 1) != 1 && ((current.location >> 0x01) & 1) == 1 && vars.c == true)   {vars.c = false;
    return true;} //Chapel
    if (settings["CC"] && ((old.location >> 0x00) & 1) != 1 && ((current.location >> 0x00) & 1) == 1 && vars.cc == true)   {vars.cc = false;
    return true;} //Castle Corridor
    if (settings["UC"] && ((old.location1 >> 0x04) & 1) != 1 && ((current.location1 >> 0x04) & 1) == 1 && vars.uc == true)   {vars.uc = false;
    return true;} //Underground cemetery
    if (settings["CR"] && ((old.location1 >> 0x03) & 1) != 1 && ((current.location1 >> 0x03) & 1) == 1 && vars.cr == true)   {vars.cr = false;
    return true;} //Chaotick Realm
    if (settings["FA"] && ((old.location1 >> 0x02) & 1) != 1 && ((current.location1 >> 0x02) & 1) == 1 && vars.fa == true)   {vars.fa = false;
    return true;} //Forbidden area
    if (settings["TF"] && ((old.location1 >> 0x01) & 1) != 1 && ((current.location1 >> 0x01) & 1) == 1 && vars.tf == true)   {vars.tf = false;
    return true;} //Top floor
    if (settings["TA"] && ((old.location1 >> 0x00) & 1) != 1 && ((current.location1 >> 0x00) & 1) == 1 && vars.ta == true)   {vars.ta = false;
    return true;} //The area
    if (settings["G"] && current.Area == 0x09 && current.room == 0x04 && old.room != 0x04 && vars.g == true) {vars.g = false;
    return true;} //Graham
}
init
{
    if (modules.First().ModuleMemorySize == 4571136) 
        version = "2.8.0";
    else if (modules.First().ModuleMemorySize == 6488064)
        version = "1.13.2";
    vars.ur = true;
    vars.ct = true;
    vars.fg = true;
    vars.iq = true;
    vars.dh = true;
    vars.s = true;
    vars.c = true;
    vars.cc = true;
    vars.uc = true;
    vars.cr = true;
    vars.fa = true;
    vars.tf = true;
    vars.ta = true;
    vars.g = true;
}
reset
{
    return (current.screen == 0x00 && current.start == 0x00);
}
startup
{
	settings.Add("main", false, "AutoSplitter for Castlevania - Aria of Sorrow by PakLomak");
	settings.Add("main3", false, "--https://www.twitch.tv/paklomak", "main");
	settings.Add("Room", true, "Room");
    settings.Add("G", false, "room Graham", "Room");
    settings.Add("Location", true, "Location");
	settings.Add("UR", false, "Underground Reservoir", "Location");
    settings.Add("CT", false, "Clock Tower", "Location");
    settings.Add("FG", false, "Floating Gardens", "Location");
    settings.Add("IQ", false, "Inner Quators", "Location");
    settings.Add("DH", false, "Dance Hall", "Location");
    settings.Add("S", false, "Stude", "Location");
    settings.Add("C", false, "Chapel", "Location");
    settings.Add("CC", false, "Castle Corridor", "Location");
    settings.Add("UC", false, "Underground Cemetery", "Location");
    settings.Add("CR", false, "Chaotick Realm", "Location");
    settings.Add("FA", false, "Forbidden Area", "Location");
    settings.Add("TF", false, "Top Floor", "Location");
    settings.Add("TA", false, "The Area", "Location");
}