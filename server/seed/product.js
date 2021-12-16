let Sequence = require('../models/sequence')
let Category = require('../models/category')
let Product = require('../models/products')
let faker = require('faker')
const Atrrtibutes = require('../models/Attribute')
const generateSequence = require('../helpers/sequence_helper')
let productSeed = async () => {
    for (i = 0; i < 50; i++) {
        // 
        let category = await Category.aggregate([
            { $sample: { size: 1 } },
            { $match: { _id: { $exists: true } } }
        ])

        let attributes = []
        for (j = 0; j < 5; j++) {
            let attribute = new Atrrtibutes({
                imageUrl: faker.image.imageUrl(),
                description: faker.lorem.paragraphs(),
                likes: faker.random.number(),
            })

            await attribute.save()
            attributes.push({ attributeId: attribute._id })
        }

        let product = new Product({
            productId: await generateSequence('PR', category[0].shortName),
            productName: faker.commerce.productName(),
            description: faker.lorem.paragraphs(),
            attributes: attributes,
            categories: [category[0]._id],
            price: faker.commerce.price(),
        })
        // 
        await product.save()
    }
}

module.exports = productSeed