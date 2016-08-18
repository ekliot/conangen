$( window ).load ->
  @select_archetype( document.getElementById( "archetype::1" ) )

@select_archetype = ( ele ) ->
  sel_archetype.name          = ele.getAttribute( "data-arch-name" )
  sel_archetype.talent        = ele.getAttribute( "data-arch-talent" )
  sel_archetype.career_skill  = ele.getAttribute( "data-arch-career-skill" )
  sel_archetype.opt_skill1    = ""
  sel_archetype.opt_skill2    = ""

  console.log "career skills are now #{ sel_archetype.career_skill }"

  career_skills = document.getElementsByClassName( "career_skill" )

  for skill in career_skills
    skill_head = skill.getElementsByClassName( "header" )[0]
    skill_head.innerHTML = sel_archetype.career_skill

  console.log "archetype #{sel_archetype.name} has been selected"

@select_arch_skill = ( ele ) ->
  skill = ele.getAttribute( "data-skill-elective" )

  # if this skill is already selected
  if sel_archetype.opt_skill1 == skill or sel_archetype.opt_skill2 == skill
    if skill == sel_archetype.opt_skill1
      sel_archetype.opt_skill1 = sel_archetype.opt_skill2
    sel_archetype.opt_skill2 = ""
    ele.className  = ele.className.replace "green", "red"
    console.log "skill #{skill} for archetype has been unselected"

  # otherwise...
  else
    if sel_archetype.opt_skill1 == ""
      sel_archetype.opt_skill1 = skill
      ele.className = ele.className.replace "red", "green"
    else if sel_archetype.opt_skill2 == ""
      sel_archetype.opt_skill2 = skill
      ele.className = ele.className.replace "red", "green"
    else
      console.log "skill #{skill} cannot be selected"
      return
    console.log "skill #{skill} for archetype has been selected"

# NEED TO ADD EQUIPMENT SELECTION HERE ONCE I IMPLEMENT THAT INTO THE MODEL
