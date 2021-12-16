let router = require('express-promise-router')()
let messageController = require('../controllers/message')
const { validatorBody, validatiorParams, baseSchema } = require('../validators')
const messageSchemas = require('../validators/messageSchema')

router.route('')
    .post(validatorBody(messageSchemas.store), messageController.newMessage)
    
router.route('/:conversationId')
    .get(validatiorParams(baseSchema.idSchema, 'conversationId'), messageController.getMessageByConversation)
module.exports = router