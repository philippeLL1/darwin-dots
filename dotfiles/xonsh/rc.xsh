execx($(zoxide init xonsh), 'exec', __xonsh__.ctx, filename='zoxide')
# execx($(starship init xonsh))
from xonsh.xontribs import xontribs_load
xontribs_load(['abbrevs', 'xonsh-cheatsheet', 'rc-awesome', 'argcomplete', 'xonsh-jit'])
