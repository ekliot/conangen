# ========================
# find out a way to replace `document` with
# @hl_seg           = document.getElementById( "create_hl" )
# ========================

@sel_homeland =
  name: ""
  talent: ""
  language: ""

@toggle_green = ( hl_name ) ->
  cards = document.getElementsByClassName( "hl_card" )

  for card in cards
    if card.className.indexOf( "green" ) != -1 then card.className = "ui card hl_card"

  ele = document.getElementById( "hl_card_" + hl_name )
  ele.className += " green"

@select_homeland = ( ele ) ->
  hl_name = ele.getAttribute( "data-hl-name" )

  toggle_green( hl_name )

  lang_id  = "hl_card_lang_".concat hl_name
  lang_ele = document.getElementById( lang_id ) # $( lang_id ) doesn't work here for some reason
  lang_tag = lang_ele.tagName.toLowerCase()

  if lang_tag == "div" then hl_lang = lang_ele.getAttribute( "data-hl-lang" ) else hl_lang = lang_ele.options[lang_ele.selectedIndex].value

  selected_homeland.name      = hl_name
  selected_homeland.talent    = ele.getAttribute( "data-hl-talent" )
  selected_homeland.language  = hl_lang

# @confirm_homeland = () ->
#   # fill in chosen homeland name
#   # fill in chosen homeland lang

# @revert_homeland = () ->
#   # clear chosen homeland name
#   # clear chosen homeland lang
