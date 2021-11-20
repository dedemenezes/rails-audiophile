const addToCart = () => {
  const button = document.getElementById('bg-black-click')
  if (button) {
    button.addEventListener('ajax:success')
  }
}
