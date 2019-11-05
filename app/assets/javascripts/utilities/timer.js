document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.timer')

  if (control) { 
    timerId = setInterval(timer, 1000)
  }
})

function timer() {
  var control = document.querySelector('.timer') 

  var minutes = Number.parseInt(control.textContent.slice(0, 2))
  var seconds = Number.parseInt(control.textContent.slice(-2))

  if (seconds > 0) {
    seconds--
  } else if (minutes > 0) {
    minutes--
    seconds = 59
  } else {
    var button = document.querySelector('.submit-test-passage')
    button.click()
    clearInterval(timerId)
    return
  }

  control.textContent = ("0" + minutes.toString()).slice(-2) + ":" + ("0" + seconds.toString()).slice(-2)
}
