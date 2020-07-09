const APIUtil = {
    unfollowUser: id => {
        return $.ajax({
            method: 'POST',
            url: `/users/${id}/follow`
        });
    },

    followUser: id => {
        return $.ajax({
            method: 'DELETE',
            url: `/users/${id}/follow`
        });
    }
};

module.exports = APIUtil;