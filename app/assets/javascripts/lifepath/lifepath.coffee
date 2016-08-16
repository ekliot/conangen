$( window ).load ->
  @hl_seg           = document.getElementById( "create_hl" )
  @aspect_seg       = document.getElementById( "create_aspect" )
  @caste_section    = document.getElementById( "create_caste" )
  @caste_story_seg  = document.getElementById( "caste_story_seg" )
  @arch_seg         = document.getElementById( "create_arch" )
  @nature_seg       = document.getElementById( "create_nature" )
  @edu_seg          = document.getElementById( "create_edu" )
  @warstory_seg     = document.getElementById( "create_warstory" )
  @finish_seg       = document.getElementById( "create_finish" )

skill_tally =
  acrobatics:
    exp: 0
    foc: 0
  alchemy:
    exp: 0
    foc: 0
  animal_handling:
    exp: 0
    foc: 0
  athletics:
    exp: 0
    foc: 0
  command:
    exp: 0
    foc: 0
  counsel:
    exp: 0
    foc: 0
  craft:
    exp: 0
    foc: 0
  discipline:
    exp: 0
    foc: 0
  healing:
    exp: 0
    foc: 0
  insight:
    exp: 0
    foc: 0
  linguistics:
    exp: 0
    foc: 0
  lore:
    exp: 0
    foc: 0
  melee:
    exp: 0
    foc: 0
  observation:
    exp: 0
    foc: 0
  parry:
    exp: 0
    foc: 0
  persuade:
    exp: 0
    foc: 0
  ranged:
    exp: 0
    foc: 0
  resistance:
    exp: 0
    foc: 0
  sailing:
    exp: 0
    foc: 0
  siegecraft:
    exp: 0
    foc: 0
  society:
    exp: 0
    foc: 0
  sorcery:
    exp: 0
    foc: 0
  stealth:
    exp: 0
    foc: 0
  survival:
    exp: 0
    foc: 0
  thievery:
    exp: 0
    foc: 0

# @next_create_tab = () ->
#   # switch for current tab
#
#   @confirm_homeland
#   or
#   @confirm_aspect
#   or
#   @confirm_caste
#   @confirm_caste_story
#   or
#   @confirm_archetype
#   or
#   @confirm_nature
#   or
#   @confirm_education
#   or
#   @confirm_war_story
#   or
#   @confirm_finishing
#
#   # go to next tab if not finishing

# @prev_create_tab = () ->
#   # switch for current tab
#
#   @revert_homeland
#   or
#   @revert_aspect
#   or
#   @revert_caste
#   @revert_caste_story
#   or
#   @revert_archetype
#   or
#   @revert_nature
#   or
#   @revert_education
#   or
#   @revert_war_story
#   or
#   @revert_finishing
#
#   # go to previous tab if not homeland
