import React from 'react';
import Board from './Board.jsx'

import * as Minesweeper from '../minesweeper.js';

class Game extends React.Component {
    constructor (props) {
        super(props)
        this.state = {board: new Minesweeper.Board(9, 11) }

        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
    }

    updateGame (tile, flagging) {
        if (flagging) {
            tile.toggleFlag();
        } else {
            tile.explore();
        }
        this.setState({ board: this.state.board })
    }

    restartGame () {
        this.setState({board: new Minesweeper.Board(9, 11)})
    }

    render () {
        let modal;
        if (this.state.board.lost() || this.state.board.won()) {
            let text = this.state.board.won() ? 'You Won!' : 'You Lost!';
            modal = 
                <div className="modal-screen">
                    <div className="modal-text">
                        <p>{text}</p>
                        <button onClick={this.restartGame}>Play Again</button>
                    </div>
                </div>
        }

        return (
            <div className="minesweeper">
                {modal}
                <h1>Minesweeper</h1>
                <p>Click to explore a tile.</p>
                <p>Alt + click to flag a tile.</p>
                <Board board={this.state.board} updateGame={this.updateGame } />
            </div>
           
            
        )
    }
}

export default Game;