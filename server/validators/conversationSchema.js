let Joi = require('@hapi/joi')

let conversationSchema = {
    store: Joi.object().keys({
        senderId: Joi.string().required().regex(/^[0-9a-fA-F]{24}$/),
        receiverId: Joi.string().required().regex(/^[0-9a-fA-F]{24}$/)
    })
}

module.exports = conversationSchema