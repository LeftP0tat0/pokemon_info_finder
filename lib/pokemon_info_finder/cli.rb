class PokemonInfoFinder::CLI
    attr_accessor :pokemon, :scraper

    #call methods in order
    def call
        get_pokemon
        menu
    end

    #CLI menu options
    def list_options
        puts ""
        puts "Welcome to the Kanto Pokemon Info Finder how can I help you?"
        puts "\"1\" to go to PIF \"Find by type\""
        puts "\"2\" to go to PIF \"Find by name\""
        puts "\"exit\" to exit"
    end

    #CLI menu 
    def menu
        input = nil 
        while input != "exit"
            list_options
            input = gets.strip.downcase
            case input
            when "1"
                types
            when "2"
                names
            when "exit"
            else
                puts ""
                puts "* Please put 1, 2, or exit *"
            end
        end
    end

    #Pokemon types 
    def types
        #loop to get pokemon type from user
        input = nil
        while input != "back"
            #puts list of all pokemon types
            @pokemon_types = ["Normal","Fire","Fighting","Water","Flying","Grass","Poison","Electric","Ground","Psychic","Rock","Ice","Bug","Dragon","Ghost","Dark","Steel","Fairy"]
            puts ""
            puts "      Types"
            puts "------------------"
            @pokemon_types.each { |n| puts "      #{n}" }
            puts "------------------"
            puts ""
            puts "please enter type to see Pokemon of that type, \"back\" to go back:"
            input = gets.strip.downcase

            if @pokemon_types.include?(input.capitalize)
                pokemon_of_x_type(input)
            else
                puts "* Please enter valid Pokemon type *"
            end
        end
        
    end

    #gets name and gives info on that name
    def names
        input = nil
        while input != "back"
            puts ""
            puts "Please enter name of Pokemon you want more information on, \"back\" to go back:"
            input = gets.strip.downcase

            if input == input
                pokemon_more_info(input)
            else
                puts ""
                puts "* Please enter valid Pokemon name *"
            end
        end
    end

    #gets list of pokemon of the chosen type 
    def pokemon_of_x_type(type)
        #gets list of pokemon of that type
        puts "list of #{type} pokemon"
        names
    end

    #gets list of pokemon of the chosen name 
    def pokemon_more_info(n)
        #gets list of pokemon of that type
        puts PokemonInfoFinder::n.name
    end

    #scrapes bubbapedia's full pokemon list and adds each pokemon to a array 
    def get_pokemon
        PokemonInfoFinder::Scraper.scrape_pokemon_name
        #make pokemon class to make new pokemon and give them types and info 
    end


end