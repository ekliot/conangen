$(document).on "turbolinks:load", ->
  $('#ChargenHomelandDropdown').dropdown( {
    onChange: ( homeland_id, text, $object ) ->
      select_lifepath 'homeland', homeland_id
      return
  } )

  return
