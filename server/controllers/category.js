const mongoose = require('mongoose')
let Category = require('../models/category')


let categories = async (req, res, next) => {

    let categories = await Category.aggregate([
        {
            $match: {
                logical_delete: { $exists: true }
            },
        },
        {
            $lookup: {
                localField: "_id",
                from: 'categories',
                foreignField: 'parentId',
                as: 'children',
            }
        },
        {
            $project: { logical_delete: 0, __v: 0, "children.__v": 0, "children.logical_delete": 0, "children.parentId": 0 }
        },
    ])

    return res.status(200).json({
        success: true,
        message: "successfull!",
        status: 200,
        items: categories
    })
}


let category = async (req, res, next) => {
    let categoryId = req.value.params.categoryId
    let category = await Category.aggregate([
        {
            $match: {
                logical_delete: { $exists: true },
                _id: mongoose.Types.ObjectId(categoryId)
            }
        },
        {
            $lookup: {
                localField: '_id',
                from: 'categories',
                foreignField: 'parentId',
                as: 'children'
            }
        },
        {
            $project: { logical_delete: 0, __v: 0, "children.__v": 0, "children.logical_delete": 0, "children.parentId": 0 }
        },

    ])


    return res.status(200).json({
        success: true,
        message: "successfull!",
        status: 200,
        data: category
    })
}

module.exports = {
    categories,
    category
}