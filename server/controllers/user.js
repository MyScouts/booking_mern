let UserModel = require('../models/User')
let DeckModel = require('../models/Deck')

let getUsers = async (req, res, next) => {
    let users = await UserModel.find({})
    return res.status(200).json({ users })
}

let getUser = async (req, res, next) => {
    let { userID } = req.query
    let user = await UserModel.findById(userID)
    return res.status(200).json({ user })

}

let getUserDecks = async (req, res) => {
    let { userID } = req.value.query
    let userDesk = await UserModel.findById(userID).populate('decks')
    res.status(200).json(userDesk)
}

let storeUser = async (req, res, next) => {
    let newUser = new UserModel(req.body)
    await newUser.save()
    return res.status(200).json({ newUser })
}


let replaceUser = async (req, res, next) => {
    let { userID } = req.params
    let newUser = req.body
    await UserModel.findByIdAndUpdate(userID, newUser)
    return res.status(200).json({ success: true })
}

let updateUser = async (req, res, next) => {
    let { userID } = req.params
    let newUser = req.body
    await UserModel.findByIdAndUpdate(userID, newUser)
    return res.status(200).json({ success: true })
}

let newUserDeck = async (req, res, next) => {
    let { userID } = req.value.query
    let newDeck = new DeckModel(req.value.body)

    let user = await UserModel.findById(userID)

    newDeck.owner = user
    await newDeck.save()
    user.decks.push(newDeck._id)
    await user.save()
    res.status(201).json({ deck: newDeck })
}

module.exports = {
    getUsers,
    storeUser,
    getUser,
    replaceUser,
    updateUser,
    newUserDeck,
    getUserDecks
}