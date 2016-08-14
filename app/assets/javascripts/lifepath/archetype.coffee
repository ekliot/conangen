$( window ).load ->
  @select_archetype( document.getElementById( "archetype::1" ) )

sel_archetype =
  name: ""
  opt_skill1: ""
  opt_skill2: ""

@select_archetype = ( ele ) ->
  sel_archetype.name        = ele.getAttribute( "data-arch-name" )
  sel_archetype.opt_skill1  = ""
  sel_archetype.opt_skill2  = ""
  console.log "archetype #{sel_archetype} has been selected"

@select_arch_skill = ( ele ) ->
  skill = ele.getAttribute( "data-skill-elective" )

  # if this skill is already selected
  if sel_opt_skill1 == skill or sel_opt_skill2 == skill
    if skill = sel_opt_skill1
      sel_opt_skill1 = sel_opt_skill2
    sel_opt_skill2 = ""
    ele.className  = ele.className.replace "green", "red"
    console.log "skill #{skill} for archetype has been unselected"

  # otherwise...
  else
    if sel_opt_skill1 == ""
      sel_opt_skill1 = skill
      ele.className = ele.className.replace "red", "green"
    else if sel_opt_skill2 == ""
      sel_opt_skill2 = skill
      ele.className = ele.className.replace "red", "green"
    else
      console.log "skill #{skill} canot be selected"
      return
    console.log "skill #{skill} for archetype has been selected"

# NEED TO ADD EQUIPMENT SELECTION HERE ONCE I IMPLEMENT THAT INTO THE MODEL
