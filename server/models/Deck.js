let mongoose = require('mongoose')
let Schema = mongoose.Schema

let deckSchema = new Schema({
    name: {
        type: String
    },
    description: {
        type: String
    },
    total: {
        type: Number,
        default: 0
    },
    owner: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    }
})

let DeckModel = mongoose.model('Deck', deckSchema)
module.exports = DeckModel