let mongoose = require('mongoose')
let bcrypt = require('bcryptjs')
let Schema = mongoose.Schema

let userSchema = new Schema({
    firstName: {
        type: String
    },
    lastName: {
        type: String
    },
    userName: {
        type: String,
        unique: true,
        lowercase: true
    },
    email: {
        type: String,
        required: true,
        lowercase: true,
        unique: true
    },
    password: {
        type: String,
    },
    provider: {
        type: String,
        enum: ['local', 'google', 'facebook'],
        default: 'local'
    },
    providerGoogle: {
        type: String,
        default: null
    },
    providerFacebook: {
        type: String,
        default: null
    },
    phoneNumber: {
        type: String,
        unique: true,
        maxlength: 10,
        minlength: 10
    },
    decks: [{
        type: Schema.Types.ObjectId,
        ref: 'Deck'
    }]
})

// custom server
userSchema.pre('save', async function (next) {
    try {
        if (this.provider === 'local') {
            let salt = await bcrypt.genSalt(10)
            let passwordHased = await bcrypt.hash(this.password, salt)
            this.password = passwordHased
        }
        next()
    } catch (error) {
        next(error)
    }
})


// custom server
userSchema.pre('updateOne', async function (next) {
    try {
        let data = this.getUpdate()
        let salt = await bcrypt.genSalt(10)
        data.password = await bcrypt.hash(data.password, salt)
        next()
    } catch (error) {
        next(error)
    }
})

userSchema.methods.comparePassword = async function (candidatePassword) {
    try {
        return await bcrypt.compare(candidatePassword, this.password);
    } catch (error) {
        throw new Error(error)
    }
};

// 
let UserModel = mongoose.model('User', userSchema)
module.exports = UserModel