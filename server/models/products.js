let mongoose = require('mongoose')
let Schema = mongoose.Schema

let productSchema = new Schema({
    productId: {
        type: String,
        unique: true
    },
    productName: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true,
    },
    attributes: [{
        attributeId: {
            type: Schema.Types.ObjectId,
            ref: 'attributes',
        }
    }],
    categories: [{
        type: Schema.Types.ObjectId,
        ref: 'categories'
    }],
    price: {
        type: Schema.Types.Decimal128,
        required: true
    },
    logical_delete: {
        type: Date,
        default: null
    }
})

let Products = mongoose.model('products', productSchema)
module.exports = Products