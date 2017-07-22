import m from 'mithril'
import stream from 'mithril/stream'

const login = (email, password) => {
  $.post('/login', {email: email, password: password})
  .done(resp => {
    console.log(resp)
  })
  .fail(resp => {
    console.error(resp.responseJSON)
  })
}

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
      <button class="btn btn-primary btn-lg btn-block login-btn"
        onclick={() => login(state.email(), state.password())}>Login</button>
    </form>
  )
}

export default {
  email: stream(''),
  password: stream(''),
  view
}
