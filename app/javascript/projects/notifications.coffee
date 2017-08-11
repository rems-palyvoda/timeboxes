export notifications = () ->

  $('.close').on 'click', (e) ->
    e.preventDefault()
    $('.alert').hide()
