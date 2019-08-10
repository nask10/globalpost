$ ->
  $('#source_zipcode').click ->
    address = $('#origin_address_ext_number').val()
    address += '+' + $('#origin_address_int_number').val()
    address += '+' + $('#origin_address_street').val()
    address += '+' + $('#origin_address_city').val()
    address += '+' + $('#origin_address_country').val()
    $.ajax(
      url: '/lookup_postcode'
      data:
        symbol: address
      method: 'POST'
      dataType: 'json'
    ).done((data) ->
      zipcode = ''
      $.each data.result[0].address_components, (idx, value) ->
        zipcode = value.long_name if value.types[0] == 'postal_code'
      $('#origin_address_zip_code').val(zipcode)
      return
    )
    return

  $('#destination_zipcode').click ->
    address = $('#destination_address_ext_number').val()
    address += '+' + $('#destination_address_int_number').val()
    address += '+' + $('#destination_address_street').val()
    address += '+' + $('#destination_address_city').val()
    address += '+' + $('#destination_address_country').val()
    $.ajax(
      url: '/lookup_postcode'
      data:
        symbol: address
      method: 'POST'
      dataType: 'json'
    ).done((data) ->
      zipcode = ''
      $.each data.result[0].address_components, (idx, value) ->
        zipcode = value.long_name if value.types[0] == 'postal_code'
      $('#destination_address_zip_code').val(zipcode)
      return
    )
    return

  return