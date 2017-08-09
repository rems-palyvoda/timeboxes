import './styles/projects'
import './create.coffee'
import './edit.coffee'
import './destroy.coffee'

$(document).on('turbolinks:load', function(){
  $('.show-project-button .fa-window-minimize').hide();
});
