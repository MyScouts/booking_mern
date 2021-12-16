let mongoose = require('mongoose')

let penddingFriendSchema = new mongoose.Schema({
    userId: {
        type: String,
        required: true,
        unique: true,
    },
    peddingFriend: {
        type: Array
    }
})

let PenddingFriendModel = mongoose.model('pedding_friends', penddingFriendSchema)
module.exports = PenddingFriendModel