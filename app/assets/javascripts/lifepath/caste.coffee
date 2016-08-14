$( window ).load ->
  @select_caste( document.getElementById( "caste::1" ) )

sel_caste = ""

@select_caste = ( ele ) ->
  sel_caste  = ele.getAttribute( "data-caste-name" )
  sel_caste_story = ""
  console.log "caste #{sel_caste} selected"

# @confirm_caste = () ->
#   # fill form input with caste name

# @revert_caste = () ->
#   # clear form input for caste name
