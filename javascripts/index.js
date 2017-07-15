require('./index.scss')

import m from 'mithril'
import Layout from './components/layout'

const rootElement = document.getElementById('main');

m.route(rootElement, '/', {
  '/': {
    render: vnode => {
      return m(Layout)
    }
  }
})
