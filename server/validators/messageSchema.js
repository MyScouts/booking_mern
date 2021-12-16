let Joi = require('@hapi/joi')

let messageSchemas = {
    store: Joi.object().keys({
        conversationId: Joi.string().required().regex(/^[0-9a-fA-F]{24}$/),
        sender: Joi.string().required().regex(/^[0-9a-fA-F]{24}$/),
        text: Joi.string().required().max(255)
    })
}

module.exports = messageSchemas