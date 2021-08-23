import React from 'react';

import * as Minesweeper from '../minesweeper.js';

class Tile extends React.Component {
    constructor (props) {
        super(props);
        // this.state = { revealed: false, bombed: false, flagged: false };
        // this.currentState = 'n';
        // this.flagged = false;
        // this.flagged = false;
        // this.flagged = false;
        // this.array = [false, false, false];
    }

    render() {
        return (
            {
                debugger
                // if(this.props.tile.explored && this.adjacentBombCount() > 1) {
                //     return this.adjacentBombCount();
                // }
            }
            'T'
        )
    }
}

export default Tile;