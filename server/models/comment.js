let mongoose = require('mongoose')
let Schema = mongoose.Schema

let commentSchema = new Schema({
    senderId: {
        type: String,
        required: true
    },
    receiverId: {
        type: String,
        required: true
    },
    parentId: {
        type: Schema.Types.ObjectId,
        ref: 'comments'
    },
    type: {
        type: String,
        enum: ['product', 'attributes'],
        default: 'product'
    },
    logical_delete: {
        type: Date,
        default: null
    }

}, {
    timestamps: true
})

let Comment = mongoose.model('comments', commentSchema)
module.exports = Comment