$(document).on "turbolinks:load", ->
  $('#ChargenCasteStoryDropdown').dropdown( {
    onChange: ( caste_story_id, text, $object ) ->
      select_lifepath 'CasteStory', caste_story_id
      return
  } )

  return

# # $( window ).load ->
# #   @select_caste_story( document.getElementById( "castestory::1::1" ) )
#
# @select_caste_story = ( ele ) ->
#   sel_caste_story = ele.getAttribute( "data-caste-story-name" )
#   console.log "CASTE story #{sel_caste_story} selected"
#
# # @confirm_caste_story = () ->
# #   # fill form input with story name
#
# # @revert_caste_story = () ->
# #   # clear form input with story name
