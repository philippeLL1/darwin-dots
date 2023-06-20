{ pkgs, ... }: 
{
  enable = true;
  configFile = { text = ''
      let $config = {
        filesize_metric: false
        table_mode: rounded
        use_ls_colors: true
      }
    '';
  };
  extraEnv = '' 
    mkdir ~/.cache/starship 
    starship init nu | save -f ~/.cache/starship/init.nu
  '';
  extraConfig = '' source ~/.cache/starship/init.nu '';

}
