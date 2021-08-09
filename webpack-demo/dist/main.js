/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\n// const Game = require('./game');\n\nconst COLOR = \"red\";\nconst RADIUS = 10;\n\nfunction Asteroid(obj) {\n    // super(obj)\n    this.pos = obj.pos;\n    this.radius = RADIUS;\n    this.color = COLOR;\n    this.vel = Util.randomVec(5);\n}\n// Asteroid.inherits(Util);\nUtil.inherits(Asteroid, MovingObject);\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack://webpack-demo/./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\n// const canvas = document.getElementById(\"game-canvas\");\nconst DIM_X = 500;\nconst DIM_Y = 500;\n\nconst NUM_ASTEROIDS = 10; \nconst asteroids = [];\n\nfunction Game() {\n\n}\n\nGame.prototype.addAsteroids = function(){\n    for(let i = 0; i < NUM_ASTEROIDS; i++){\n        const obj = new MovingObject({pos: this.randomPosition(), vel: [10, 10], radius: 1, color: \"red\" }); \n        const ast = new Asteroid(obj);\n        asteroids.push(ast);\n        // debugger\n        // ast.draw(); \n    }\n};\n\nGame.prototype.randomPosition = function(){\n\n    const x = Math.random() * DIM_X;\n    const y = Math.random() * DIM_Y;\n\n    return [x, y];\n};\n\nGame.prototype.draw = function(ctx){\n    var c = document.getElementById(\"game-canvas\");\n    var ctx = c.getContext(\"2d\");\n    ctx.clearRect(0, 0, DIM_X, DIM_Y); \n    asteroids.forEach(ele => ele.draw());\n}\n\nGame.prototype.moveObjects = function(){\n    asteroids.forEach(ele => ele.move());\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack://webpack-demo/./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"Webpack is working!\");\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nwindow.MovingObject = MovingObject;\n\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nwindow.Util = Util;\n\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nwindow.Asteroid = Asteroid;\n\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nwindow.Game = Game;\n\nwindow.addEventListener('DOMContentLoad', () => {\n    const canv = document.getElementById(\"game-canvas\")\n    canv.width = 500\n    canv.height = 500\n    const ctx = canv.getContext(\"2d\");\n    const mo = new MovingObject({\n        pos: [200, 200],\n        vel: [1000, 1000],\n        radius: 5,\n        color: \"#00FF00\"\n    });\n    mo.draw();\n\n\n});\n\n\n//# sourceURL=webpack://webpack-demo/./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(obj){\n    this.pos = obj[\"pos\"];\n    this.vel = obj[\"vel\"];\n    this.radius = obj[\"radius\"];\n    this.color = obj[\"color\"];\n};\n\nmodule.exports = MovingObject;\n\nMovingObject.prototype.draw = function(ctx){\n    var c = document.getElementById(\"game-canvas\");\n    var ctx = c.getContext(\"2d\");\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], 50, 0, 2 * Math.PI, true);\n    ctx.fillStyle = \"green\"; \n    ctx.fill();\n    ctx.stroke();\n}\n\nMovingObject.prototype.move = function(){\n    // console.log(\"In MOVE\");\n    const newPos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];\n    this.pos = newPos; \n}\n\n//# sourceURL=webpack://webpack-demo/./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        \n        function Surrogate() { }\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n        \n    },\n\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack://webpack-demo/./src/util.js?");

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
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;