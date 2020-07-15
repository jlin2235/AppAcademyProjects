import React from 'react';
import * as Minesweeper from '../minesweeper.js'

class Game extends React.Component{
    constructor(props){
        super(props);

        this.state = {
            board: new Minesweeper.Board
        }

        this.updateGame = this.updateGame.bind(this)
    }

    updateGame() {

    }

    render() {

        return (
            <Board  updateGame = {this.updateGame} boardState = {this.state.board} />
        )
    }



}

export default Game; //remove if not needed