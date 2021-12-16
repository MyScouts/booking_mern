let router = require('express-promise-router')()
let customerController = require('../controllers/customer')
const { validatiorParams, baseSchema } = require('../validators')

router.route('')
    .get(customerController.getAll)


router.route('/:customer_id')
    .get(validatiorParams(baseSchema.idSchema, 'customer_id'), customerController.detail)
module.exports = router