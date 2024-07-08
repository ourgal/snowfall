(local gears (require :gears))
(local awful (require :awful))
(local menu (require :menu))
(_G.root.buttons (gears.table.join (awful.button {} 3
                                                 (fn []
                                                   (menu.mymainmenu:toggle)))
                                   (awful.button {} 4 awful.tag.viewnext)
                                   (awful.button {} 5 awful.tag.viewprev)))
