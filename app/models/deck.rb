class Deck < ApplicationRecord

    def self.setup    
        deck = NewDeck.new
        starter_card = deck.set_starter
        Deck.create(cards: deck)
    end
end

class Card
    attr_accessor :face, :suite, :color

    def initialize face, suite, color
        @face = face
        @suite = suite
        @color = color
    end
end

class NewDeck
    attr_accessor :cards, :suites, :starter_card

    def initialize
        @faces = [*(2..10), "J", "Q", "K", "A"]
        @suites = {'CLUBS' => "black", 'SPADES' => 'black', "HEARTS" => 'red', "DIAMONDS" => "red"}
        @cards = []

        @suites.each do |suite, color|
            @faces.each do |face|
                @cards << Card.new(face, suite, color)
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