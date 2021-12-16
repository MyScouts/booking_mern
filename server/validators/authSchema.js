let Joi = require('@hapi/joi')

// conhtent
let authSchemas = {
    signUp: Joi.object().keys({
        firstName: Joi.string().min(2).required(),
        lastName: Joi.string().min(2).required(),
        userName: Joi.string().min(2).required().regex(/^\S*$/),
        email: Joi.string().min(8).required(),
        password: Joi.string().min(8).required(),
        phoneNumber: Joi.string().min(10).max(10).regex(/[{0,1}[0-9]{9}]*$/)
    }),

    signIn: Joi.object().keys({
        userName: Joi.string().min(2).regex(/^\S*$/),
        email: Joi.string().min(8).required(),
        phoneNumber: Joi.string().min(10).max(10).regex(/[{0,1}[0-9]{9}]*$/),
        password: Joi.string().min(8).required(),
    }),

    changePassword: Joi.object().keys({
        password: Joi.string().min(8).required(),
    }),

}

module.exports = authSchemas