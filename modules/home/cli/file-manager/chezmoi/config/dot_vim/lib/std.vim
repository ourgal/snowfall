vim9script

export class Cursor
  const bufnum: number
  const lnum: number
  const col: number
  const off: number

  def new(pos: string = '.')
    [this.bufnum, this.lnum, this.col, this.off] = getpos(pos)
  enddef

  def SetCursor()
    [this.bufnum, this.lnum, this.col, this.off]->setpos('.')
  enddef
endclass

export class Line
  const str: string

  def new(lnum: string = '.')
    this.str = getline(lnum)
  enddef

  def PrevCursorStr(cursor: Cursor, include: bool = true): string
    const index = max([cursor.col - 1, 0])
    if index == 0
      return ''
    endif
    if include
      return this.str[: index]
    else
      return this.str[: index - 1]
    endif
  enddef

  def AfterCursorStr(cursor: Cursor, include: bool = true): string
    const index = max([cursor.col - 1, 0])
    if index == len(this.str)
      return ''
    endif
    if include
      return this.str[index :]
    else
      return this.str[index + 1 :]
    endif
  enddef

  def Backword(cursor: Cursor)
    search('\<\|\>', 'be', cursor.lnum)
  enddef

  def Jump(cursor: Cursor, words: list<string>, include: bool = true): list<any>
    var flags = []
    if include | flags->add('c') | endif
    const pat = words->copy()->map("'\\<' .. v:val .. '\\>'")->join('\|')
    const lnum = search(pat, join(flags), cursor.lnum)
    return [ lnum != 0 ? true : false, lnum ]
  enddef

endclass
