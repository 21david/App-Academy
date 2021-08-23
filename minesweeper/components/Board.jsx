import React from 'react';

class Board extends React.Component {
    constructor (props) {
        super(props);
        this.grid = [];
        
        for(let i = 0; i < 9; i++) {
            let arr = [];
            arr[8] = undefined;
            this.grid.push(arr);
        }
    }

    render () {
        return (
            <div>
                {this.props.board.grid.map((row, index)=> {
                    return <div key={`${index} + ${row}`}>{row.map((tile, tileIndex) => {
                        return <Tile key={`${tileIndex} + ${tile}`} tile={tile}  update={this.props.update}/>
                    })}</div>
                })}
            </div>
        )
    }
}

export default Board;