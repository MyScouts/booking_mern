let mongoose = require("mongoose")

let conversationSchema = new mongoose.Schema({
    members: {
        type: Array,
    },
},
    { timestamps: true }
);

let ConversationModel = mongoose.model('conversation', conversationSchema)
module.exports = ConversationModel