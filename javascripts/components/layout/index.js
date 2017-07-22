import m from 'mithril'

import Nav from '../nav'
import Login from '../login_model'

const view = vnode => {
  return [
    <Nav></Nav>,
    vnode.children,
    Login.isLogin() ? <Login></Login> : null
  ]
}

export default {
  view
}
