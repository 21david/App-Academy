class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard();
  }

  setupBoard() {
    const ul = document.createElement('ul');
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let li = document.createElement('li')
        li.dataset.row = i
        li.dataset.column = j
        ul.appendChild(li);
      }
    }
    this.el.appendChild(ul);
  }
  
  bindEvents() {}

  handleClick(e) {

  }

  makeMove(square) {}

}

module.exports = View;
