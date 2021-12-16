let ConversationModel = require('../models/Conversation')


let newConversation = async (req, res, next) => {
    let { senderId, receiverId } = req.value.body
    let newConversation = new ConversationModel({ members: [senderId, receiverId] })
    await newConversation.save()

    res.status(200).json(newConversation)
}

let conversationByMe = async (req, res, next) => {
    let userId = req.value.params
    let conversations = await ConversationModel.find({
        members: {
            $in: [userId]
        }
    })

    res.status(200).json(conversations)
}


module.exports = {
    newConversation,
    conversationByMe
}