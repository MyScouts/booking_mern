const Sequence = require("../models/sequence");

let generateSequence = async (key, prefix) => {
    try {
        sequence = await Sequence.findOne({ key: key, prefix: prefix })

        if (sequence) {
            sequence.number = sequence.number + 1
            await sequence.save()
            return `${key}${prefix}${sequence.number}`;
        } else {
            let newSequence = new Sequence({
                key: key,
                prefix: prefix,
                number: 1
            })

            await newSequence.save()
            return `${key}${prefix}${newSequence.number}`;
        }
    } catch (error) {
        console.log("🚀 ~ file: sequence_helper.js ~ line 22 ~ generateSequence ~ error", error)
        return 0;
    }
}

module.exports = generateSequence