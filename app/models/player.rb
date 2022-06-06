class Player < ApplicationRecord
    # typically we would want to initialize the hand as an array, but that works for DBs that can store arrays like Postgres
    # in SQL && SQLite we can use serialize to accomplish the same thing. 
    # Not sure about perormance loss though. 
    serialize :hand, Array

    #keep track of the deck they're playing from.

    def kula

    end

    def play_hand()

    end
end
