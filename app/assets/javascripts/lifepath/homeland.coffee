$(document).on "turbolinks:load", ->
  $('#ChargenHomelandDropdown').dropdown( {
    onChange: ( homeland_id, text, $object ) ->
      select_lifepath 'Homeland', homeland_id
      update_char_title()
      return
  } )

  return
