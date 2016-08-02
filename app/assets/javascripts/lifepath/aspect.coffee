$( window ).load ->
  @select_aspect( document.getElementById( "aspect#{idx}::1" ) ) for idx in [1,2]
#   rotate( ele ) for ele in document.getElementsByClassName( "vertical_th" )
#
# rotate = ( ele ) ->
#   h = ele.height
#   w = ele.width
#   ele.width   = h
#   ele.height  = w

aspect1 =
  name:   ""
  mand1:  ""
  mand2:  ""
  opt1:   ""
  opt2:   ""

aspect2 =
  name:   ""
  mand1:  ""
  mand2:  ""
  opt1:   ""
  opt2:   ""

@select_aspect = ( ele ) ->
  if ele.getAttribute( "data-tab" ).indexOf( "aspect1" ) != -1
    aspect1.name  = ele.getAttribute( "data-aspect-name" )
    aspect1.mand1 = ele.getAttribute( "data-mand1" )
    aspect1.mand2 = ele.getAttribute( "data-mand2" )
    aspect1.opt1  = ele.getAttribute( "data-opt1" )
    aspect1.opt2  = ele.getAttribute( "data-opt2" )

    document.getElementById( "aspect1_card_header" ).innerHTML  = aspect1.name
    document.getElementById( "aspect1_mand1" ).innerHTML = aspect1.mand1.toUpperCase()
    document.getElementById( "aspect1_mand2" ).innerHTML = aspect1.mand2.toUpperCase()
    document.getElementById( "aspect1_opt1" ).innerHTML  = aspect1.opt1.toUpperCase()
    document.getElementById( "aspect1_opt2" ).innerHTML  = aspect1.opt2.toUpperCase()
  else
    aspect2.name  = ele.getAttribute( "data-aspect-name" )
    aspect2.mand1 = ele.getAttribute( "data-mand1" )
    aspect2.mand2 = ele.getAttribute( "data-mand2" )
    aspect2.opt1  = ele.getAttribute( "data-opt1" )
    aspect2.opt2  = ele.getAttribute( "data-opt2" )

    document.getElementById( "aspect2_card_header" ).innerHTML = aspect2.name
    document.getElementById( "aspect2_mand1" ).innerHTML = aspect2.mand1.toUpperCase()
    document.getElementById( "aspect2_mand2" ).innerHTML = aspect2.mand2.toUpperCase()
    document.getElementById( "aspect2_opt1" ).innerHTML  = aspect2.opt1.toUpperCase()
    document.getElementById( "aspect2_opt2" ).innerHTML  = aspect2.opt2.toUpperCase()
