import React from 'react';

class Clock extends React.Component {
    constructor() {
        super();
        this.state = {
            date: new Date()
        };
    }

    tick() {
        this.setState({
            date: new Date()
        });
    }

    componentDidMount() {
        //tick
    }

    //WARNING! To be deprecated in React v17. Use componentDidMount instead.
    componentWillMount() {
        cancel tick
    }

    render() {
        return(
            <h1>Clock</h1>
        )
    }
}

export default Clock;