let mongoose = require('mongoose')
let Schema = mongoose.Schema

let customerSchema = new Schema({
    customer_name: {
        type: String,
        required: true,
        maxlength: 100
    },
    customer_slogan: {
        type: String,
        maxlength: 500
    },
    address: {
        type: String,
        maxlength: 256,
    },
    email: {
        type: String,
        maxlength: 50
    },
    description: {
        type: String,
    },
    phone_number: {
        timestamps: String
    },
    logo: {
        type: String
    },
    products: [{
        type: Schema.Types.ObjectId,
        ref: 'products'
    }],
    logical_delete: {
        type: Date,
        default: null
    }
}, {
    timestamps: true
})

let Customer = mongoose.model("customers", customerSchema)
module.exports = Customer