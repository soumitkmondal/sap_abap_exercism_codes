CLASS zcl_collatz_conjecture DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    METHODS ret_steps IMPORTING num          TYPE i
                      RETURNING VALUE(steps) TYPE i
                      RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_collatz_conjecture IMPLEMENTATION.
  METHOD ret_steps.
    DATA: current TYPE i.
    
    " Validate input - must be positive
    IF num <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    
    " Handle base case
    IF num = 1.
      steps = 0.
      RETURN.
    ENDIF.
    
    current = num.
    steps = 0.
    
    " Process Collatz sequence
    WHILE current > 1.
      IF current MOD 2 = 0.
        " Even: divide by 2
        current = current DIV 2.
        steps = steps + 1.
      ELSE.
        " Odd: 3n+1
        current = current * 3 + 1.
        steps = steps + 1.
      ENDIF.
    ENDWHILE.
    
  ENDMETHOD.
ENDCLASS.