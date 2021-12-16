let MessageModel = require('../models/Message')

let newMessage = async (req, res, next) => {
    let { conversationId, sender, text } = req.value.body
    let newMessage = new MessageModel({ conversationId, sender, text })

    await newMessage.save()
    res.status(200).json(newMessage)
}

let getMessageByConversation = async (req, res, next) => {
    let conversationId = req.value.params

    let messages = await MessageModel.find({ conversationId })
    res.status(200).json({messages})
}
module.exports = {
    newMessage,
    getMessageByConversation
}