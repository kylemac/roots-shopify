$ ->
  $("html").removeClass "no-js"
  
  # Placeholder JS 
  #==========================
  $("[placeholder]").each ->
    if $(this).val() is ""
      hint = $(this).attr("placeholder")
      $(this).val(hint).addClass "hint"

  $("[placeholder]").focus(->
    $(this).val("").removeClass "hint"  if $(this).val() is $(this).attr("placeholder")
  ).blur ->
    $(this).val($(this).attr("placeholder")).addClass "hint"  if $(this).val() is ""

  
  # Form validation JS 
  #==========================
  $("input.error, textarea.error").focus ->
    $(this).removeClass "error"

  $("form :submit").click ->
    $(this).parents("form").find("input.hint, textarea.hint").each ->
      $(this).val("").removeClass "hint"

    true

