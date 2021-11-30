import Rails from '@Rails/ujs';

const checkoutAddress = () => {
  const address = document.getElementById('address')
  if (address) {
    address.addEventListener('focusout', (event) => {
      const deliveryAddress = event.currentTarget.value
      console.log(deliveryAddress);
      // make request to make possible geocode typed address
      Rails.ajax({
        url: "/delivery_map",
        type: "get",
        data: deliveryAddress,
        success: function(data) { console.log(data) },
        error: function(data) { console.log(data) }
      })
      // Inside controller geocode address
    })
  }
}

export { checkoutAddress }
