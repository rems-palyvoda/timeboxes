import './styles/projects'
import './create.coffee'
import {editProject} from './edit.coffee'
import {destroyProject} from './destroy.coffee'

$(document).on('turbolinks:load', function(){
  $('.show-project-button .fa-window-minimize').hide();
  destroyProject();
  editProject();
});

$(document).on('ajax:success', function(){
  $('.show-project-button .fa-window-minimize').hide();
  destroyProject();
  editProject();
});
