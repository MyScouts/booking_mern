require("dotenv").config()
const faker = require("faker");
let mongooseClient = require('mongoose')
let customerSeed = require('./customer')
let categorySeed = require('./category');
const productSeed = require("./product");
let MONGOOSE_URI = process.env.MONGOOSE_URI


async function seedDB() {
    await mongooseClient.connect(MONGOOSE_URI, {
        useNewUrlParser: true,
    })
    try {
        // await customerSeed()
        // await categorySeed()
        await productSeed()
    } catch (err) {
        console.log(err.stack);
    }
}

seedDB()