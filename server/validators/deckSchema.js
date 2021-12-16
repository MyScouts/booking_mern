let Joi = require('@hapi/joi')

let deckSchemas = {
    store: Joi.object().keys({
        name: Joi.string().min(3).required(),
        description: Joi.string().min(3).required()
    })

}
module.exports = deckSchemas