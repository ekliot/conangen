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

@accordion_idxs =
  Homeland: 0
  Aspect: 1
  Caste: 2
  Archetype: 3
  Nature: 4
  Education: 5
  WarStory: 6

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

@next_create_tab = ( lifepath ) ->
  confirm_button = $("#Chargen#{lifepath}Confirm")
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
