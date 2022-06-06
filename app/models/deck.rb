class Deck < ApplicationRecord

    def self.setup    
        deck = NewDeck.new
        starter_card = deck.set_starter
        Deck.create(cards: deck.cards, starter_card: starter_card)
    end

    # we can deal a specified number of cards to one player. The cards are popped from the current deck.
    # This has to be an instance method, cause the deck has to exist
    # Cards are added to the Player's hand. The cards are popped in order from the Deck.
    def deal(card_count, player)
        cards = self.cards[0...card_count] # will grab the first n cards from the cards list, where n = card_count
        self.cards = self.cards - cards
        self.save
        current_hand = player.hand
        player.update(hand: [*cards, *current_hand])
    end
end

class Card
    attr_accessor :face, :suit, :color

    def initialize face, suit, color
        @face = face
        @suit = suit
        @color = color
    end
end

class NewDeck
    attr_accessor :cards, :suits, :starter_card

    def initialize
        @faces = [*(2..10), "J", "Q", "K", "A"]
        @suits = {'CLUBS' => "black", 'SPADES' => 'black', "HEARTS" => 'red', "DIAMONDS" => "red"} #color may determine the legality of the card to be played, hence we need to keep track of it.
        @cards = []

        @suits.each do |suit, color|
            @faces.each do |face|
                @cards << Card.new(face, suit, color)
            end
        end

        return @cards.shuffle!
    end

    def set_starter
        illegal_starter_cards = ["J", "Q", "K", 2, 3, 8, "A", nil]
        @starter_card = nil
        until !(illegal_starter_cards.include?(@starter_card)) do
            @starter_card = @cards.sample
        end
        @cards.delete(@starter_card) #ensures the starter card on the table has been removed from deck
        @starter_card
    end
end