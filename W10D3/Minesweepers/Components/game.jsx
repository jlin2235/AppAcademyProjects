import React from 'react';
// import { Tile, Board as Minesweeper} from '../minesweeper.js';
import * as Minesweeper from '../minesweeper.js';
import Board from './board';

class Game extends React.Component{
    constructor(props){
        super();

        this.state = {
            board: new Minesweeper.Board(10,10)
        }

        this.updateGame = this.updateGame.bind(this)
    }

    updateGame() {

    }

    render() {

        return (
            <Board updateGame={this.updateGame} boardState={this.state.board}/>
            // <Board boardState = {this.state.board.grid}/>
            // <Board />

        )
    }



};

export default Game; //remove if not needed