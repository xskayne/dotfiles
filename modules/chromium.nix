{
  programs.chromium = {
    enable = true;

    extraOpts = {
      # enable bookmark bar
      "BookmarkBarEnabled" = false;

      # enable spellcheck in chromium
      "SpellcheckEnabled" = true;

      # set spellcheck language to british english
      "SpellcheckLanguage" = [
        "en-GB"
      ];

      # list of items to clear on exit
      "ClearBrowsingDataOnExitList" = [
        "browsing_history"
        "download_history"
        "cached_images_and_files"
        "password_signin"
        "autofill"
      ];
    };
  };
}
