require('dotenv').config

let PASSPORT_SERECT = process.env.PASSPORT_SERECT
let GOOGLE_CLIENT_ID = process.env.GOOGLE_CLIENT_ID
let GOOGLE_CLIENT_SECRET = process.env.GOOGLE_CLIENT_SECRET

module.exports = {
  PASSPORT_SERECT,
  GOOGLE_CLIENT_ID,
  GOOGLE_CLIENT_SECRET
}