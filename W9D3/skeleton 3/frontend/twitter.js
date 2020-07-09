const FollowToggle = require("./follow_toggle");

$(function () {
    $("button.follow-toggle").each(function(index, ele) {
        return new FollowToggle($(ele)); 
    });
}
);



// $( "li" ).each(function( index, ele ) {
//   console.log( index + ": " + $( ele ).text() );
// });