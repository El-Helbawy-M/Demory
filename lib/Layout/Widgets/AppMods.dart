import 'package:flutter/material.dart';

enum Mod { MEGA, ICPC, CatReloaded, Normal, Dark, DetectiveConan, Naruto }
Map<String, Mod> mods = {
  'MEGA': Mod.MEGA,
  'ICPC': Mod.ICPC,
  'CatReloaded': Mod.CatReloaded,
  'Normal': Mod.Normal,
  'Dark': Mod.Dark,
  'DetectiveConana': Mod.DetectiveConan,
  'Naruto': Mod.Naruto,
};
Map<Mod, Map<String, Color>> themeData = {
  Mod.ICPC: icpcMod,
  Mod.CatReloaded: catreloadedMod,
  Mod.MEGA: megaMod,
  Mod.Normal: normalMod,
  Mod.Dark: darkMod,
  Mod.DetectiveConan: conanMod,
  Mod.Naruto: narutoMod,
};

Map<String, Color> icpcMod = {
  "Container Color": Colors.blue,
  "Background Color": Colors.white,
  "Color 1": Colors.white,
  "Color 2": Colors.blue,
  "Profile Name Color": Colors.black,
};

Map<String, Color> megaMod = {
  "Container Color": Color(0xffcb0003),
  "Background Color": Color(0xff1d1d1d),
  "Color 1": Color(0xff1d1d1d),
  "Color 2": Color(0xffcb0003),
  "Profile Name Color": Colors.white,
};

Map<String, Color> catreloadedMod = {
  "Container Color": Color(0xffc2341c),
  "Background Color": Colors.white,
  "Color 1": Colors.white,
  "Color 2": Color(0xffc2341c),
  "Profile Name Color": Colors.black,
};

Map<String, Color> normalMod = {
  "Container Color": Color(0xff080518),
  "Background Color": Color(0xfff5f5f5),
  "Color 1": Color(0xfff5f5f5),
  "Color 2": Color(0xffaa802c),
  "Profile Name Color": Colors.black,
};

Map<String, Color> darkMod = {
  "Container Color": Colors.grey[850],
  "Background Color": Colors.grey[900],
  "Color 1": Colors.white,
  "Color 2": Colors.white,
  "Profile Name Color": Colors.white,
};

Map<String, Color> conanMod = {
  "Container Color": Colors.indigo[900],
  "Background Color": Colors.white,
  "Color 1": Colors.white,
  "Color 2": Colors.indigo[900],
  "Profile Name Color": Colors.red[900],
};

Map<String, Color> narutoMod = {
  "Container Color": Colors.grey[900],
  "Background Color": Color(0xffec931b),
  "Color 1": Color(0xfff0d91d),
  "Color 2": Colors.grey[900],
  "Profile Name Color": Colors.white,
};

Map<Mod, String> modImages = {
  Mod.ICPC: 'ICPC_Images/ICPC Logo.png',
  Mod.MEGA: 'Images/Mega Logo.png',
  Mod.CatReloaded: 'Cat Reloaded_Images/Cat Reloaded Logo.png',
  Mod.Normal: 'Images/Demory Logo.png',
  Mod.Dark: 'Images/Dark.png',
  Mod.DetectiveConan: 'Conan_Images/Conan_Logo.png',
  Mod.Naruto: 'Naruto_Images/Naruto Logo.png',
};

Map<Mod, String> modImagesPaths = {
  Mod.ICPC: 'ICPC_Images/',
  Mod.MEGA: 'Images/',
  Mod.CatReloaded: 'Cat Reloaded_Images/',
  Mod.Normal: 'Images/',
  Mod.Dark: 'Images/',
  Mod.DetectiveConan: 'Conan_Images/',
  Mod.Naruto: 'Naruto_Images/',
};
