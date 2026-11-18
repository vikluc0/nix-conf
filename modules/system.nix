{...}: {
  networking.hostName = "VirusPC";

  time.timeZone = "America/Lower_Princes";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    useXkbConfig = true;
  };
}
