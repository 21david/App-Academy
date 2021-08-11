/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/***/ ((module) => {

const ApiUtil = {
//     newGifAJAX: function() {
//       // always explicitly return because it makes debugging easier
//       // explicitly returning whatever is returned by the ajax method. (a promise)
//       return $.ajax({
//         method: 'GET',
//         url: 'https://api.giphy.com/v1/gifs/random?api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G&tag=banana',
//       });
//     },
//     saveGifAJAX: function(gifArg) { //expect gifArg to have keys of title and url
//       return $.ajax({
//         method: "POST",
//         url: "/gifs",
//         dataType: "JSON",
//         data: {
//           gif: gifArg
//         }
//       })
//     },
//     fetchSavedGifAJAX: function(titleArg) {
//       return $.ajax({
//         method: "GET",
//         url: `/gifs/${titleArg}`,
//         dataType: "JSON"
//       })
//     }
    follow: function(userId){
        return $.ajax({
                    method: "POST",
                    url: `/users/${userId}/follow`,
                    dataType : "JSON",
                    // data: {
                    //     follow: {
                    //         followee_id: this.user_id
                    //     },
                    //     followed: {"follower_Id"}
                    // }
        });
    }
   
};
  
  module.exports = ApiUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const ApiUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js")

function FollowToggle($el) { // $el is the button
    // this.userId = $el.find("data-user-id");
    // this.followState = $el.find("data-initial-follow-state");
    this.userId = $el.data('user-id');
    this.followState = $el.data('initial-follow-state');
    this.el = $el;
    this.el.innerText = this.render();
}

FollowToggle.prototype.render = function() {
    this.followState === 'followed' ? "Follow!" : "Unfollow!"
}

FollowToggle.prototype.handleClick = function(e) {
    e.preventDefault();
    if(this.render() === 'Unfollow!') {
       ApiUtil.follow(this.userId).then();
    } else {

    }
}

module.exports = FollowToggle;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

$(() => { 
    $('button.follow-toggle').each(function(index, btn) {
        new FollowToggle(btn);
    })
})

})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map