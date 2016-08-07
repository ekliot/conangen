sel_caste =
  name: ""

@select_caste = ( ele ) ->
  sel_caste.name  = ele.getAttribute( "data-caste-name" )
  sel_caste_story.name = ""

# @confirm_caste = () ->
#   # fill form input with caste name

# @revert_caste = () ->
#   # clear form input for caste name
