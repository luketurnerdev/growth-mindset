### Growth Mindset - A mental health journaling app ###



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
    
  def main_menu

        # Maybe only display first line on first visit? If time allows
        entry = false

        while !entry

        
        puts "Welcome to Growth Mindset, #{@username.capitalize}!\n\nPlease select from the following options:"
        puts "1. Anxiety Log\n2. Journal Entry\n3. Resources\n4. Exit "
        puts "Type the number or the word of your selection: "
        choice = gets.chomp.downcase
        

        if choice == "1" or choice == "anxiety"
            anxiety_level
            entry = true

        elsif choice == "2" or choice == "journal"
            journal_entry
            entry = true

        elsif choice == "3" or choice == "resources"
            resources
            entry = true


        elsif choice == "4" or choice == "exit"
            puts "Thanks for using the app!"
            #Maybe save changes to file?
            exit

        else
            puts "Invalid entry."
        end



        end

       
        
        
    end

    def anxiety_level

        system("clear")

        valid_level = false
    
        puts "On a scale of 1-10, how anxious are you feeling today?\n\n"
    
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

            #Wait for a brief moment before returning to menu or comparing levels
            sleep(0.3)
    
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

        #Firstly we will have the tips be pre-made, then we can try to fetch them from online using a gem (if there is time)

        random = Random.new
        
        #Select a random tip from the list using a new instance of Random

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

        puts ("\nWould you like to view existing journal entries or add a new one ?
        \nEnter (1) to add, or (2) to view previous entries.
        \nEnter (3) to return to the main menu.")

        ret_val = gets.chomp()
        if(ret_val == "1")
            puts("Start typing ... \n ")
            new_journal = gets.chomp()
            date = Time.now

            #Add the new entry to the array along with current date and time
            new_journal = date.to_s + " " +  new_journal
            
            #method for updating the key everytime the user calls to add new journal so we can save it. 
            # date and time hash
            @entries.push(new_journal)
            puts "Journal entry added!"
        
        elsif(ret_val == "2")
            if(entries == [])
                p "No journals added."
            else
                system("clear")
                #Cleaning up some formatting with loop (for new lines)
                i = 0 
                while i < @entries.length
                    puts "#{@entries[i]} \n\n"
                    i+=1
                end
                # p @entries
            end
        elsif(ret_val == "3")
            main_menu

        else
            puts "Invalid entry: please enter 1, 2 or 3."
        end

        journal_entry

        #Maybe let the user choose if they want to view past entries (if they exist)
        #   or enter a new one. These should be stored as strings, and marked with the date and time.
        #   so we could have a hash ==> my_journal = {:entry1 => "Today I felt good" + "This entry was
        #   recorded at (Date.time"} etc.
    end

    
end

def resources
    puts "Here are some resources for help with mental health issues (press the number to open a link): "
    puts "\n1. Black Dog Institute"
    puts "\n2. Headspace  "
    puts "\n3. Lifeline "

    puts "\n4. Exit to main menu."

    exiting = false

    until exiting
        selection = gets.chomp.downcase
        if selection == "1" or selection == "black dog"
            system("open http://www.blackdoginstitute.org.au/public/gettinghelp/overview.cfm")
        elsif selection == "2" or selection == "heaspace"
            system("open http://www.headspace.org.au/")
        elsif selection == "3" or selection == "Lifeline"
            system("open http://www.lifeline.org.au/")
        elsif selection == "4" or selection == "exit"
            exiting = true
            main_menu

        else
            puts "Invalid entry, please enter 1,2,3 or 4."
        end

    end

    

    

end



def login_screen

    login = 
    {
    :luke => "password123",
    :sid => "password124"
    }

ret = 0
while (ret == 0 )
    puts ( "Welcome! Please enter your username.")
        id = gets.chomp
    puts ("Please enter your password." )
        val = gets.chomp

        if (id === "luke" && login[:luke] == val )
            ret = 1
        end
        if(id === "sid" && login[:sid] == val)
            ret = 1
        end
        if ( ret == 0)
        puts ("\nInvalid login ID or password. Please try again.")
        end
end

@username = id
system("clear")

end

login_screen
user = Checkin.new (@username)
user.main_menu
user.journal_entry


