### Growth Mindset - A mental health journaling app ###

# First component - reporting anxiety levels on a scale of 1-10

#Ask the user how they're feeling in terms of anxiety..

#Record the input as an integer

#Make sure user can only enter numbers between 1-10, no letter strings allowed

require "simple-random"

class Checkin
    

    attr_accessor :anxiety_scores, :health_tips, :entries

    attr_reader :username

    #Class variable => This applies to all instances

    def initialize(username)
        #assign username based on user input during instantiation

        @username = username

        #Init anxiety_scores as an empty array 

        @anxiety_scores = []

        #Array of mental health tips

        @health_tips = 
        
        [
        "Make sure to drink plenty of water, and eat plenty of fruits and vegetables.",
        "Take time to work on your relationships with others.",
        "Try developing a list of things you are grateful for.",
        "Getting out into nature can be greatly refreshing for the mind.",
        "Make a list of things you want to accomplish today, and how you are going to do these things.",
        "Try giving to others. Being charitable can increase social well-being.",
        "Don't be afraid to reach out to others, they may be going through similar problems!",
        "Pick up a new hobby, or work on one you haven't done in a while."

        ]

        @entries = []

        


    end
    
    

    def populate_random_tips
        #We need to add to the list of health tips by running through a loop
        # Example tip: {:tip1 => "Go for a run!"}


        #Start iteration at the end of the current list of hashes (need to test this)

        # i = @health_tips.keys.length + 1
        # while i < 5
        #     current_key = "key#{i}".to_sym
        #     @health_tips[current_key] = "random tip goes here"
        #     i += 1
        # end

        


        
    end


    

    def main_menu

        # Maybe only display first line on first visit? If time allows
        entry = false

        while !entry

        
        puts "\nWelcome to Growth Mindset, #{@username}!\n\nPlease select from the following options:"
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
            
            puts "\nThank you for recording your score of #{level}."
    
            #Take input from recently entered level variable
            #Add this to a list of values

            @anxiety_scores.push(level)
            

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
        


        #First part: Compare the current value to the last one and display if the user is 
        #   doing better or worse. On the first time we will need to ignore this.

        if list[-1] < list[-2]
            #Randomize encouragement message ? 
            puts "\nIt looks like you are doing better than your last entry! Go you!"
            display_average
            main_menu

        else
            display_average
            entry = false
            while !entry

                puts "\nIt looks like you aren't doing so well.\nWould you like a mental health tip? (Y/N)"
                selection = gets.chomp.downcase

                #Check for valid Y or N input

                if selection == "y" or selection == "yes"
                        entry = true
                        display_tip
                elsif selection == "n" or selection == "no"
                        entry = true
                        main_menu
                else
                       puts "\nInvalid input, please type either Y or N. "
                end


            end
            
            

        end
        
        
    
    end

    def display_tip
        #We need to have a pre-defined list of tips to display to the user.
        # This will likely be stored in a hash, so that we can identify unique keys.
        # Once all tips have been used, we might display a message like "out of new tips, try again later!"

        #Firstly we will have the tips be pre-made, then we can try to fetch them from online using a gem.

        random = Random.new
        
        puts "\n\n#{health_tips[random.rand(1..@health_tips.length)]}"
        main_menu
    end

    def display_average
       
        #To find average, we should loop through the @anxiety_scores array and add the values to a sum,
            #then divide by the amount of entries

        scores_average = 0
        sum = 0    
        i = 0
        while i < @anxiety_scores.length
            sum += @anxiety_scores[i]
            
            
            i+=1
            
        end
        scores_average = sum / @anxiety_scores.length
        puts  "\nYour average score over #{@anxiety_scores.length} entries is #{scores_average}."
    end


    def journal_entry
        puts ("would you like to view an old journal or add a new one ? \n Enter (1) for adding and (2) for viewing the past journals\n")
        ret_val = gets.chomp()
        if(ret_val == "1")
            puts("start typing ... \n ")
            new_journal = gets.chomp()
            date = Time.now
            new_journal = date.to_s + " " +  new_journal
            
            #method for updating the key everytime the user calls to add new journal so we can save it. 
            # date and time hash
            @entries.push(new_journal)
            p @entries
        end
        if(ret_val =="2")
            if(entries == [])
                p "no journals added"
            else
            p @entries
            end
        end
        main_menu

        #Maybe let the user choose if they want to view past entries (if they exist)
        #   or enter a new one. These should be stored as strings, and marked with the date and time.
        #   so we could have a hash ==> my_journal = {:entry1 => "Today I felt good" + "This entry was
        #   recorded at (Date.time"} etc.
    end

    
end



login = {
    :luke => "password123",
    :sid => "password124"
        }
ret = 0
while (ret == 0 )
    puts ( "enter login ID")
        id = gets.chomp()
    puts ("enter password" )
        val = gets.chomp()

        if(id === "luke" && login[:luke] == val )
            ret = 1
            break
        end
        if(id === "sid" && login[:sid] == val)
            puts "Welcome sid"
            ret = 1
        end
        if ( ret == 0)
        puts ("\ninvalid login ID or password. please try again")
        end
end

user = Checkin.new ("Luke")
user.main_menu


