let mongoose = require('mongoose')

let friendSchema = new mongoose.Schema({
    userId: {
        type: String,
        required: true,
        unique: true,
    },
    myFriend: {
        type: Array
    }
})

let FriendModel = mongoose.model('friends', friendSchema)
module.exports = FriendModel