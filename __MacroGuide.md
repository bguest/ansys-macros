ANSYS MACRO WRITING BEST PRACTICE GUIDE - ATK GOLETA
====================================================
-BEN GUEST, bagvoo@gmail.com
-VERSION 2.0

Brackets (<>) imply needs to be filled out by author, parentheses (()) imply a note about something

(This file is formated for use with Markdown, google it.)

All Macros/Input Decks should begin with a header, for example:

    !&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
    !<Macro Name>.mac
    !<Author Name> - <Author Email>
    !DESCRIPTION: <Description of Macro Functionality>
    !PRECONDITIONS:
    !	ARG1 = <Required Macro Input> (optional if nothing is required)
    !	ARG2 = <Description of Input> 
    !		<...>
    !	Required Macros:
    !		<Macros Required to Run>.mac
    !	Required Inputs:
    !		<Other Required Files>.txt/.dat
    !	<Anything else required before run>
    !POSTCONDITIONS'S
    !	<Assigned Parameters or Files Created> = <Description of Variable> 
    !NOTES: 
    !	<Any other things the user must understand>
    !	<References>
    !&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
  
After reading this header, the user should be able to use the macro/input filewith out digging through the code to understand what the macro does.

Optionally end file with footer something like:

    !======THE--END========THE--END========THE--END=========
    !ITS THE END OF THE MACRO AS WE KNOW IT, AND I FEEL FINE

**DO NOT** use variable/parameter names beginning with an underscore (_) these are variable reserved for ansys internal macros
   
**DO NOT** use single letter varibles that you expect to stay around single letter variables should be used for temporary values only.

**DO** use variable/parameter names that end with an underscore (_) for parameters that you don't want to show up when show parameters is called. You still need to be careful with parameter names as these parameters are not local variables.

**DO NOT** use branching structure to control program flow IE:

    *IF,<x>,GT,<y>,:GO_HERE  
    
    *GO,:HERE
   
This type of programing is hard to follow and is considered bad practice across the software industry
   
The one exception is if you are escaping the rest of the macro because of an error or other issue but still want to do some clean up afterwards for example,

    *IF,ARG1,EQ,0,THEN
	 	*go :end_of_file
    *endif
   	 ...
   	 :end_of_file
   	 bldFooter,'MyCoolBldFile'
   
**DO** use \*IF,\*ELSE/\*ELSEIF and \*DO/\*DOWHILE to control program flow, for example

    *IF,<x>,LT,<y>,THEN   
       <commands>           
    *ELSEIF,<x>,LT,<z>         (optional)
   	 <more commands>         (optional)
    *ELSE                      (optional)
       <even more commands>    (optional)
    *ENDIF
               
    or
    
    *DO,<i>,<start #>,<end #> 
       <commands>               
    *ENDDO                    

**DO** indent the commands for \*IF, \*DO and \*DOWHILE by at least a couple spaces. This will vastly increase the readability of your macro. There is no set indent size, while it's best to stick to a standard amount (I recomend three space), it's not worth you changing a whole file to make it look pretty, especially with todays version controll systems (See Item 8).
   
**DO** use the /EOF file to return without exicuting the rest of the macro
    IE *IF,<x>,NE,<y>,THEN
       /EOF
    *ENDIF
   
**DO** comment everything (obviously).

**DO** create a short but somewhat descriptive name for your macro, 
    
    run.mac                => bad
    LTL.mac (line to line) => ok
    NPRESS.mac             => better
    runModes.mac           => best
       
ANSYS is case-insensitive, and you should be too, while it's best to stick to a convention, it's not worth the hassel of going through and changing the whole file. This is especially true wiht todays version controll systems.

**NOTE** [GIT](http://git-scm.org) may or may not be used to version control the entire macro library. Git is awesome. It keeps track of changes to files on a line by line basis. It is for this reason however that i don't recomending changeing files excessivly for formating because if we do find a bug in a file and part of the change history has massive revisions for formating, it's hard to figure out if those changes changed how the code functioned or not. 
