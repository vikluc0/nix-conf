{ config, pkgs, ... }:

{
  programs.plasma.configFile.kwinrc = { 
    Desktops = { 
     Id_1 = "de697df5-f8a3-4faf-adb5-27ae2a2b966c";
      Number = 1;
      Rows = 1;
    };

    Effect-kwin6_effect_glitch = {
     Color = "invalid";
      Duration = 1150;
      Scale = 10;
      Speed = 1;
      Strength = 10;
    };

    Effect-magiclamp.AnimationDuration = 240;

    Effect-wobblywindows = {
     AdvancedMode = true;
      Drag = 95;
      MoveFactor = 22;
      Stiffness = 2;
      WobblynessLevel = 4;
    };

    NightColor = {
     Active = true;
      NightTemperature = 3200;
    };

    Plugins = {
     "[Tiling][de697df5-f8a3-4faf-adb5-27ae2a2b966c][]" = "";
      kwin6_effect_glitchEnabled = true;
      magiclampEnabled = true;
      padding = 4;
      scaleEnabled = false;
      squashEnabled = false;
      tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      wobblywindowsEnabled = true;
    };

    "Tiling/de697df5-f8a3-4faf-adb5-27ae2a2b966c/5759c11e-91e3-4413-bd69-627a9e10fecf" = {
     padding = 4;
      tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
    };

    "Tiling/de697df5-f8a3-4faf-adb5-27ae2a2b966c/f36035ef-e267-463a-a650-68edddfabbdc" = {
     padding = 4;
      tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
    };
    
    Xwayland.Scale = 1;
  };
}
