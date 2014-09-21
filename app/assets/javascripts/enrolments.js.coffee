$ ->
  $(document)
    .on 'ajax:before', '.js-enrolment-toggle', ->
      buttons = $(this).parents('.button-group').find('.js-enrolment-toggle')
      buttons.removeClass('success alert').addClass('secondary')
      $(this).removeClass('secondary success alert')

    .on 'ajax:before', '.js-enrolment-create', ->
      $(this).addClass('alert')

    .on 'ajax:success','.js-enrolment', (xhr, data, status) ->
      $(this).closest('.js-enrolment').html(data)
