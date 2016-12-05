# $( window ).load ->
#   @select_nature( document.getElementById( "nature::1" ) )

@select_nature = ( ele ) ->
  sel_nature.name   = ele.getAttribute( "data-nature-name" )
  sel_nature.talent = ""
  sel_nature.opt_skill1 = ""
  sel_nature.opt_skill1 = ""
  console.log "NATURE #{sel_nature.name} has been selected"

@select_nat_skill = ( ele ) ->
  skill = ele.getAttribute( "data-skill-elective" )

  # if this skill is already selected
  if sel_nature.opt_skill1 == skill or sel_nature.opt_skill2 == skill
    if skill == sel_nature.opt_skill1
      sel_nature.opt_skill1 = sel_nature.opt_skill2
    sel_nature.opt_skill2 = ""
    ele.className  = ele.className.replace "green", "red"
    console.log "NATURE skill #{skill} has been unselected"

  # otherwise...
  else
    if sel_nature.opt_skill1 == ""
      sel_nature.opt_skill1 = skill
      ele.className = ele.className.replace "red", "green"
    else if sel_nature.opt_skill2 == ""
      sel_nature.opt_skill2 = skill
      ele.className = ele.className.replace "red", "green"
    else
      console.log "NATURE skill #{skill} cannot be selected"
      return
    console.log "NATURE skill #{skill} has been selected"
