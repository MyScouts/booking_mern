let mongoose = require('mongoose')
let Schema = mongoose.Schema

let attributeSchema = new Schema({
    imageUrl: {
        type: String,
        required: true
    },
    description: {
        type: String,
        default: ""
    },
    likes: {
        type: Number,
        default: 0
    },
    comments: [{
        type: Schema.Types.ObjectId,
        ref: 'comments'
    }],
    logical_delete: {
        type: Date,
        default: null
    }
})

let Atrrtibutes = mongoose.model('attributes', attributeSchema)
module.exports = Atrrtibutes