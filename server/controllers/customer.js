const paginateHelper = require('../helpers/paginate_helper')
let Customer = require('../models/customer')

let detail = async (req, res, next) => {
    customerId = req.value.params.customer_id;
    customer = await Customer
        .findById(customerId)
        .select(['-__v', '-logical_delete']);
    return res.status(200).json({
        succes: true,
        status: 200,
        message: 'successfull!',
        data: customer
    })
}

let getAll = async (req, res, next) => {
    condiction = {
        logical_delete: { $exists: true }
    };

    if (req.query.customerName) {
        condiction.customer_name = { $regex: `.*${req.query.customerName}.*`, $options: 'si' }
    }

    if (req.query.customerSlogan) {
        condiction.customer_slogan = { $regex: `.*${req.query.customerSlogan}.*`, $options: 'si' }
    }

    if (req.query.email) {
        condiction.email = { $regex: `.*${req.query.email}.*`, $options: 'si' }
    }

    if (req.query.address) {
        condiction.address = { $regex: `.*${req.query.address}.*`, $options: 'si' }
    }

    restult = await paginateHelper(req, Customer, condiction)
    if (restult != false) {
        return res.status(200).json({
            status: 200,
            message: "successfull!",
            success: true,
            data: restult
        })
    } else {
        return res.status(200).json({
            status: 400,
            message: "successfull!",
            success: false,
            data: null
        })
    }
}

module.exports = {
    getAll,
    detail
}