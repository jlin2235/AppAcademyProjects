import React from 'react';

class Clock extends React.Component {
    constructor (props) {
        super(props);
        this.state = {date: new Date ()};

        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({date: new Date()});
    }
    componentDidMount() {
        // this.intervalId = setInterval(function() {this.tick}, 1000);
        this.intervalId = setInterval(this.tick, 1000)
        //interval's id???
    }
    componentWillUnmount() {
        clearInterval(this.intervalId);
    }

    render () {
        let hours = this.state.date.getHours();
        let minutes = this.state.date.getMinutes();
        let seconds = this.state.date.getSeconds();

        return (
            <div className="clock-outer-div">
                <h1 className="clock-title">Clock</h1> 
                <div className="clock-div">
                    <p className="first-p"> 
                        <span>Time:</span> 
                        <span>{hours}:{minutes}:{seconds}</span>
                    </p>
                        
                    <p className="second-p"> 
                        <span>Date:</span>
                        <span>{this.state.date.toDateString()}</span>
                    </p>
                </div> 
            </div>//need to add toDateString()
        )
    }
}

export default Clock;