require('./index.scss')
require('bootstrap/js/src/modal')

import m from 'mithril'
import SignInForm from './signin_form'

const oninit = vnode => {
}

const oncreate = vnode => {
  vnode.state.modal = $(vnode.dom).modal('show')
  vnode.state.modal.on('hidden.bs.modal', () => {
    vnode.attrs.isLogin(false)
    m.redraw()
  })
}

const view = vnode => {
  return(
    <div class="modal modal---login" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Sign In</h5>
          </div>
          <div class="modal-body">
            <SignInForm></SignInForm>
          </div>
        </div>
      </div>
    </div>
  )
}

export default {
  oninit,
  oncreate,
  view
}
