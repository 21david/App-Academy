import React from 'react';
import Tile from './Tile.jsx'

import * as Minesweeper from '../minesweeper.js';


class Board extends React.Component {
    constructor (props) {
        super(props);
    }

    render () {
        return (
            <div>
                {this.props.board.grid.map((row, index)=> {
                    // debugger
                    return <div className = "row" key={`${index} + ${row}`}>{row.map((tile, tileIndex) => {
                        return <Tile key={`${tileIndex} + ${tile}`} tile={tile}  updateGame={this.props.updateGame}/>
                    })}</div>
                })}
            </div>
        )
    }
}

export default Board;