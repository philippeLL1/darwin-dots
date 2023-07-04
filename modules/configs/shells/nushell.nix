{ pkgs, ... }: 
{
  enable = true;
  configFile = { text = ''
      let-env config = {
        ls: {
          use_ls_colors: true # use the LS_COLORS environment variable to colorize output
          clickable_links: true # enable or disable clickable links. Your terminal has to support links.
        }
        rm: {
          always_trash: true # always act as if -t was given. Can be overridden with -p
        }
        cd: {
          abbreviations: true # allows `cd s/o/f` to expand to `cd some/other/folder`
        }
        table: {
          mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
          index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
          trim: {
            methodology: wrapping # wrapping or truncating
            wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
            truncating_suffix: "..." # A suffix used by the 'truncating' methodology
          }
        }
        history: {
          max_size: 10000 # Session has to be reloaded for this to take effect
          sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
          file_format: "plaintext" # "sqlite" or "plaintext"
        }
        completions: {
          case_sensitive: false # set to true to enable case-sensitive completions
          quick: true  # set this to false to prevent auto-selecting completions when only one remains
          partial: true  # set this to false to prevent partial filling of the prompt
          algorithm: "prefix"  # prefix or fuzzy
          external: {
            enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions 
            max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
            completer: null # check 'carapace_completer' above as an example
          }
        }
        filesize: {
          metric: true    # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
          format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
        }
        show_banner: false

      }'';
  };
  extraEnv = '' 
    mkdir ~/.cache/starship 
    starship init nu | save -f ~/.cache/starship/init.nu
    zoxide init nushell | save -f ~/.zoxide.nu
  '';
  extraConfig = '' source ~/.cache/starship/init.nu 
    source ~/.zoxide.nu '';

}
