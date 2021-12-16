let UserModel = require('../models/User')
let JWT = require('jsonwebtoken')
let { PASSPORT_SERECT } = require('../configs')



let authGoogle = async (req, res, next) => {
    if (req.user) {
        token = encodeedToken(req.user._id)
        return res.status(200).json({
            success: true,
            data: {
                successToken: token,
                firstName: req.user.firstName,
                lastName: req.user.lastName
            }
        })
    }
    return res.status(401).json({
        success: false,
    })
}

// 
let signUp = async (req, res, next) => {
    let { firstName, lastName, userName, email, password, phoneNumber } = req.value.body
    // check user is exsit
    condicion = []

    if (email) {
        let foundUser = await UserModel.findOne({ email })
        if (foundUser) return res.status(400).json({
            message: "Email is exists!",
            success: false,
        })
    }

    if (userName) {
        let foundUser = await UserModel.findOne({ userName })
        if (foundUser) return res.status(400).json({
            message: "User Name is exists!",
            success: false,
        })
    }

    if (phoneNumber) {
        let foundUser = await UserModel.findOne({ phoneNumber })
        if (foundUser) return res.status(400).json({
            message: "Phone Number is exists!",
            success: false,
        })
    }

    let newUser = await new UserModel({ firstName, lastName, userName, email, password, phoneNumber })
    await newUser.save()

    let token = encodeedToken(newUser._id)
    return res.status(200).json({
        success: true,
        data: {
            successToken: token,
            firstName: newUser.firstName,
            lastName: newUser.lastName
        }
    })
}

let signIn = async (req, res, next) => {
    let { email, password } = req.value.body
    let user = await UserModel.findOne({ email })
    if (user) {
        let checkMatchPassword = user.comparePassword(password);

        if (checkMatchPassword) {
            token = encodeedToken(user._id)
            return res.status(200).json({
                status: 200,
                message: "",
                success: true,
                data: {
                    successToken: token,
                    firstName: user.firstName,
                    lastName: user.lastName
                }
            })
        }
    }

    return res.status(400).json({
        success: false,
        status: 400,
    })
}

let updatePassword = async (req, res, next) => {

    if (req.user) {
        let { password } = req.value.body
        await UserModel.updateOne(
            {
                _id: req.user._id
            }, { password: password })
    }
    return res.status(200).json({
        success: true,
    })

}


let serect = async (req, res, next) => {

    return res.status(200).json({
        success: true,
        status: 200
    })
}

let encodeedToken = (userID) => {
    return JWT.sign({
        iss: "TRAN HOANG HUY",
        sub: userID,
        iat: new Date().getTime(),
        exp: new Date().setDate(new Date().getDate() + 6)
    }, PASSPORT_SERECT)
}

module.exports = {
    signUp,
    signIn,
    serect,
    authGoogle,
    updatePassword
}
