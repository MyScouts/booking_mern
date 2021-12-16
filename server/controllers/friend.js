let FriendModel = require('../models/Friend')
let UserModel = require('../models/User')
let addFriend = async (req, res, next) => {
    let { friendId } = req.value.body
    let userId = req.user._id

    if (friendId == userId) {
        return res.status(400).json({
            success: false,
            message: "Friend Id not me!"
        })
    }

    // check user is is not exits
    let checkExistUser = await UserModel.exists({ _id: friendId })
    if (!checkExistUser) {
        return res.status(400).json({
            success: false,
            message: "User not exits!"
        })
    }

    let friends = await FriendModel.findOne({ userId: userId })

    if (friends) {
        let isExits = friends.myFriend.includes(friendId)
        if (!isExits) {
            friends.myFriend.push(friendId)
            await friends.save()
        }
    } else {
        let newFriend = await new FriendModel({ userId: userId, myFriend: [friendId] })
        await newFriend.save()
    }


    let myFriends = await FriendModel.find({}).populate('myFriend')


    return res.status(200).json({ myFriends })
}

module.exports = {
    addFriend
}