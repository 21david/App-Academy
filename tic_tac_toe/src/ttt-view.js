class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard();
    this.bindEvents();
  }

  setupBoard() {
    const ul = document.createElement('ul');
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let li = document.createElement('li')
        li.dataset.row = i;
        li.dataset.column = j;
        ul.appendChild(li);
      }
    }
    this.el.appendChild(ul);
  }
  
  bindEvents() {
    this.el.addEventListener('click', this.handleClick.bind(this));
  }

  handleClick(e) {
    if (e.target.tagName === "LI") {
      this.makeMove(e.target);
    }
  }

  makeMove(square) {
    square.innerText = this.game.currentPlayer;
    square.classList.toggle(this.game.currentPlayer)
    let row = square.dataset.row;
    let column = square.dataset.column;
    let pos = [parseInt(row), parseInt(column)];
    this.game.playMove(pos);
  }

}

module.exports = View;
