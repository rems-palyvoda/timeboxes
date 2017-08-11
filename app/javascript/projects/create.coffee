export createProject = () ->
  $(".new-project-button").on "click", (e) ->
    e.preventDefault()
    title = $(".new-project-form input[type='text']").val()
    $.ajax
      url: '/projects'
      type: 'post'
      dataType: 'script'
      data: {
        project: {title: title}
      }

