let express = require('express')
let router = express.Router()
let passport = require('passport')
const authController = require('../controllers/auth')
let passportConfig = require('../middlewares/passport')
const { validatorBody } = require('../validators')
const authSchemas = require('../validators/authSchema')
// Import

// Social Routers
router.route('/google').post(passport.authenticate('google-plus-token', { session: false }), authController.authGoogle)
// 
router.route('/signin').post(validatorBody(authSchemas.signIn), authController.signIn)
router.route('/signup').post(validatorBody(authSchemas.signUp), authController.signUp)
router.route('/serect').get(passport.authenticate('jwt', { session: false }), authController.serect)
router.route('/change-password').post(validatorBody(authSchemas.changePassword), passport.authenticate('jwt', { session: false }), authController.updatePassword)

module.exports = router