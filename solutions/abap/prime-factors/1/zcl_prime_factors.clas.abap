CLASS zcl_prime_factors DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS factors
      IMPORTING
        input         TYPE int8
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_prime_factors IMPLEMENTATION.
  METHOD factors.
    " add solution here
    DATA: val    TYPE i VALUE 2,
          number TYPE i,
          wa_res LIKE LINE OF result.
    number = input.

    if input = 2.

      wa_res = input.
      append wa_res to result.

    endif.

    clear wa_res.    

    DO.
      IF val < number.
        CLEAR wa_res.
        DO.
          CLEAR wa_res.
          IF number MOD val = 0.
            wa_res = val.
            number = number DIV val.
            APPEND wa_res TO result.
          ELSE.
            EXIT.
          ENDIF.
        ENDDO.
      ELSE.
        EXIT.
      ENDIF.
      val = val + 1.
    ENDDO.

    IF number > 2.
      wa_res = number.
      APPEND wa_res TO result.
    ENDIF.

  ENDMETHOD.


ENDCLASS.
