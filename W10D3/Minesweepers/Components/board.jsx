import React from 'react';
// import { Tile, Board as Minesweeper } from '../minesweeper.js';
import * as Minesweeper from '../minesweeper.js';
import Game from './game';
import Tile from './tile';

class Board extends React.Component{
    constructor(props) {
        super(props)
    }


    render() {
         const mineGrid = this.props.boardState.grid.map ((row, index1) => {
            //  return <p key={index1}>{row}</p>
                    return <div key={index1}></div>
                    row.map ((tile, index2) => {
                        // const newTile = new Minesweeper.Tile({tile}, this.props.updateGame())
                        // // <p>{tile}</p>
                        // return <div key={index2}>{newTile}</div>
                        return <p>X</p>
                    })
                })
        
        return (

            <div>{mineGrid}</div>

        )


    }
}

export default Board;