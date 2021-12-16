let router = require('express-promise-router')()
let categoryController = require('../controllers/category')
const { validatiorParams, baseSchema } = require('../validators')

router.route("")
    .get(categoryController.categories)

router.route('/:categoryId')
    .get(validatiorParams(baseSchema.idSchema, 'categoryId'), categoryController.category)

module.exports = router