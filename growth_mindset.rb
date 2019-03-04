#Growth Mindset - A mental health journaling app

# First component - reporting anxiety levels on a scale of 1-10

#Ask the user how they're feeling in terms of anxiety..

#Record the input as an integer

#Make sure user can only enter numbers betwee 1-10, no strings allowed

def anxiety_level
    valid_level = false

    puts "\nOn a scale of 1-10, how anxious are you feeling today?\n\n"

    #Loop to check for valid input

    #TODO - put string on 2 lines
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

        #convert to i, but make sure it is actually a number
        

        #Check if the input is an integer

        #TTY gem for menus
        
        else
            

            #Maybe clear screen here?
        end

    end
        
        puts "Thank you for recording your score of #{level}."
        
        #Maybe store in a hash?

        #comparison method goes here: compare_levels(level)



end



def compare_levels(level)

end

anxiety_level