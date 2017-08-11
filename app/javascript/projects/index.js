import './styles/projects'
import {editProject} from './edit.coffee'
import {destroyProject} from './destroy.coffee'
import {createProject} from './create.coffee'
import {notifications} from './notifications.coffee'

$(document).on('turbolinks:load ajax:success', function(){
  $('.show-project-button .fa-window-minimize').hide();
  destroyProject();
  createProject();
  editProject();
  notifications();
});
