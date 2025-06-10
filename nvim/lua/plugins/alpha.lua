return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.startify'

    -- Set header
    dashboard.section.header.val = {
      [[XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKOkkxddoooodxkO0000OkkO000KXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXXXXXXOl;cloodxxoooxxxxxdoolodkOkxxdoodddddkO0KXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXXXXX0,..'',;codxxxxxkkkxdddxxxdol:'...,lddxxxxk0KXXXXXK00O0KXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXXXXXd....';coxkkkkkOkkOkxxxdocc:;'......:odxxxxxxkOOkd:,;;;:kXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXXXXk.....',:ldddxkOOOkkxddoc:cc;,.......';lodxxxxxdooc'',,...:OXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXXXO....  ..,;:lloxxxxxxolcc:c::,'...',;,',;;clxxxxxdoc'';,.....dXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXXo.  .    ..',;codoodoo::::;:;,''.'',;;'....,;coxxkddd:,;,......OXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXx.       .....;:llllc:;;:::;;',''',;,..  ..  .';lxxxddd:::'.....:XXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXO'. .     ....,;;:c::;,;;:ccc,','',;;..  .c;.....,cdxdddlc;'......OXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXK'.. .     ....'',::;,,;:cccc:;',,,',:... .....;,;,,:oddol:,.......'KXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXc... ..........'',;,,;;c:::::c:,;;;',c;'......';::;',:ooolll,.......lXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXX'... ...........'',;;;;,;:c:::::,';;,,,'',;::;;;:cc;,cllocll,........0XXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXd...  .........','''.''',,;:ccc;:,;:;;,'',,;;:clccc;cllllcoc'........;XXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXd...........'........''',,;::::;;:cclc::cc:cccc:ccldoollcoc'.........XXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXK:...'''''...........',;,;::;:;::loooclooc:cc::clddoooc::;,.........XXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXXl.'................''''';;;;;;:clllldddc::;;:codxddoo:,,:'........:XXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXKd;.......................'',,',;;;cclooxklcccoodxdxxxxkxk0Kko;.....cKXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXX0l............................''''',;:loddxkdooodddxxdddxXXXXXXXXX0OO0XXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXX0l..............................'',',;;;ccoddxxolodxxxdooldXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXx...........''''''..'...........'.',;;;;;:ccodooolddooooodoOXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXK. ..........',,,,,'''.'''..'.'.',,,;;:,,;;c:ollllcclloooddkXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXK.    ............''''''','.'''.,,;;;,''''';c:c:cccccclodk0XXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXX;     ......     .....''''',;,',;cc;,,'''..',';;:cllllx0XXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXX;     .. .....   .....',.';:,;::::c:,,,'.....',clllokKXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXK'     ..  ..''....'',;'..,:;;:ccccc:,,,,.....';cclkXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXX;.     .   ......''....',,:;cloccoxlc:;'''.'.',cxKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXk..           ......''',,;cclclxoloolc,''.'..;kXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXX'.....        ....'''',,cclooldxdxdl:;','';xXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXd...'.''....,'......',:cooxxOkkkxooool,,'oKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXl.....',....'''''..,,;:lddxddxOxkoool;l0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXx,.......   ...''',,::coodxddkoooxdxOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXOlc:;'''..........,',::ccoodxxk0KXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXXXXKkoc:,,''';',',',,,:lxKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
      [[XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK0OkkxxxxxkOOKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX]],
    }
    alpha.setup(dashboard.opts)
  end,
}
