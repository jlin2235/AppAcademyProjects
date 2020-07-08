class View { //ES6
  constructor(game, $el) {
    this.game = game; 
    this.$el = $el; 
    this.setupBoard(); 
    this.bindEvents(); 
    this.makeMove($square)
  }
  bindEvents() { // making a click IS the bindEvent (3)
    this.$el.on('click', event => {
      const $square = $(el.target); // THIS ansers (1)
      this.makeMove($square); // invoking the helper function makeMove (4)
    }); 
  }
  makeMove($square) { //$square <-- where does come from??? (1) MAIN QUESTION 
                            // L> define this var somewhere (2)

  }

  setupBoard() {
      let $ul = $("<ul>")
      for(let row = 0; row<3; row++){
        for (let col = 0; col < 3; col++){
          let $li = $("<li>"); // rep our cell in 3 X 3 
          $li.data("pos",[row,col]); //@ the cell give a val = data 
          $ul.append($li);
        }
      }
    this.$el.append($ul);
  }
}


module.exports = View;

//https://api.jquery.com/data/
// $( "body" ).data( "foo", 52 ); ~ $body.data('key', value)
// { 'key' => value }
// [[0,0], [1,1], [2,2]] 
// $('ul').append($newLi);