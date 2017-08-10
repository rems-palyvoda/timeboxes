export editProject = () ->
  $('.fa-pencil').on 'click', ->
    $(this).parentsUntil('.project-item').find('.project-title').toggle()

  $('.project-title input[type="submit"]').on 'click', (e) ->
    e.preventDefault()
    projectId = $(this).closest('.project-item').data('project-id')
    title = $(this).prev()
    $.ajax
      url: '/projects/' + projectId
      type: 'put'
      dataType: 'json'
      data: {
        project: {title: title.val()}
      }
      success: (data) ->
        title.closest('.project-item').find('.project-title:first-child').text(data.title)
        title.closest('.project-item').find('.project-title').toggle()
        title.val('')
      error: (err) ->
        console.log(err)

