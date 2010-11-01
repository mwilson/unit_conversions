Feature: Converting Units

    Scenario Outline: Returning results in the correct units
     Given a number <number>
     And  an incoming unit <incoming_unit>
     And  an outgoing unit <outgoing_unit>
     Then I should get a result of <result>

     Scenarios: Different numbers
     | number    | incoming_unit | outgoing_unit  | result      |
     | 34        | ppm           | ppb            | 34000       |
     | 762       | ppb           | ppm            | 0.762       |
     | 1         | gal           | l              | 3.785411784 |
     | 52.85     | ug/l          | mg/l           | 0.05285     |
     | -34.2     | mg/kg         | ug/kg          | -34200      |
     | -0.004    | UG/L          | ppm            | -0.000004   |