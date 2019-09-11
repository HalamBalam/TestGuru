document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.password-confirmation')

  if (control) { control.addEventListener('input', comparePasswords) }
})

function comparePasswords() {
  var password = document.querySelector('.password').value
  var password_confirmation = this.value

  var alert_icon = document.querySelector('.octicon-alert')

  if (password_confirmation == '' || password == password_confirmation) {
    alert_icon.classList.add('hide')  
  } else {
    alert_icon.classList.remove('hide')
  }
}
