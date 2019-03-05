### Growth Mindset - A mental health journaling app ###

# First component - reporting anxiety levels on a scale of 1-10

#Ask the user how they're feeling in terms of anxiety..

#Record the input as an integer

#Make sure user can only enter numbers between 1-10, no letter strings allowed

class Checkin

    attr_accessor :anxiety_scores



    def initialize
        #Init anxiety_scores as an empty array 

        @anxiety_scores = []
    end

    def main_menu

        # Maybe only display first line on first visit? If time allows
        entry = false

        while !entry

        
        puts "\nWelcome to Growth Mindset.\n\nPlease select from the following options:"
        puts "1. Anxiety Log\n2. Journal Entry\n3. Exit "
        puts "Type the number or the word of your selection: "
        choice = gets.chomp.downcase
        

        if choice == "1" or choice == "anxiety"
            anxiety_level
            entry = true

        elsif choice == "2" or choice == "journal"
            journal_entry
            entry = true


        elsif choice == "3" or choice == "exit"
            puts "Thanks for using the app!"
            #Maybe save changes to file?
            exit

        else
            puts "Invalid entry."
        end



        end

       
        
        
    end

    def anxiety_level

        valid_level = false
    
        puts "\nOn a scale of 1-10, how anxious are you feeling today?\n\n"
    
        #Loop to check for valid input
    
        while !valid_level
            puts "A 1 represents very calm, and a 10 represents \nnear-panic attack levels of anxiety."
            level = gets.chomp
    
            #Here we are using a regular expression to check if the string input is a digit
            #String.scan creates an array of all occurences of non-digits
            
    
            # It then checks if the resulting array is empty
            
            if level.scan(/\D/).empty?
                #Actual integer conversion
                level = level.to_i
    
                
                #Check if the number is within the range 1..10
                if level >0 and level <10
                    valid_level = true
    
                else
                #Insert system.clear maybe?
                puts "\nPlease enter a valid number between 1 and 10.\n\n"
            end
    
    
            else
                
    
                #Maybe clear screen here?
            end
    
        end
            
            puts "Thank you for recording your score of #{level}."
    
            #Take input from recently entered level variable
            #Add this to a list of values

            @anxiety_scores.push(level)
            
            #Print the user's anxiety scores

            if @anxiety_scores.length == 1
               
                main_menu

                
            else
                compare_levels(@anxiety_scores)

            end

            
            #Maybe store in a hash?
    
            #Array might be better - do we need to store values?
    
            #Format of {:entry1 => 5, :entry2 => 7}, etc
    
            #Then compare values (e.g., 5,7) for the comparison method
    
    
    end
    
    
    
    def compare_levels(list)
        
        puts list


        #First part: Compare the current value to the last one and display if the user is 
        #   doing better or worse. On the first time we will need to ignore this.

        if list[-1] < list[-2]
            #Randomize encouragement message ? 
            puts "\nIt looks like you are doing better than your last entry! Go you!"
            main_menu

        else
            puts "\nIt looks like you aren't doing so well.\nWould you like a mental health tip? (Y/N)"
            selection = gets.chomp.downcase

            entry = false

            #Check for valid Y or N input
            
            while !entry
                if selection == ("y")
                    entry = true
                    display_tip
                elsif selection == ("n")
                    main_menu
                else
                    "Invalid input, please type either Y or N."
                end
            end
            

        end
        
        #Second part: Display the average, e.g., "You have an average mental health score of
        #   7 over 9 entries. (sum of entries / amount of entries)



        #Lastly, after comparison made, we will return to the main menu.
    
    end


    def journal_entry
        puts "Journal entry goes here."

        main_menu
        #Maybe let the user choose if they want to view past entries (if they exist)
        #   or enter a new one. These should be stored as strings, and marked with the date and time.
        #   so we could have a hash ==> my_journal = {:entry1 => "Today I felt good" + "This entry was
        #   recorded at (Date.time"} etc.
    end

    def display_tip
        puts "Tip goes here."
        main_menu
    end
end


luke = Checkin.new
luke.main_menu
luke.anxiety_scores