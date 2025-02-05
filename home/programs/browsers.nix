{ pkgs, ... }:

{
  programs = {
    # enable the chromium web browser
    chromium = {
      enable = true;

      extensions = [
        {
          id = "mnjggcdmjocbbbhaepdhchncahnbgone"; # [MEDIA]: "SponsorBlock"
        }
        {
          id = "fbmlcbhdmilaggedifpihjgkkmdgeljh"; # [UTIL]: "Reader Mode"
        }
        {
          id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; # [UTIL]: "Dark Reader"
        }
        {
          id = "bnjjngeaknajbdcgpfkgnonkmififhfo"; # [DEV]: "Fake Filler"
        }
        {
          id = "gmegofmjomhknnokphhckolhcffdaihd"; # [DEV]: "JSONView"
        }
      ];
    };
  };
}
