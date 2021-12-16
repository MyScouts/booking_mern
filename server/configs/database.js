require('dotenv').config()
let mongooseClient = require('mongoose')

let MONGOOSE_URI = process.env.MONGOOSE_URI
// 
let DBConnect = async () => {
    try {
        await mongooseClient.connect(MONGOOSE_URI, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
        })
        console.log("Mongoose connection is successfull!")
    } catch (error) {
        console.log("🚀 ~ file: database.js ~ line 8 ~ DBConnect ~ error", error)
    }
}

module.exports = DBConnect