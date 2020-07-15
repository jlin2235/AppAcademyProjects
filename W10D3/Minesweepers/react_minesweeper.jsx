import React from 'react';
import ReactDOM from 'react-dom';
import Game from './Components/game';
import Tile from './Components/tile';

document.addEventListener("DOMContentLoaded", () => {
    const main = document.getElementById("main");
    // const Root = <div></div>

    ReactDOM.render(<Game />, main);
});