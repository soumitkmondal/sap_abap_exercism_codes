CLASS zcl_nth_prime DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS prime
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
    METHODS checkprime
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.        
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_nth_prime IMPLEMENTATION.
  METHOD prime.
    DATA count TYPE i.
    IF input = 0.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    result = 1.
    WHILE count < input.
        result  = result + 1.
        IF checkprime( input = result ) = abap_true.
            count = count + 1.
        ENDIF.
    ENDWHILE.
  ENDMETHOD.
  METHOD checkprime.
      DATA(divisor) = 2.
      DATA(sqrt_prime) = sqrt( input ).
      WHILE divisor <= sqrt_prime.
          IF input MOD divisor = 0.
              result = abap_false.
              RETURN.
          ENDIF.
          divisor  = divisor + 1.
      ENDWHILE.
      result = abap_true.
  ENDMETHOD.


ENDCLASS.
