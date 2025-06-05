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
            <div class="outer">
                <h1>Clock</h1>
                <div class="inner">
                    <div>
                        <p>Time:</p>
                        <p>Date:</p>
                    </div>
                    <div>
                        <p>{this.state.date.getHours()} {this.state.date.getMinutes()} {this.state.date.getSeconds()}</p>
                        <p>{this.state.date.toDateString()}</p>
                    </div>
                </div>
            </div>
        )
    }
}

export default Clock;