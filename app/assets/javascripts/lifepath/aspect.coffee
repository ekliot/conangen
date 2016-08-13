$( window ).load ->
  @select_aspect( document.getElementById( "aspect#{idx}::1" ) ) for idx in [1,2]

ICON_RADIO  = '<i class="ui large radio icon"></i>'
ICON_CIRCLE = '<i class="ui large circle icon"></i>'

aspect1 =
  name:   ""
  mand1:  ""
  mand2:  ""
  opt1:   ""
  opt2:   ""

aspect2 =
  name:   ""
  mand1:  ""
  mand2:  ""
  opt1:   ""
  opt2:   ""

sel_best = ""
sel_worst = ""

sel_opt1 = ""
sel_opt2 = ""

# HELPER METHODS
# ==============

# check if the given attribute is in both of the selected aspects
@check_dupe = ( attr ) ->
  asp1_check = aspect1.mand1 == attr or aspect1.mand2 == attr
  asp2_check = aspect2.mand1 == attr or aspect2.mand2 == attr
  return ( asp1_check and asp2_check )

# CELL STATE HELPERS
# ==================

# clear all states from the cell (i.e. make it unselectable)
@clear_cell = ( ele ) ->
  ele.innerHTML = ""
  ele.className = ele.className.replace "selectable", ""

# make the cell selected
@select_cell = ( ele ) ->
  if ele.className.indexOf( "selectable" ) != -1 then ele.innerHTML = ICON_CIRCLE

# deselect the cell, but keep it available
# this is functionally the same as @available_cell(), but is semantically nicer
@deselect_cell = ( ele ) ->
  @available_cell( ele )

# make the cell available for selection
@available_cell = ( ele ) ->
  @clear_cell( ele )
  ele.className += ( " selectable")
  ele.innerHTML = ICON_RADIO

@clear_all_cells = () ->
  for cell in document.getElementsByClassName( "aspect_cell" )
    @clear_cell( cell )

@fill_cells = () ->
  @clear_all_cells()

  @available_cell( document.getElementById( "aspect_#{ aspect1.mand1[0..2] }_best" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect1.mand1[0..2] }_worst" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect1.mand2[0..2] }_best" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect1.mand2[0..2] }_worst" ) )

  @available_cell( document.getElementById( "aspect_#{ aspect1.opt1[0..2] }_opt1" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect1.opt1[0..2] }_opt2" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect1.opt2[0..2] }_opt1" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect1.opt2[0..2] }_opt2" ) )

  @available_cell( document.getElementById( "aspect_#{ aspect2.mand1[0..2] }_best" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect2.mand1[0..2] }_worst" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect2.mand2[0..2] }_best" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect2.mand2[0..2] }_worst" ) )

  @available_cell( document.getElementById( "aspect_#{ aspect2.opt1[0..2] }_opt1" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect2.opt1[0..2] }_opt2" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect2.opt2[0..2] }_opt1" ) )
  @available_cell( document.getElementById( "aspect_#{ aspect2.opt2[0..2] }_opt2" ) )

# CHOICE SELECTION METHODS
# ========================

# select one of the aspect tabs
@select_aspect = ( ele ) ->
  if ele.getAttribute( "data-tab" ).indexOf( "aspect1" ) != -1
    aspect1.name  = ele.getAttribute( "data-aspect-name" )
    aspect1.mand1 = ele.getAttribute( "data-mand1" )
    aspect1.mand2 = ele.getAttribute( "data-mand2" )
    aspect1.opt1  = ele.getAttribute( "data-opt1" )
    aspect1.opt2  = ele.getAttribute( "data-opt2" )

    document.getElementById( "aspect1_card_header" ).innerHTML  = aspect1.name
    document.getElementById( "aspect1_mand1" ).innerHTML = aspect1.mand1.toUpperCase()
    document.getElementById( "aspect1_mand2" ).innerHTML = aspect1.mand2.toUpperCase()
    document.getElementById( "aspect1_opt1" ).innerHTML  = aspect1.opt1.toUpperCase()
    document.getElementById( "aspect1_opt2" ).innerHTML  = aspect1.opt2.toUpperCase()
  else
    aspect2.name  = ele.getAttribute( "data-aspect-name" )
    aspect2.mand1 = ele.getAttribute( "data-mand1" )
    aspect2.mand2 = ele.getAttribute( "data-mand2" )
    aspect2.opt1  = ele.getAttribute( "data-opt1" )
    aspect2.opt2  = ele.getAttribute( "data-opt2" )

    document.getElementById( "aspect2_card_header" ).innerHTML = aspect2.name
    document.getElementById( "aspect2_mand1" ).innerHTML = aspect2.mand1.toUpperCase()
    document.getElementById( "aspect2_mand2" ).innerHTML = aspect2.mand2.toUpperCase()
    document.getElementById( "aspect2_opt1" ).innerHTML  = aspect2.opt1.toUpperCase()
    document.getElementById( "aspect2_opt2" ).innerHTML  = aspect2.opt2.toUpperCase()

  @fill_cells()

@select_best = ( attr ) ->
  ele = document.getElementById( "aspect_#{ attr[0..2] }_best" )

  if ele.className.indexOf( "selectable" ) == -1
    return

  # deselect the selected worst attr, if this attr isn't in both aspects
  if !@check_dupe( attr ) and sel_worst == attr
    @deselect_cell( document.getElementById( "aspect_#{ attr[0..2] }_worst" ) )
    sel_worst = ""

  if sel_best != ""
    @deselect_cell( document.getElementById( "aspect_#{ sel_best[0..2] }_best" ) )

  sel_best = attr
  @select_cell( ele )

@select_worst = ( attr ) ->
  ele = document.getElementById( "aspect_#{ attr[0..2] }_worst" )

  if ele.className.indexOf( "selectable" ) == -1
    return

  # deselect the selected best attr, if this attr isn't in both aspects
  if !@check_dupe( attr ) and sel_best == attr
    @deselect_cell( document.getElementById( "aspect_#{ attr[0..2] }_best" ) )
    sel_best = ""

  if sel_worst != ""
    @deselect_cell( document.getElementById( "aspect_#{ sel_worst[0..2] }_worst" ) )

  sel_worst = attr
  @select_cell( ele )

# @select_opt1  = ( attr ) ->
#   # beep
#
# @select_opt2  = ( attr ) ->
#   # beep

# @confirm_aspect = () ->
#   # fill aspect names
#   # fill chosen best
#   # fill chosen worst
#   # fill chosen optional 1
#   # fill chosen optional 2

# @revert_aspect = () ->
#   # clear aspect names
#   # clear chosen best
#   # clear chosen worst
#   # clear chosen optional 1
#   # clear chosen optional 2
