let g:pangu_rule_date = 1
autocmd InsertLeave,TextChanged *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing('ALL')
