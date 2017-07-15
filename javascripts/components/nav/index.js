require('./index.scss')

import m from 'mithril'

const view = vnode => {
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
          <li><a href="#">Login</a></li>
        </ul>
      </div>
    </nav>
  )
}

export default {
  view
}
