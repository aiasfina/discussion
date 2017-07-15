import m from 'mithril'

import Nav from '../nav'

const view = vnode => {
  return [
    <Nav></Nav>,
    vnode.children
  ]
}

export default {
  view
}
