/* {[The file is published on the basis of YetiForce Public License 3.0 that can be found in the following directory: licenses/LicenseEN.txt or yetiforce.com]} */
import getters from '../../store/getters.js'

export default {
  /**
   * Get urls
   *
   * @param {object} state
   *
   * @returns {object}
   */
  [getters.Url.module]: state => moduleName => {
    return state.url[moduleName]
  }
}