let router = require('express-promise-router')()
let productController = require('../controllers/product')

router.route('')
    .get(productController.products)
    .post(productController.store)

module.exports = router