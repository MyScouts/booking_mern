let express = require('express')
// let router = express.Router()
let router = require('express-promise-router')()
let userController = require('../controllers/user')
let { validatiorParams, validatorQuery, baseSchema, validatorBody } = require('../validators')
let deckSchemas = require('../validators/deckSchema')
// validator
// 
router.route('')
    .get(userController.getUser)
    .post(userController.storeUser)
    .put(userController.replaceUser)
    .patch(userController.updateUser)

router.route("/decks")
    .get(validatorQuery(baseSchema.idSchema, 'userID'), userController.getUserDecks)
    .post(validatorQuery(baseSchema.idSchema, 'userID'), validatorBody(deckSchemas.store), userController.newUserDeck)

router.get('/users', userController.getUsers)


module.exports = router