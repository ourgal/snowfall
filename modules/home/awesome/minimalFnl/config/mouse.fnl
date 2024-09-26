(let [gears (require :gears)
      awful (require :awful)
      menu (require :menu)
      join gears.table.join
      button awful.button]
  (_G.root.buttons (join (button {} 3 #(menu.mymainmenu:toggle))
                         (button {} 4 awful.tag.viewnext)
                         (button {} 5 awful.tag.viewprev))))
