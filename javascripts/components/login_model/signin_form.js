import m from 'mithril'
import stream from 'mithril/stream'

const view = vnode => {
  const state = vnode.state
  return(
    <form className="form---combine">
      <div className="form-group">
        <input type="text" className="form-control" placeholder="Email" autocomplete="off"
          value={state.email()} oninput={m.withAttr('value', state.email)} />
        <input type="password" className="form-control" placeholder="Password" autocomplete="off"
          value={state.password()}  oninput={m.withAttr('value', state.password)} />
      </div>
      <button class="btn btn-primary btn-lg btn-block login-btn">Login</button>
    </form>
  )
}

export default {
  email: stream(''),
  password: stream(''),
  view
}
