import Rails from '@rails/ujs';

const geocodeCheckoutAddress = () => {
  const address = document.getElementById('address')
  if (address) {
    address.addEventListener('focusout', (event) => {
      const deliveryAddress = event.currentTarget.value
      console.log(deliveryAddress);
      // make request to make possible geocode typed address
      Rails.ajax({
        url: "/delivery_map",
        type: "get",
        data: `address=${deliveryAddress}`,
        success: function(data) {
          const addressCoordinates = JSON.parse(data)
          return addressCoordinates
        },
        error: function(data) { console.log(data) }
      })
      // Inside controller geocode address
    })
  }
}

export { geocodeCheckoutAddress }
