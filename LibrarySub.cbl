       *>*************************************************
       *> Library Application 
       *>
       *> This subprogram provides read access to the 
       *> following indexed file
       *>   PATRON.DAT: Indexed by Patron Number; contains 
       *>     patron name, address data and other data. 
       *> Subprogram parameters are:
       *>   ls-patron-number  Input key field value for
       *>                     file read.
       *>   ls-patron-info    Output patron information.
       *>*************************************************
       
       Identification Division.
         Program-id. LibrarySub.
       
       Environment Division.
         Input-Output Section.
           File-Control.
             Select Patron-File  assign to disk       
                   PATRON
               organization is indexed
               access is random
               record key is pr-patron-number
               .
       
       Data Division.
         File Section. 
           FD  Patron-File.
           copy 'FileContents.cpy'.        
       
         Working-Storage Section.
           01 city-with-spaces         pic X(16).
       
         Linkage Section. 
           copy 'PatronInterface.cpy'. 
       
       Procedure Division Using patron-number
                                patron-information.
       
         000-Main-module.
TAG1       Open Input Patron-File
TAG1       Perform 200-process-user-request
           Close Patron-File
           Exit program
           .
         200-process-user-request.
           Move spaces to patron-information
           Move patron-number to pr-patron-number
           Perform 800-read-patron-record
           If pr-patron-name NOT = spaces
               Perform 400-setup-patron-output
           End-if
           .
         400-setup-patron-output.
           Move spaces to patron-name
           String pr-first-name 
               delimited by "  "
                            " "
                            pr-last-name
               into patron-name
           Move pr-street-address to street-address
           Move pr-city to city-with-spaces
           String city-with-spaces 
                delimited by "  "
                             " "
                             pr-state
                             "  "
                             pr-zip
                into city-state-zip
           .
         800-read-patron-record.
           Read Patron-File
             Key is pr-patron-number
             Invalid key
               Move spaces to pr-patron-name 
           End-read
           .
       End program LibrarySub.