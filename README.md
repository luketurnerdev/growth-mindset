#GROWTH MINDSET

https://github.com/luketurnerdev/growth-mindset


## DESCRIPTION OF APP

Growth Mindset is a mental health journaling app that lets users 'check in' and rate their levels of anxiety as well as allowing them to enter longer, free-form style journal entries. The user is provided with a random mental health tip if their mental state is getting worse, and encouragement if they are getting better.

## PROJECT AIMS / MISSION STATEMENT

The aim of Growth Mindset is to provide a long-term journal for users suffering from mental health issues such as depression and anxiety. It can sometimes be hard to get an accurate perspective on your mental health over time, and a journaling app such as this one can provide a long-term snapshot of how your mental state has been progressing.

### USER STORIES

The following are user stories that we had in mind while designing this project. These users helped us design the program with end users' needs in mind.

1. As Luke, I want to be able to log my feelings so that I can track my progress over time.

2. As Francine, I want to help my patients express themselves so that I can better treat them in my practice.

3. As Jimmy, I want to have a platform for mental health management so that I can avoid using older technology (such as a physical journal).

4. As David, I want to give my son resources to help himself so that he can communicate better with others.

## FUNCTIONALITY

    The user enters the app and is greeted and asked for their name. They are then presented with a main menu, in which they can choose from the following options :

    1) Anxiety log

        By choosing this option, the app then asks the user to rate their current level of anxiety on a scale of 1-10. The first time this is run, the recorded score is displayed, and the user is returned to the main menu. Every time after this, a comparison is made, in which the value given and the previous value given are compared. If the user is less anxious before, they are congratulated. If not, they are asked if they would like to receive a mental health tip. If the user selects yes, they are given a tip selected randomly from a pre-defined list. They are then returned to the main menu.

    2) Journal Entry
        
        The user is asked if they would like to submit a new journal entry, or view their past entries. If the user opts for a new entry, they are prompted to type their message. This is then stored and can be retrieved by selecting the second option, along with any previous entries they may have had stored.

    3) Resources

        The resources option presents users with a list of links relating to mental health (such as Headspace). When the user enters the number corresponding to the relevant link, the link should open in their browser, using a shell command (if the user is using Mac or Linux).

    4) Exit

        The user is given a goodbye message and the app terminates.


## INSTRUCTIONS FOR USE

As a command-line interface project, the app is controlled entirely with the keyboard, by typing commands. In most instances, there are multiple ways of entering data (either through numbers or the words of the options).

    1. Ensure you have the current version of Ruby installed (2.6.0 at time of writing). If not, instructions and downloads can be found here (https://www.ruby-lang.org/en/downloads/).

    2. Navigate to the directory containing your copy of growth_mindset.rb using [cd [directory]], and run it by typing [ruby growth_mindset.rb].

    3. You will be greeted, and asked for your name. Enter your name.

    4. You are now in the main menu. You may type numbers (1,2,3 or 4) or type the words 'anxiety', 'journal', 'resources' or 'exit',  whatever you prefer (case is accounted for). Other inputs will return an error.

    5. The app is controlled in the same way throughout the program, using the same typing conventions as explained above.

    6. You may exit the app at any time by either selecting the exit option from the main menu, or simply pressing CMD+C (CTRL+C on windows) to exit the application.


## SCREENSHOTS

Here are some screenshots of the app in action:

[1. Login screen]

![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/appshot-1.png "Login screen)

This screen shows a successful user login, and the main menu that they are presented with afterwards.

[2. Positive result]

![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/appshot-positive.png "Positive comparison)

This shows a positive outcome (reduction in anxiety) in the anxiety log. 

[3. Negative result]

![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/appshot-negative.png "negative comparison)

This shows the user receiving a random tip as a result of a negative anxiety log comparison.

[4. New journal]

![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/appshot-newjournal.png "new journal entry)

The users enters a new journal entry, and the list of current entries is output.

[6. Resources]

![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/appshot-resources.png "resources)

This shows the options available under resources.


[7. Headpsace]

![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/appshot-headspace.png "new journal entry)

This is the user's browser opening after selecting the 'headspace' resource.


## DESIGN AND PLANNING PROCESS

### Initial brainstorm   

Initally, I (Luke) sat down and brainstormed a lot of different ideas for an app. My intention was to have a free-flowing thought process in which no idea a bad idea. A lot of the ideas had to be abandoned due to scope (there are only 2 days to work on the app), but this 'judgement-free' style of brainstorming worked well for creating ideas.


![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/brainstorming-written.jpg "Brainstorming, written")

![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/brainstorming-typed.png "Brainstorming, typed")

### Planning - Flowcharts, trello

After discussions with my tutor, I decided to keep the scope of the project quite small, and focus on a few core features. I then drew a flowchart of the way that the user might move through the system.

This was the original flowchart:

![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/flowchart-core.jpg "Whiteboard flowchart.")

The flowchart shows the core functionality of the program: 
- Let the user enter anxiety ratings
- Compare these ratings and give a positive (encouragement) or negative (random tip) outcome
- Let the user submit journal entries and view past entries
- Exit the application.

The final flowchart (with the resources added and more detail on selections):

![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/flowchart-final.png "Updated flowchart.")

I also then created a Trello board, which contained various categories:

![alt text](https://github.com/luketurnerdev/growth-mindset/blob/master/docs/first-trello.png "Initial Trello board.")

The board contained the following categories (not all pictured):

- User Stories (for general planning )
- Core features (things to definitely be included)
- Extra features (things to add if there was time)
- Backlog (things to be done but haven't had a date or user assigned yet)
- To Do (Tasks to be done soon with a deadline set)
- In deveopment (features that are currently being coded (half-working etc)
- Testing (All 'working' features were moved here until final code checks on the last day (for edge cases etc))
- Complete (features that are safe and ready to 'deploy')

## Development

After the idea was approved and the general structure of the features to be included was created, development began.

The code initally developed simply using methods



## Challenges

Thor










TESTING

The following spreadsheet tested all the functionality of the project:

https://docs.google.com/spreadsheets/d/1GtGHyFpPlKU40JDb3bCUdcNKJub6UWzDLekybsrI3Ok/edit?usp=sharing 

[screenshot of completed test]

- Normal functionality
- Edge cases

-












1. Rationale / Aims of the project / mission statement

2. Planning (flowcharts, trello etc)

2. Core functionality

3. Extra features

4. Development process

6. User stories...


This file should contain,

A link to your GitHub repository
Ensure the repository (repo) is accessible by your Educators
Description of the app, including,
Purpose
Functionality
Instructions for use
Screenshots
Details of design & planning process including,
Evidence of app idea brainstorming sessions
app User/Workflow diagram
Project plan & timeline
Screenshots of Trello board(s)

RANDOM RESOURCES TO SORT THROUGH


https://www.healthdirect.gov.au/tips-for-good-mental-health

