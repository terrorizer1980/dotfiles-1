function! InspectHightlightGroup()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

command! InspectHightlightGroup echo InspectHightlightGroup()
