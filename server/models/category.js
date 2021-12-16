let mongoose = require('mongoose')
let Schema = mongoose.Schema

let categorySchema = new Schema({
    name: {
        type: String,
        required: true,
    },
    shortName: {
        type: String,
        unique: true,
        trim: true,
        transform: unescape
    },
    description: {
        type: String
    },
    colors: {
        type: String,
        default: 'FF865E'
    },
    tags: {
        type: Array
    },
    parentId: {
        type: Schema.Types.ObjectId,
        ref: "categories"
    },
    logical_delete: {
        type: Date,
        default: null
    }
})

let Category = mongoose.model('categories', categorySchema)
module.exports = Category