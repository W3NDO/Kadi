# This script should generate a deck of cards. 

class Player
    attr_accessor :name, :hand

    def initialize name, hand
        @name = name
        @hand = []
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

class Deck
    attr_accessor :cards, :suits, :starter_card

    def initialize
        @faces = [*(2..10), "J", "Q", "K", "A"]
        @suits = {'CLUBS' => "black", 'SPADES' => 'black', "HEARTS" => 'red', "DIAMONDS" => "red"}
        @cards = []

        @suits.each do |suit, color|
            @faces.each do |face|
                @cards << Card.new(face, suit, color)
            end
        end

        @cards.shuffle!
    end

    def set_starter
        illegal_starter_cards = ["J", "Q", "K", 2, 3, 8, "A", nil]
        @starter_card = nil
        until !(illegal_starter_cards.include?(@starter_card)) do
            @starter_card = @cards.sample
        end
        @starter_card
    end
end

def Table
    attr_accessor :cards

    def start_game(starter_card)
        @last_played = [[starter_card]] #this will hold the cards played by a single player
    end

    def play_cards
        #checks the if the current cards being played are legal as per the last played card
    end
end
