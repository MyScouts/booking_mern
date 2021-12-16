require("dotenv").config()
let PORT = process.env.PORT || 3000
let DB_URI = process.env.MONGOOSE_URI

module.exports = {
    PORT,
    DB_URI
}