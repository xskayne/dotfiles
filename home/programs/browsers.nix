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
          id = "edibdbjcniadpccecjdfdjjppcpchdlm"; # [UTIL]: "I (Still) Don't Care About Cookies"
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
