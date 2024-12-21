{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    extensions = (with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      github.github-vscode-theme
      wix.vscode-import-cost
      bierner.emojisense
      esbenp.prettier-vscode
      catppuccin.catppuccin-vsc-icons
      mikestead.dotenv
      seatonjiang.gitmoji-vscode
    ]);

    userSettings = {
      # Workbench
      "workbench.activityBar.location" = "hidden";
      "workbench.colorTheme" = "GitHub Dark";
      "workbench.editor.showTabs" = "single";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.layoutControl.enabled" = false;
      "workbench.sideBar.location" = "right";
      "workbench.startupEditor" = "none";
      "workbench.statusBar.visible" = false;
      "workbench.tree.renderIndentationGuides" = "none";

      # Explorer
      "explorer.decorations.colors" = false;
      "explorer.openEditors.visible" = 0;

      # Editor
      "editor.bracketPairColorization.enabled" = false;
      "editor.cursorBlinking" = "phase";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.fontFamily" = "'GeistMono Nerd Font'";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 15;
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "editor.glyphMargin" = false;
      "editor.guides.bracketPairsHorizontal" = false;
      "editor.guides.highlightActiveBracketPair" = false;
      "editor.guides.indentation" = false;
      "editor.hideCursorInOverviewRuler" = true;
      "editor.minimap.enabled" = false;
      "editor.multiCursorModifier" = "ctrlCMD";
      "editor.overviewRulerBorder" = false;
      "editor.renderLineHighlight" = "none";
      "editor.scrollbar.horizontal" = "hidden";
      "editor.scrollbar.vertical" = "hidden";
      "editor.showFoldingControls" = "never";
      "editor.stickyScroll.enabled" = false;
      "editor.wordSeparators" = "`~!@#%^*()=+[{]}\\|;:'\",.<>/?";

      # Breadcrumbs
      "breadcrumbs.enabled" = false;

      # Files
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 100;
      "files.eol" = "\n";
      "files.insertFinalNewline" = true;
      "files.trimTrailingWhitespace" = true;

      # Window
      "window.menuBarVisibility" = "toggle";
      "window.title" = " ";

      # Terminal
      "terminal.integrated.cursorBlinking" = true;
      "terminal.integrated.cursorStyle" = "line";
      "terminal.integrated.cursorStyleInactive" = "none";
      "terminal.integrated.fontFamily" = "'GeistMono Nerd Font'";
      "terminal.integrated.fontWeight" = 300;

      # Nix language
      "[nix]" = {
        "editor.defaultFormatter" = "jnoortheen.nix-ide";
        "editor.insertSpaces" = true;
        "editor.tabSize" = 2;
      };
    };

    keybindings = [
      {
        key = "ctrl+t";
        command = "workbench.action.terminal.toggleTerminal";
      }
      {
        key = "ctrl+t";
        command = "workbench.action.terminal.focus";
        when = "!terminalFocus";
      }
      {
        key = "ctrl+e ctrl+e";
        command = "workbench.action.focusActiveEditorGroup";
      }
    ];
  };
}
