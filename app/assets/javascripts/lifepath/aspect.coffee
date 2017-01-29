# $( window ).load ->
#   @select_aspect( document.getElementById( "aspect#{idx}::1" ) ) for idx in [1,2]

ICON_RADIO  = '<div class="ui basic compact center aligned segment" style="cursor: pointer"><i class="ui large radio icon" style="cursor: pointer"></i></div>'
ICON_CIRCLE = '<div class="ui basic compact center aligned segment" style="cursor: pointer"><i class="ui large circle icon" style="cursor: pointer"></i></div>'

attr_dec_cnt = 0
attr_inc_cnt = 0
attr_changes =
  dec: [ "", "" ]
  inc: [ "", "" ]

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

# HELPER METHODS
# ==============

@increment_attr = ( attr ) ->
  pass = true

  if attr_changes.dec.indexOf( attr ) != -1
    attr_changes.dec[ attr_changes.dec.indexOf( attr ) ] = ""
    attr_dec_cnt -= 1
  else if attr_changes.inc.indexOf( "" ) != -1
    attr_changes.inc[ attr_changes.inc.indexOf( "" ) ] = attr
    attr_inc_cnt += 1
  else
    pass = false

  if pass
    counter =  document.getElementById( "attr_#{ attr[0..2] }_counter" )

    switch attr
      when "agility"
        @attrs.agility += 1
        counter.innerHTML = "#{@attrs.agility}"
      when "awareness"
        @attrs.awareness += 1
        counter.innerHTML = "#{@attrs.awareness}"
      when "brawn"
        @attrs.brawn += 1
        counter.innerHTML = "#{@attrs.brawn}"
      when "coordination"
        @attrs.coordination += 1
        counter.innerHTML = "#{@attrs.coordination}"
      when "intelligence"
        @attrs.intelligence += 1
        counter.innerHTML = "#{@attrs.intelligence}"
      when "personality"
        @attrs.personality += 1
        counter.innerHTML = "#{@attrs.personality}"
      when "willpower"
        @attrs.willpower += 1
        counter.innerHTML = "#{@attrs.willpower}"

    console.log "ASPECTS::increment_attr(#{attr}) => #{attr} incremented"

    if attr_inc_cnt == attr_dec_cnt
      for btn in document.getElementsByClassName( "attr_inc_btn" )
        if btn.className.indexOf( "disabled" ) == -1 then btn.className += " disabled"

    if attr_dec_cnt < 2
      for btn in document.getElementsByClassName( "attr_dec_btn" )
        btn.className = btn.className.replace " disabled", ""

    if attr_dec_cnt == 2
      inc1 = attr_changes.inc[0][0..2]
      inc2 = attr_changes.inc[1][0..2]
      for inc in [ inc1, inc2 ]
        if inc != ""
          btn = document.getElementById( "attr_#{ inc }_btndn" )
          btn.className = btn.className.replace " disabled", ""

    set_total( attr )
  else
    console.log "ASPECTS::increment_attr(#{attr}) => attribute #{attr} cannot be incremented"

@decrement_attr = ( attr ) ->
  pass = true

  if attr_changes.inc.indexOf( attr ) != -1
    attr_changes.inc[ attr_changes.inc.indexOf( attr ) ] = ""
    attr_inc_cnt -= 1
  else if attr_changes.dec.indexOf( "" ) != -1
    attr_changes.dec[ attr_changes.dec.indexOf( "" ) ] = attr
    attr_dec_cnt += 1
  else
    pass = false

  if pass
    for btn in document.getElementsByClassName( "attr_inc_btn" )
      btn.className = btn.className.replace " disabled", ""

    counter = document.getElementById( "attr_#{ attr[0..2] }_counter" )

    switch attr
      when "agility"
        @attrs.agility -= 1
        counter.innerHTML = "#{@attrs.agility}"
      when "awareness"
        @attrs.awareness -= 1
        counter.innerHTML = "#{@attrs.awareness}"
      when "brawn"
        @attrs.brawn -= 1
        counter.innerHTML = "#{@attrs.brawn}"
      when "coordination"
        @attrs.coordination -= 1
        counter.innerHTML = "#{@attrs.coordination}"
      when "intelligence"
        @attrs.intelligence -= 1
        counter.innerHTML = "#{@attrs.intelligence}"
      when "personality"
        @attrs.personality -= 1
        counter.innerHTML = "#{@attrs.personality}"
      when "willpower"
        @attrs.willpower -= 1
        counter.innerHTML = "#{@attrs.willpower}"

    console.log "ASPECTS::decrement_attr(#{attr}) => attribute #{attr} decremented"

    if attr_dec_cnt == 2
      for btn in document.getElementsByClassName( "attr_dec_btn" )
        inc1 = attr_changes.inc[0][0..2]
        inc2 = attr_changes.inc[1][0..2]
        check1 = ( inc1 == "" or btn.id.indexOf( inc1 ) == -1 )
        check2 = ( inc2 == "" or btn.id.indexOf( inc2 ) == -1 )
        if check1 and check2
          if btn.className.indexOf( "disabled" ) == -1 then btn.className += " disabled"

    set_total( attr )
  else
    console.log "ASPECTS::decrement_attr(#{attr}) => attribute #{attr} cannot be decremented"

# hide or unhide the ancient bloodline talent notification box
notify_ancient = () ->
  tots = [
    @total_attrs.agility, @total_attrs.awareness, @total_attrs.brawn,
    @total_attrs.coordination, @total_attrs.intelligence,
    @total_attrs.personality, @total_attrs.willpower
  ]

  show = false
  for val in tots
    if val > 12
      show = true
      break

  if show then display = "block" else display = "none"

  document.getElementById( "aspects_ancient_message" ).style.display = display

  @ancient_bloodline = show

# check if the given attribute is in both of the selected aspects
# args =>
#   attr => string => which attribute to check
#   sec  => string => which attribute category, "mand" or "opt"
check_dupe = ( attr, sec ) ->
  if sec == "mand"
    asp1_check = aspect1.mand1 == attr or aspect1.mand2 == attr
    asp2_check = aspect2.mand1 == attr or aspect2.mand2 == attr
  else
    asp1_check = aspect1.opt1 == attr or aspect1.opt2 == attr
    asp2_check = aspect2.opt1 == attr or aspect2.opt2 == attr
  return ( asp1_check and asp2_check )

# wipes all attribute bonuses
clear_bonus = () ->
  document.getElementById( "attr_agi_tot" ).innerHTML = "0"
  document.getElementById( "attr_awa_tot" ).innerHTML = "0"
  document.getElementById( "attr_bra_tot" ).innerHTML = "0"
  document.getElementById( "attr_coo_tot" ).innerHTML = "0"
  document.getElementById( "attr_int_tot" ).innerHTML = "0"
  document.getElementById( "attr_per_tot" ).innerHTML = "0"
  document.getElementById( "attr_wil_tot" ).innerHTML = "0"

  @bonus.agility = 0
  @bonus.awareness = 0
  @bonus.brawn = 0
  @bonus.coordination = 0
  @bonus.intelligence = 0
  @bonus.personality = 0
  @bonus.willpower = 0

# reset all the bonuses back to default for currently selected attributes
reset_bonus = () ->
  clear_bonus()

  mod_bonus( 2, aspect1.mand1 )
  mod_bonus( 2, aspect1.mand2 )
  mod_bonus( 2, aspect2.mand1 )
  mod_bonus( 2, aspect2.mand2 )

set_total = ( attr ) ->
  ele = document.getElementById( "attr_#{ attr[0..2] }_tot" )

  switch attr
    when "agility"
      tot = @attrs.agility + @bonus.agility
      ele.innerHTML = "#{tot}"
      @total_attrs.agility = tot
    when "awareness"
      tot = @attrs.awareness + @bonus.awareness
      ele.innerHTML = "#{tot}"
      @total_attrs.awareness = tot
    when "brawn"
      tot = @attrs.brawn + @bonus.brawn
      ele.innerHTML = "#{tot}"
      @total_attrs.brawn = tot
    when "coordination"
      tot = @attrs.coordination + @bonus.coordination
      ele.innerHTML = "#{tot}"
      @total_attrs.coordination = tot
    when "intelligence"
      tot = @attrs.intelligence + @bonus.intelligence
      ele.innerHTML = "#{tot}"
      @total_attrs.intelligence = tot
    when "personality"
      tot = @attrs.personality + @bonus.personality
      ele.innerHTML = "#{tot}"
      @total_attrs.personality = tot
    when "willpower"
      tot = @attrs.willpower + @bonus.willpower
      ele.innerHTML = "#{tot}"
      @total_attrs.willpower = tot

  notify_ancient()

mod_bonus = ( amt, attr ) ->
  ele = document.getElementById( "attr_#{ attr[0..2] }_bon" )

  switch attr
    when "agility"
      @bonus.agility += amt
      ele.innerHTML = "+#{@bonus.agility}"
    when "awareness"
      @bonus.awareness += amt
      ele.innerHTML = "+#{@bonus.awareness}"
    when "brawn"
      @bonus.brawn += amt
      ele.innerHTML = "+#{@bonus.brawn}"
    when "coordination"
      @bonus.coordination += amt
      ele.innerHTML = "+#{@bonus.coordination}"
    when "intelligence"
      @bonus.intelligence += amt
      ele.innerHTML = "+#{@bonus.intelligence}"
    when "personality"
      @bonus.personality += amt
      ele.innerHTML = "+#{@bonus.personality}"
    when "willpower"
      @bonus.willpower += amt
      ele.innerHTML = "+#{@bonus.willpower}"

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
  available_cell( ele )

# make the cell available for selection
available_cell = ( ele ) ->
  clear_cell( ele )
  ele.className += ( " selectable")
  ele.innerHTML = ICON_RADIO

clear_all_cells = () ->
  for cell in document.getElementsByClassName( "aspect_cell" )
    if cell.className.indexOf( "selectable" ) != -1 then clear_cell( cell )

  @sel_best = ""
  @sel_worst = ""
  @sel_opt1 = ""
  @sel_opt2 = ""

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

    console.log "ASPECT first ...  #{aspect1.name} selected"
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

    console.log "ASPECT second ...  #{aspect2.name} selected"

  fill_cells()

@select_best = ( attr ) ->
  ele = document.getElementById( "aspect_#{ attr[0..2] }_best" )

  if ele.className.indexOf( "selectable" ) == -1
    return

  # deselect the selected worst attr, if this attr isn't in both aspects
  if !check_dupe( attr, "mand" ) and @sel_worst == attr
    deselect_cell( document.getElementById( "aspect_#{ attr[0..2] }_worst" ) )
    # previous worst becomes not-worst/best (+2 bonus)
    mod_bonus( -1 + 2, @sel_worst )
    @sel_worst = ""

  if @sel_best != ""
    deselect_cell( document.getElementById( "aspect_#{ @sel_best[0..2] }_best" ) )
    # previous best becomes not-best/worst (+2 bonus)
    mod_bonus( -3 + 2, @sel_best )

  @sel_best = attr
  select_cell( ele )
  # attr becomes best from not-best/worst (+3 bonus)
  mod_bonus( -2 + 3, attr )

  console.log "best attribute #{attr} selected"

@select_worst = ( attr ) ->
  ele = document.getElementById( "aspect_#{ attr[0..2] }_worst" )

  if ele.className.indexOf( "selectable" ) == -1
    return

  # deselect the selected best attr, if this attr isn't in both aspects
  if !check_dupe( attr, "mand" ) and @sel_best == attr
    deselect_cell( document.getElementById( "aspect_#{ attr[0..2] }_best" ) )
    # previous best becomes not-worst/best (+2 bonus)
    mod_bonus( -3 + 2, @sel_best )
    @sel_best = ""

  if @sel_worst != ""
    deselect_cell( document.getElementById( "aspect_#{ @sel_worst[0..2] }_worst" ) )
    # previous worst becomes not-best/worst (+2 bonus)
    mod_bonus( -1 + 2, @sel_worst )

  @sel_worst = attr
  select_cell( ele )
  # attr becomes worst from not-best/worst (+1 bonus)
  mod_bonus( -2 + 1, attr )

  console.log "worst attribute #{attr} selected"

@select_opt1  = ( attr ) ->
  ele = document.getElementById( "aspect_#{ attr[0..2] }_opt1" )

  if ele.className.indexOf( "selectable" ) == -1
    return

  # deselect the selected opt2 attr, if this attr isn't in both aspects
  if !check_dupe( attr, "opt" ) and @sel_opt2 == attr
    deselect_cell( document.getElementById( "aspect_#{ attr[0..2] }_opt2" ) )
    # previous opt2 becomes null (+0 bonus)
    mod_bonus( -1 + 0, @sel_opt2 )
    @sel_opt2 = ""

  if @sel_opt1 != ""
    deselect_cell( document.getElementById( "aspect_#{ @sel_opt1[0..2] }_opt1" ) )
    # previous opt1 becomes null (+0 bonus)
    mod_bonus( -1 + 0, @sel_opt1 )

  @sel_opt1 = attr
  select_cell( ele )
  # attr becomes selected opt1 from null (+1 bonus)
  mod_bonus( -0 + 1, attr )

  console.log "first optional attribute #{attr} selected"

@select_opt2  = ( attr ) ->
  ele = document.getElementById( "aspect_#{ attr[0..2] }_opt2" )

  if ele.className.indexOf( "selectable" ) == -1
    return

  # deselect the selected opt2 attr, if this attr isn't in both aspects
  if !check_dupe( attr, "opt" ) and @sel_opt2 == attr
    deselect_cell( document.getElementById( "aspect_#{ attr[0..2] }_opt1" ) )
    # previous opt1 becomes null (+0 bonus)
    mod_bonus( -1 + 0, @sel_opt1 )
    @sel_opt1 = ""

  if @sel_opt2 != ""
    deselect_cell( document.getElementById( "aspect_#{ @sel_opt2[0..2] }_opt2" ) )
    # previous opt2 becomes null (+0 bonus)
    mod_bonus( -1 + 0, @sel_opt2 )

  @sel_opt2 = attr
  select_cell( ele )
  # attr becomes selected opt2 from null (+1 bonus)
  mod_bonus( -0 + 1, attr )

  console.log "second optional attribute #{attr} selected"

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
