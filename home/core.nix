{ username, ... }:

{
  # Home directory configuration for the user
  home = {
    inherit username; # Inherit the 'username' variable to refer to the user's name

    # Set the home directory for the user (in this case, it will be /home/<username>)
    homeDirectory = "/home/${username}";

    # Set the system state version to ensure compatibility with the current configuration (version 24.11)
    stateVersion = "24.11";
  };

  # Enable the Home Manager program to manage user-specific configurations
  programs.home-manager.enable = true;
}
