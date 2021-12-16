import { requestLoginServices } from "../../api/auth_api"
import { saveFirstName, saveLastName, saveToken } from "../../helpers/storage_helper"
import { swalError } from "../../helpers/sweetalert_helper"

export let handleLoginAction = async ({ email, password }) => {
    try {
        let respone = await requestLoginServices({ email, password })
        if (respone.status === 200) {
            saveToken(respone.data?.successToken)
            saveFirstName(respone.data?.firstName)
            saveLastName(respone.data?.lastName)
            return true
        }
        return false
    } catch (error) {
        swalError("Login field! Please check your input")
        return false
    }

}