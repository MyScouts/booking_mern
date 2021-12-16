import React from 'react'
import swal from '@sweetalert/with-react'

export const onPick = value => {
    swal("Thanks for your rating!", `You rated us ${value}/3`, "success")
}

const MoodButton = ({ rating, onClick }) => (
    <button
        data-rating={rating}
        className="mood-btn"
        onClick={() => onClick(rating)}
    />
)

export let swalError = (message) => {
    swal({
        icon: "warning",
        title: "ERROR",
        text: message,
        button: "close!",
    });
}