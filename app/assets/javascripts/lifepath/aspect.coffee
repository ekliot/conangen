$( window ).load ->
  @select_aspect( document.getElementById( "aspect#{idx}::1" ) ) for idx in [1,2]

ICON_RADIO  = '<div class="ui basic center aligned segment"><i class="ui large radio icon" style="cursor: default""></i></div>'
ICON_CIRCLE = '<div class="ui basic center aligned segment"><i class="ui large circle icon" style="cursor: default"></i></div>'

attrs =
  agility: 7
  awareness: 7
  brawn: 7
  coordination: 7
  intelligence: 7
  personality: 7
  willpower: 7

bonus =
  agility: 0
  awareness: 0
  brawn: 0
  coordination: 0
  intelligence: 0
  personality: 0
  willpower: 0

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
check_dupe = ( attr ) ->
  asp1_check = aspect1.mand1 == attr or aspect1.mand2 == attr
  asp2_check = aspect2.mand1 == attr or aspect2.mand2 == attr
  return ( asp1_check and asp2_check )

reset_bonus = () ->
  mod_bonus( -(bonus.agility), "agility" )
  mod_bonus( -(bonus.awareness), "awareness" )
  mod_bonus( -(bonus.brawn), "brawn" )
  mod_bonus( -(bonus.coordination), "coordination" )
  mod_bonus( -(bonus.intelligence), "intelligence" )
  mod_bonus( -(bonus.personality), "personality" )
  mod_bonus( -(bonus.willpower), "willpower" )

  mod_bonus( 2, aspect1.mand1 )
  mod_bonus( 2, aspect1.mand2 )
  mod_bonus( 2, aspect2.mand1 )
  mod_bonus( 2, aspect2.mand2 )

set_total = ( attr ) ->
  ele = document.getElementById( "attr_#{ attr[0..2] }_tot" )

  switch attr
    when "agility" then ele.innerHTML = "#{attrs.agility + bonus.agility}"
    when "awareness" then ele.innerHTML = "#{attrs.awareness + bonus.awareness}"
    when "brawn" then ele.innerHTML = "#{attrs.brawn + bonus.brawn}"
    when "coordination" then ele.innerHTML = "#{attrs.coordination + bonus.coordination}"
    when "intelligence" then ele.innerHTML = "#{attrs.intelligence + bonus.intelligence}"
    when "personality" then ele.innerHTML = "#{attrs.personality + bonus.personality}"
    when "willpower" then ele.innerHTML = "#{attrs.willpower + bonus.willpower}"

mod_bonus = ( amt, attr ) ->
  ele = document.getElementById( "attr_#{ attr[0..2] }_bon" )

  console.log "modifying #{attr} bonus by #{amt}"

  switch attr
    when "agility"
      bonus.agility += amt
      ele.innerHTML = "+#{bonus.agility}"
    when "awareness"
      bonus.awareness += amt
      ele.innerHTML = "+#{bonus.awareness}"
    when "brawn"
      bonus.brawn += amt
      ele.innerHTML = "+#{bonus.brawn}"
    when "coordination"
      bonus.coordination += amt
      ele.innerHTML = "+#{bonus.coordination}"
    when "intelligence"
      bonus.intelligence += amt
      ele.innerHTML = "+#{bonus.intelligence}"
    when "personality"
      bonus.personality += amt
      ele.innerHTML = "+#{bonus.personality}"
    when "willpower"
      bonus.willpower += amt
      ele.innerHTML = "+#{bonus.willpower}"

  set_total( attr )

# CELL STATE HELPERS
# ==================

# clear all states from the cell (i.e. make it unselectable)
clear_cell = ( ele ) ->
  ele.innerHTML = ""
  ele.className = ele.className.replace "selectable", ""

# make the cell selected
select_cell = ( ele ) ->
  if ele.className.indexOf( "selectable" ) != -1 then ele.innerHTML = ICON_CIRCLE

# deselect the cell, but keep it available
# this is functionally the same as available_cell(), but is semantically nicer
deselect_cell = ( ele ) ->
  console.log "deselecting #{ele.id}"
  available_cell( ele )

# make the cell available for selection
available_cell = ( ele ) ->
  clear_cell( ele )
  ele.className += ( " selectable")
  ele.innerHTML = ICON_RADIO

clear_all_cells = () ->
  for cell in document.getElementsByClassName( "aspect_cell" )
    if cell.className.indexOf( "selectable" ) != -1 then clear_cell( cell )

  sel_best = ""
  sel_worst = ""
  sel_opt1 = ""
  sel_opt2 = ""

fill_cells = () ->
  clear_all_cells()

  available_cell( document.getElementById( "aspect_#{ aspect1.mand1[0..2] }_best" ) )
  available_cell( document.getElementById( "aspect_#{ aspect1.mand1[0..2] }_worst" ) )
  available_cell( document.getElementById( "aspect_#{ aspect1.mand2[0..2] }_best" ) )
  available_cell( document.getElementById( "aspect_#{ aspect1.mand2[0..2] }_worst" ) )

  available_cell( document.getElementById( "aspect_#{ aspect1.opt1[0..2] }_opt1" ) )
  available_cell( document.getElementById( "aspect_#{ aspect1.opt1[0..2] }_opt2" ) )
  available_cell( document.getElementById( "aspect_#{ aspect1.opt2[0..2] }_opt1" ) )
  available_cell( document.getElementById( "aspect_#{ aspect1.opt2[0..2] }_opt2" ) )

  if aspect2.name != ""
    available_cell( document.getElementById( "aspect_#{ aspect2.mand1[0..2] }_best" ) )
    available_cell( document.getElementById( "aspect_#{ aspect2.mand1[0..2] }_worst" ) )
    available_cell( document.getElementById( "aspect_#{ aspect2.mand2[0..2] }_best" ) )
    available_cell( document.getElementById( "aspect_#{ aspect2.mand2[0..2] }_worst" ) )

    available_cell( document.getElementById( "aspect_#{ aspect2.opt1[0..2] }_opt1" ) )
    available_cell( document.getElementById( "aspect_#{ aspect2.opt1[0..2] }_opt2" ) )
    available_cell( document.getElementById( "aspect_#{ aspect2.opt2[0..2] }_opt1" ) )
    available_cell( document.getElementById( "aspect_#{ aspect2.opt2[0..2] }_opt2" ) )

    reset_bonus()

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

  fill_cells()

@select_best = ( attr ) ->
  ele = document.getElementById( "aspect_#{ attr[0..2] }_best" )

  if ele.className.indexOf( "selectable" ) == -1
    return

  # deselect the selected worst attr, if this attr isn't in both aspects
  if !check_dupe( attr ) and sel_worst == attr
    deselect_cell( document.getElementById( "aspect_#{ attr[0..2] }_worst" ) )
    # previous worst becomes not-worst/best (+2 bonus)
    mod_bonus( -1 + 2, sel_worst )
    sel_worst = ""

  if sel_best != ""
    deselect_cell( document.getElementById( "aspect_#{ sel_best[0..2] }_best" ) )
    # previous best becomes not-best/worst (+2 bonus)
    mod_bonus( -3 + 2, sel_best )

  sel_best = attr
  select_cell( ele )
  # attr becomes best from not-best/worst (+3 bonus)
  mod_bonus( -2 + 3, attr )

@select_worst = ( attr ) ->
  ele = document.getElementById( "aspect_#{ attr[0..2] }_worst" )

  if ele.className.indexOf( "selectable" ) == -1
    return

  # deselect the selected best attr, if this attr isn't in both aspects
  if !check_dupe( attr ) and sel_best == attr
    deselect_cell( document.getElementById( "aspect_#{ attr[0..2] }_best" ) )
    # previous best becomes not-worst/best (+2 bonus)
    mod_bonus( -3 + 2, sel_best )
    sel_best = ""

  if sel_worst != ""
    deselect_cell( document.getElementById( "aspect_#{ sel_worst[0..2] }_worst" ) )
    # previous worst becomes not-best/worst (+2 bonus)
    mod_bonus( -1 + 2, sel_worst )

  sel_worst = attr
  select_cell( ele )
  # attr becomes worst from not-best/worst (+1 bonus)
  mod_bonus( -2 + 1, attr )

@select_opt1  = ( attr ) ->
  # beep
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
