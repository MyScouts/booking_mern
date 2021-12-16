let router = require('express-promise-router')()
let ConversationModel = require('../models/Conversation')
let conversationController = require('../controllers/conversation')
const { validatorBody, validatiorParams, baseSchema } = require('../validators')
const conversationSchema = require('../validators/conversationSchema')
// 


router.route('').post(validatorBody(conversationSchema.store), conversationController.newConversation)
router.route('/:userId').get(validatiorParams(baseSchema.idSchema, 'userId'), conversationController.conversationByMe)

module.exports = router