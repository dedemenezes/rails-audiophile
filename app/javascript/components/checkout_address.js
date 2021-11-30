const checkoutAddress = () => {
  const address = document.getElementById('address')
  if (address) {
    address.addEventListener('focusout', (event) => {
      const deliveryAddress = event.currentTarget.value
      
    })
  }
}
