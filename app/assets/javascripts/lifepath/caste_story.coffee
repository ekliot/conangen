sel_caste_story:
  name: ""

@select_caste_story = ( ele ) ->
  sel_caste_story.name = ele.getAttribute( "data-caste-story-name" )

# @confirm_caste_story = () ->
#   # fill form input with story name

# @revert_caste_story = () ->
#   # clear form input with story name
