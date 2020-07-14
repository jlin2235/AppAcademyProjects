import React from 'react';
import Clock from './frontend/clock'
import Tabs from './frontend/tabs'

const App = (props) => {
    const array = [
        {title: "one", content: "I am the first"},
        {title: "two", content: "Second pane here"},
        {title: "three", content: "Third pane here"}
    ]

    return (
        <div>
            <Clock />
            <Tabs array={array}/>
        </div>
        //line 15 is a prop that we are passing to the tabs component
    )
};

export default App;