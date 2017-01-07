$(document).on "turbolinks:load", ->
  return

  # @hl_seg           = document.getElementById( "create_hl" )
  # @aspect_seg       = document.getElementById( "create_aspect" )
  # @caste_section    = document.getElementById( "create_caste" )
  # @caste_story_seg  = document.getElementById( "caste_story_seg" )
  # @arch_seg         = document.getElementById( "create_arch" )
  # @nature_seg       = document.getElementById( "create_nature" )
  # @edu_seg          = document.getElementById( "create_edu" )
  # @warstory_seg     = document.getElementById( "create_warstory" )
  # @finish_seg       = document.getElementById( "create_finish" )

@update_char_title = ->
  # TODO
  # get the name

  # get the homeland
  sel_home  = $("#ChargenHomelandDropdown").dropdown( 'get value' )
  # sel_home is undefined if a selection hasn't been made
  homeland  = if sel_home then $("#ChargenHomelandDropdown").dropdown( 'get text', sel_home ) else ""

  # get the archetype
  sel_arch  = $("#ChargenArchetypeDropdown").dropdown( 'get value' )
  # sel_arch is undefined if a selection hasn't been made
  archetype = if sel_arch then $("#ChargenArchetypeDropdown").dropdown( 'get text', sel_arch ) else ""

  $.ajax
    url: "get_char_title"
    dataType: "json"
    data:
      name: ""
      archetype: archetype
      homeland: homeland
      html: true
    success: (data, status, jqXHR) ->
      $( "#CharTitle" ).html( "Hither came " + data.title + "..." )
      return
    error: () ->
      console.log "errr"
      return

  return

# lifepath => the name of the lifepath selection
# id => the id of the choice
@select_lifepath = ( lifepath, selection_id ) ->
  console.log( "LOAD CHOICE for #{lifepath}, id##{selection_id}" )
  # hit the server
  $.ajax
    url: "select_lifepath"
    dataType: "json"
    data:
      lifepath: lifepath
      selection_id: selection_id
    success: (data, status, jqXHR) ->
      # perhaps, to be fancy, augment the straight injection with a slide in animation?
      $.each data.divs, ( key, val ) ->
        $( "#Chargen#{lifepath}#{key}" ).html( val )

      # we need this check, or else the usual on-turbolinnks-load trigger is
      # negated when the new caste stories dropdown is rendered
      if lifepath == "Caste"
        $('#ChargenCasteStoryDropdown').dropdown( {
          onChange: ( caste_story_id, text, $object ) ->
            select_lifepath 'CasteStory', caste_story_id
            return
        } )

      return
    error: (jqXHR, status, error) ->
      # do a thing
      console.log "err"
      return

  return

# @attrs =
#   agility: 7
#   awareness: 7
#   brawn: 7
#   coordination: 7
#   intelligence: 7
#   personality: 7
#   willpower: 7
#
# @bonus =
#   agility: 0
#   awareness: 0
#   brawn: 0
#   coordination: 0
#   intelligence: 0
#   personality: 0
#   willpower: 0
#
# @total_attrs =
#   agility: 7
#   awareness: 7
#   brawn: 7
#   coordination: 7
#   intelligence: 7
#   personality: 7
#   willpower: 7
#
# @ancient_bloodline = false
#
# @sel_caste = ""
#
# @sel_caste_story = ""
#
# @sel_archetype =
#   name: ""
#   talent: ""
#   career_skill: ""
#   opt_skill1: ""
#   opt_skill2: ""
#
# @sel_nature =
#   name:   ""
#   talent: ""
#   opt_skill1: ""
#   opt_skill2: ""
#
# @sel_edu =
#   name:   ""
#   talent: ""
#   opt_skill1: ""
#   opt_skill2: ""
#
# @skill_tally =
#   acrobatics:
#     exp: 0
#     foc: 0
#   alchemy:
#     exp: 0
#     foc: 0
#   animal_handling:
#     exp: 0
#     foc: 0
#   athletics:
#     exp: 0
#     foc: 0
#   command:
#     exp: 0
#     foc: 0
#   counsel:
#     exp: 0
#     foc: 0
#   craft:
#     exp: 0
#     foc: 0
#   discipline:
#     exp: 0
#     foc: 0
#   healing:
#     exp: 0
#     foc: 0
#   insight:
#     exp: 0
#     foc: 0
#   linguistics:
#     exp: 0
#     foc: 0
#   lore:
#     exp: 0
#     foc: 0
#   melee:
#     exp: 0
#     foc: 0
#   observation:
#     exp: 0
#     foc: 0
#   parry:
#     exp: 0
#     foc: 0
#   persuade:
#     exp: 0
#     foc: 0
#   ranged:
#     exp: 0
#     foc: 0
#   resistance:
#     exp: 0
#     foc: 0
#   sailing:
#     exp: 0
#     foc: 0
#   siegecraft:
#     exp: 0
#     foc: 0
#   society:
#     exp: 0
#     foc: 0
#   sorcery:
#     exp: 0
#     foc: 0
#   stealth:
#     exp: 0
#     foc: 0
#   survival:
#     exp: 0
#     foc: 0
#   thievery:
#     exp: 0
#     foc: 0

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
