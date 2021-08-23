import React from 'react';

class Board extends React.Component {
    constructor (props) {
        super(props);
        
    }

    render () {
        return (
            <div>
                {this.props.board.map((row, index)=> {
                    return <div key={`${index} + ${row}`}>{row.map((tile, tileIndex) => {
                        return <Tile key={`${tileIndex} + ${tile}`} tile={tile}  update={this.props.update}/>
                    })}</div>
                })}
            </div>
        )
    }
}

export default Board;