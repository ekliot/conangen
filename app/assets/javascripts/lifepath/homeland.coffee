# ========================
# find out a way to replace `document` with
# @hl_seg           = document.getElementById( "create_hl" )
# ========================

# ========================
# objects don't work with firefox,
# INVESTIGATE how to get around it
# ========================

# @selected_homeland =
#   name: ""
#   talent: ""
#   language: ""

@sel_hl_name = ""
@sel_hl_tal  = ""
@sel_hl_lang = ""

@toggle_green = ( hl_name ) ->
  cards = document.getElementsByClassName( "hl_card" )

  for card in cards
    if card.className.indexOf( "green" ) != -1 then card.className = "ui card hl_card"

  ele = document.getElementById( "hl_card_" + hl_name )
  ele.className += " green"

@select_homeland = ( hl_name, hl_tal ) ->
  toggle_green( hl_name )

  lang_id  = "hl_card_lang_".concat hl_name
  lang_ele = document.getElementById( lang_id ) # $( lang_id ) doesn't work here for some reason
  lang_tag = lang_ele.tagName.toLowerCase()

  if lang_tag == "div" then hl_lang = lang_ele.getAttribute( "data-hl-lang" ) else hl_lang = lang_ele.options[lang_ele.selectedIndex].value

  # @selected_homeland.name = hl_name
  # @selected_homeland.talent = hl_tal
  # @selected_homeland.language = hl_lang

  @sel_hl_name = hl_name
  @sel_hl_tal  = hl_tal
  @sel_hl_lang = hl_lang

  console.log( "Selected " + @sel_hl_name + " (" + @sel_hl_tal + ", " + @sel_hl_lang + ")" )
