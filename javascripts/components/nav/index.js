require('./index.scss')

import m from 'mithril'
import Login from '../login_model'

const oninit = vnode => {
  const state = vnode.state

  state.startLogin = () => {
    Login.isLogin(true)
  }
}

const view = vnode => {
  const state = vnode.state

  return(
    <nav className="nav">
      <div className="container">
        <div className="nav-logo">
          <a href="/" oncreate={m.route.link}>Discussion</a>
        </div>
        <ul className="nav-menu nav-menu---left">
          <li><a href="#">Home</a></li>
          <li><a href="#">Next</a></li>
        </ul>
        <ul className="nav-menu nav-menu---right">
          <li><a className="btn btn-primary nav-login-btn" href="#" onclick={state.startLogin}>Login</a></li>
        </ul>
      </div>
    </nav>
  )
}

export default {
  oninit,
  view
}
