import Rails from '@rails/ujs';
import { initMapbox } from '../plugins/init_mapbox';

const geocodeCheckoutAddress = () => {
  const address = document.getElementById('address')
  if (address) {
    address.addEventListener('focusout', (event) => {
      const deliveryAddress = event.currentTarget.value
      // make request to make possible geocode typed address
      Rails.ajax({
        url: "/delivery_map",
        type: "get",
        data: `address=${deliveryAddress}`,
        success: function(data) {
          console.log(data)
          const addressCoordinates = JSON.parse(data);
          initMapbox(addressCoordinates);
        },
        error: function(data) { console.log(data) }
      })
      // Inside controller geocode address
    })
  }
}

export { geocodeCheckoutAddress }
