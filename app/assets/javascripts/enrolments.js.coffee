$ ->
  $(document).on 'ajax:success','.js-enrolment', (xhr, data, status) ->
    $(this).closest('.js-enrolment').html(data)
