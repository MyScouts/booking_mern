let router = require('express-promise-router')()
let friendController = require('../controllers/friend')
let passport = require('passport')
const { validatiorParams, baseSchema, validatorBody } = require('../validators')
const friendSchema = require('../validators/friendSchema')

router.route('/:userId')
    .post(passport.authenticate('jwt', { session: false }), validatorBody(friendSchema.store), friendController.addFriend)


module.exports = router