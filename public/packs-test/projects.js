/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs-test/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */,
/* 1 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0_projects__ = __webpack_require__(2);


/***/ }),
/* 2 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__styles_projects__ = __webpack_require__(3);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__styles_projects___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_0__styles_projects__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__create_coffee__ = __webpack_require__(4);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__create_coffee___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_1__create_coffee__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__edit_coffee__ = __webpack_require__(5);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__edit_coffee___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_2__edit_coffee__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__destroy_coffee__ = __webpack_require__(6);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__destroy_coffee___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_3__destroy_coffee__);





$(document).on('turbolinks:load', function () {
  $('.show-project-button .fa-window-minimize').hide();
});

/***/ }),
/* 3 */
/***/ (function(module, exports) {

// removed by extract-text-webpack-plugin

/***/ }),
/* 4 */
/***/ (function(module, exports) {

$(document).on("turbolinks:load", function() {
  return $("#new-project-form").on("submit", function(e) {
    var title;
    e.preventDefault();
    title = $("#new-project-form input[type='text']").val();
    return $.ajax({
      url: '/projects',
      type: 'post',
      dataType: 'script',
      data: {
        project: {
          title: title
        }
      }
    });
  });
});


/***/ }),
/* 5 */
/***/ (function(module, exports) {

$(document).on("turbolinks:load", function() {
  $('.fa-pencil').on('click', function() {
    return $(this).parentsUntil('.project-item').find('.project-title').toggle();
  });
  return $('.project-title input[type="submit"]').on('click', function(e) {
    var projectId, title;
    e.preventDefault();
    projectId = $(this).closest('.project-item').data('project-id');
    title = $(this).prev();
    return $.ajax({
      url: '/projects/' + projectId,
      type: 'put',
      dataType: 'json',
      data: {
        project: {
          title: title.val()
        }
      },
      success: function(data) {
        title.closest('.project-item').find('.project-title:first-child').text(data.title);
        title.closest('.project-item').find('.project-title').toggle();
        return title.val('');
      },
      error: function(err) {
        return console.log(err);
      }
    });
  });
});


/***/ }),
/* 6 */
/***/ (function(module, exports) {

$(document).on("turbolinks:load", function() {
  return $('.fa-trash').on('click', function(e) {
    var projectId;
    e.preventDefault();
    projectId = $(this).closest('.project-item').data('project-id');
    return $.ajax({
      url: '/projects/' + projectId,
      type: 'delete',
      dataType: 'json',
      success: function(data) {
        return $('.project-item[data-project-id=' + projectId + ']').remove();
      },
      error: function(err) {
        return console.log(err);
      }
    });
  });
});


/***/ })
/******/ ]);