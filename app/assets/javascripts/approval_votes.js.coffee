$ ->
  $form = $('form.new_approval_vote')
  $('#approval_vote_vote').hide()

  toggleVotePublicAnonymous = (vote) ->
    $('.js-vote-anonymous').hide()
    $('.js-vote-public').hide()

    if vote == 'vouch'
      $('.js-vote-public').show()
    else if vote != ''
      $('.js-vote-anonymous').show()

  setVote = (vote) ->

    $('[data-approval_vote-vote], input[type=submit]', $form)
      .removeClass('success')
      .removeClass('primary')
      .removeClass('alert')
      .addClass('secondary')

    buttonClass = switch vote
      when 'vouch' then 'primary'
      when 'approve' then 'success'
      when 'veto' then 'alert'

    if vote == ''
      $('.js-vote-motivation').hide()
    else      
      $("[data-approval_vote-vote='#{vote}']", $form).addClass(buttonClass).removeClass('secondary')
      $('input[type=submit]', $form).removeClass('secondary').addClass(buttonClass)
      $('.js-vote-motivation').show()

    $('#approval_vote_vote').val(vote)

    toggleVotePublicAnonymous(vote)


  $('[data-approval_vote-vote]', $form).on 'click', ->
    vote = $(this).attr('data-approval_vote-vote')
    vote = '' if vote == $('#approval_vote_vote').val()
    setVote(vote)

  currentVote = $('#approval_vote_vote').val()
  setVote(currentVote)
