$( window ).load ->
  @select_edu( document.getElementById( "education::1" ) )

@select_edu = ( ele ) ->
  sel_edu.name   = ele.getAttribute( "data-edu-name" )
  sel_edu.talent = ""
  sel_edu.opt_skill1 = ""
  sel_edu.opt_skill1 = ""
  console.log "education #{sel_edu.name} has been selected"

@select_edu_skill = ( ele ) ->
  skill = ele.getAttribute( "data-skill-elective" )

  # if this skill is already selected
  if sel_edu.opt_skill1 == skill or sel_edu.opt_skill2 == skill
    if skill == sel_edu.opt_skill1
      sel_edu.opt_skill1 = sel_edu.opt_skill2
    sel_edu.opt_skill2 = ""
    ele.className  = ele.className.replace "green", "red"
    console.log "skill #{skill} for education has been unselected"

  # otherwise...
  else
    if sel_edu.opt_skill1 == ""
      sel_edu.opt_skill1 = skill
      ele.className = ele.className.replace "red", "green"
    else if sel_edu.opt_skill2 == ""
      sel_edu.opt_skill2 = skill
      ele.className = ele.className.replace "red", "green"
    else
      console.log "skill #{skill} for cannot be selected"
      return
    console.log "skill #{skill} for education has been selected"
