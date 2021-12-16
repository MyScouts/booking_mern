let Sequence = require('../models/sequence')
let Category = require('../models/category')
let Product = require('../models/products')

// 
let products = async (req, res, next) => {
    let page = parseInt(req.query.page)
    let limit = parseInt(req.query.pageSize)
    let startIndex = (page - 1) * limit
    let endIndex = page * limit
    let condiction = {}
    let totalPage = Math.ceil((await Product.countDocuments(condiction)) / limit);

    let products = await Product.find({})
        .populate({
            path: 'attributes.attributeId',
            model: 'attributes'
        })
        .skip(startIndex)
        .limit(endIndex)

    return res.status(200).json({
        success: true,
        message: "successfull!",
        status: 200,
        data: {
            totalPage: totalPage,
            page: page,
            pageSize: limit,
            items: products
        }
    })

}

let store = async (req, res, next) => {
    let category = await Category.aggregate([
        { $sample: { size: 1 } },
        {
            $match: {
                _id: { $exists: true },
                logical_delete: { $exists: true },
            }
        }
    ])

    return res.status(200).json(category)
}

module.exports = {
    store,
    products
}