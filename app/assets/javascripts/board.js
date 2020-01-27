  // Selecting & Moving Pieces
  $('#board').click(function() {
    $this = $(this);
    // Returns boolean to determine piece is selected or not
    var pieceIsSelected = $('#board').hasClass('selected');

    if (pieceIsSelected){
      // Returns jQuery object of selectedPiece if a piece is selected
      var $piece = selectedPiece();

      if ($piece.data('piece-type') == $this.data('piece-type')) {
        deselectPiece( $this );
      } else {
          sendMove ($piece, $this);
        }
    } else {
      selectPiece($this);
    }

  });

  function selectedPiece() {
    return $('#board.selected');
  }

  function sendMove ($piece, $destination) {
    var piece = {
      id: $piece.data('piece-id'),
      column_position: $destination.data('column_position-position'),
      row_position: $destination.data('row_position-position')
    }

      return {
      submitPieceUpdate(piece);
    }
  }

  function submitPieceUpdate(piece) {
    $.ajax({
      type: 'PATCH',
      url: '/pieces/' + piece.type,
      dataType: 'json',
      data: { 
        piece: piece
      },
      success: function(data) {
        $(location).attr('href', data.update_url);
      }
    });
  }

  function selectPiece($piece) {
    var isPlayersTurn = $('#board').data('current-turn');

    if (isPlayersTurn) {
      $piece.addClass('selected');
    }
  }

  function deselectPiece($piece) {
    $piece.removeClass('selected');
  }
});