document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')
  
  if (progressBar) {
    var percent = Math.round((progressBar.dataset.currentValue - 1) / progressBar.dataset.maxValue * 100)
    progressBar.style.width = "" + percent + "%"
    progressBar.textContent = "" + percent + "%"
  }
})
