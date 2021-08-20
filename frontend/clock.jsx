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
        this.interval = setInterval(() => {
            this.tick();
        }, 1000);
    }

    //WARNING! To be deprecated in React v17. Use componentDidMount instead.
    componentWillMount() {
        // cancel tick
        clearInterval(this.interval);
    }

    render() {
        return(
            <div>
                <div>
                    <p>Time:</p>
                    <p>Date:</p>
                </div>
                <div>
                    <h1>{this.state.date.getHours()} {this.state.date.getMinutes()} {this.state.date.getSeconds()}</h1>
                    <p>{this.state.date.toDateString()}</p>
                </div>
            </div>
        )
    }
}

export default Clock;