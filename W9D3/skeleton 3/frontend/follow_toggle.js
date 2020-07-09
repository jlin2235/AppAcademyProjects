const APIUtil = require("./api_util.js");


class FollowToggle{
    
    constructor ($el){
        this.userId = $el.attr('data-user-id');
        this.followState = $el.attr('data-initial-follow-state');
        this.$el = $el;

        this.render();
    }


    render() {
        if (this.followState === "unfollowed") {
            this.$el.html("Follow!");
        } 
        else if (this.followState === "followed") {
            this.$el.html("Unfollow!");
        }
    }

    handleClick() {
        e.preventDefault();
        if (this.followState === "unfollowed") {
            // return $.ajax({
            //     method: 'POST',
            //     url: '/users/:id/follow'
            // });
            this.$el.prop('disabled', true);
            APIUtil.unfollowUser(this.userId);
            this.followState = "following";
            this.render();
        }

        else if (this.followState === "followed") {
            this.$el.prop('disabled', true);
            // return $.ajax({
            //     method: 'DELETE',
            //     url: '/users/:id/follow'
            // });
            APIUtil.followUser(this.userId);
            this.followState = "unfollowing";
            this.render();

        }

        this.$el.prop('disabled', false);
    // Hint: You probably want to set the dataType option for $.ajax. 
    // This way you can have jQuery automatically parse the response as JSON. 
    // Read the documentation here
    }
}


module.exports = FollowToggle;
