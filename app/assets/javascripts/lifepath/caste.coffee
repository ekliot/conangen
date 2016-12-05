# $( window ).load ->
#   @select_caste( document.getElementById( "caste::1" ) )

@select_caste = ( ele ) ->
  sel_caste  = ele.getAttribute( "data-caste-name" )
  console.log "CASTE #{sel_caste} selected"
  caste_id = ele.getAttribute( "data-caste-id" )
  first_story = document.getElementById( "castestory::#{caste_id}::1" )
  console.log "castestory::#{caste_id}::1"
  console.log first_story
  @select_caste_story( document.getElementById( "castestory::#{caste_id}::1" ) )

# @confirm_caste = () ->
#   # fill form input with caste name

# @revert_caste = () ->
#   # clear form input for caste name
