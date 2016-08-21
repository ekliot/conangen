# ========================
# find out a way to replace `document` with
# @hl_seg           = document.getElementById( "create_hl" )
# ========================

# make the only green card the one just selected
@toggle_green = ( ele, hl_name ) ->
  cards = document.getElementsByClassName( "hl_card" )

  for card in cards
    card.className = card.className.replace " green", ""

  ele.className += " green"

@select_homeland = ( ele ) ->
  hl_name = ele.getAttribute( "data-hl-name" )

  toggle_green( ele, hl_name )

  lang_id  = "hl_card_lang_".concat hl_name
  lang_ele = document.getElementById( lang_id )
  lang_tag = lang_ele.tagName.toLowerCase()

  if lang_tag == "div"
    hl_lang = lang_ele.getAttribute( "data-hl-lang" )
  else
    hl_lang = lang_ele.options[lang_ele.selectedIndex].value

  @sel_homeland.name      = hl_name
  @sel_homeland.talent    = ele.getAttribute( "data-hl-talent" )
  @sel_homeland.language  = hl_lang

  console.log "HOMELAND #{@sel_homeland.name} selected with language #{@sel_homeland.language} and talent #{@sel_homeland.talent}"

# @confirm_homeland = () ->
#   # fill in chosen homeland name
#   # fill in chosen homeland lang

# @revert_homeland = () ->
#   # clear chosen homeland name
#   # clear chosen homeland lang
