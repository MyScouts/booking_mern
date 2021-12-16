let faker = require('faker');
const Customer = require('../models/customer');

let customerSeed = async () => {
    await Customer.deleteMany({})
    let items = [];
    for (i = 0; i < 100; i++) {
        items.push(
            {
                customer_name: faker.company.companyName(),
                customer_slogan: faker.company.companySuffix(),
                address: faker.address.streetAddress(),
                email: faker.internet.email(),
                description: faker.lorem.text(),
                phone_number: faker.phone.phoneNumber(),
                logo: faker.image.imageUrl(),
                logical_delete: null
            }
        )
    }

    await Customer.insertMany(items)
}

module.exports = customerSeed