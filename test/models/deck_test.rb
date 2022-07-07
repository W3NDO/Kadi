require "test_helper"

class DeckTest < ActiveSupport::TestCase
  
  # test that a new deck is created and it has 52 cards
  test "setup Deck" do
    Deck.setup
    deck = Deck.last
    assert deck.cards&.count == 51
    assert deck.starter_card.present?
  end

  # test that you can deal cards to players. 
  test "dealing to users" do
    Deck.setup
    deck = Deck.last
    player = Player.create(number:3)
    deck.deal(3, player) #deal 3 cards to the player passed
    assert player.hand&.count == 3
  end

end
