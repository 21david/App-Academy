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
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(event) {
        let flagging = event.altKey
        // debugger
        this.props.updateGame(this.props.tile, flagging)
    }

    render() {
        // debugger
        let variable;
        let klass;
        // debugger
        if(this.props.tile.explored ) {
            // debugger
            if(this.props.tile.adjacentBombCount() > 0) {
                variable = this.props.tile.adjacentBombCount();
            } else {
                variable = ' ';
            }
            klass = "explored";
        } else if (this.props.tile.flagged) {
            variable = "🚩";
            klass = "flagged";
        }  else {
            variable = ' '
            klass = "none";
        }

        if (this.props.tile.bombed && this.props.tile.explored) {
            variable = "💣";
            klass = "bombed";
        }


        return (
            <div onClick={this.handleClick} className={`tile ${klass}`} >{variable}</div>
        )
    }
}

export default Tile;