import React from 'react';
import ReactDOM from 'react-dom';

import App from './app'

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(<App />, root); //<App> becomes child of root

    // ReactDOM.render(<Root />,getElementById("main"));
});
// console.log("anywhere");

//widget (entry point) webpack => widget
//app (clock,weather)
//clock
//weather
