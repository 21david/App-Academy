const ApiUtil = {
//     newGifAJAX: function() {
//       // always explicitly return because it makes debugging easier
//       // explicitly returning whatever is returned by the ajax method. (a promise)
//       return $.ajax({
//         method: 'GET',
//         url: 'https://api.giphy.com/v1/gifs/random?api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G&tag=banana',
//       });
//     },
//     saveGifAJAX: function(gifArg) { //expect gifArg to have keys of title and url
//       return $.ajax({
//         method: "POST",
//         url: "/gifs",
//         dataType: "JSON",
//         data: {
//           gif: gifArg
//         }
//       })
//     },
//     fetchSavedGifAJAX: function(titleArg) {
//       return $.ajax({
//         method: "GET",
//         url: `/gifs/${titleArg}`,
//         dataType: "JSON"
//       })
//     }
    follow: function(userId){
        return $.ajax({
                    method: "POST",
                    url: `/users/${userId}/follow`,
                    dataType : "JSON",
                    // data: {
                    //     follow: {
                    //         followee_id: this.user_id
                    //     },
                    //     followed: {"follower_Id"}
                    // }
        });
    }
   
};
  
  module.exports = ApiUtil;