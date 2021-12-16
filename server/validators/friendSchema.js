let Joi = require('@hapi/joi')

let friendSchema = {
    store: Joi.object().keys({
        friendId: Joi.string().required().regex(/^[0-9a-fA-F]{24}$/),
    })
}

module.exports = friendSchema