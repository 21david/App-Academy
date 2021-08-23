import React from 'react';
import Board from './Board.jsx'

class Game extends React.Component {
    constructor (props) {
        super(props)
        this.state = {board: new Board() }

        this.updateGame = this.updateGame.bind(this)
    }

    updateGame () {

    }

    render () {
        return (
            <Board board={this.state.board} update={this.updateGame } />
            // <div>hello</div>
        )
    }
}

export default Game;