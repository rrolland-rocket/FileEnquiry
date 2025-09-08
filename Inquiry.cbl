       *>**********************************************
       *> Library Application   Solution
       *>
       *> This program provides provides user access
       *> to patron address information. An accepted
       *> patron number is passed to a subprogram
       *> for access to the indexed patron file.
       *>**********************************************
       Identification Division.
         Program-ID. Inquiry.

       Data Division.
         Working-Storage Section.
           copy 'PatronInterface.cpy'.

       Procedure Division.
         Initial-Paragraph.
           Display "        PATRON LOOKUP ".
           Display "This program accepts a patron number "
           Display "and returns the patron name and address."
           Display " "
           Display "To terminate execution, press Enter"
           Display "without typing a patron number"
           Display " "
           Display "Patron number? " no advancing
           Accept patron-number
           perform Patron-Inquiry
                              UNTIL patron-number = spaces
           Display " "
           Display "Processing complete."
           Stop Run
           .
         Patron-Inquiry.
           Call "LibrarySub" using patron-number
                                patron-information
           If patron-name = spaces
             Display " "
             Display "No entry in file for " patron-number
             Display " "
           Else
             Display " "
             Display patron-name
             Display street-address
             Display city-state-zip
             Display " "
           End-If *>patron-name = spaces
           Display "Patron number? " no advancing
           Accept patron-number
           .
        End Program Inquiry.
