export destroyProject = () ->
  $('.fa-trash').on 'click', (e) ->
    e.preventDefault()
    projectId = $(this).closest('.project-item').data('project-id')
    $.ajax
      url: '/projects/'+projectId
      type: 'delete'
      dataType: 'json'
      success: (data) ->
        $('.project-item[data-project-id='+projectId+']').remove()
        $('.alert').show()
        $('.alert div').show().text('Project deleted')
      error: (err) ->
        console.log err

