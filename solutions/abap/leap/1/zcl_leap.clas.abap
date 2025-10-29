CLASS zcl_leap DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.

CLASS zcl_leap IMPLEMENTATION.

  METHOD leap.
* add solution here
    data: flg type abap_bool value abap_false.

    if ( ( year mod 2 ) = 0 ) and ( ( year mod 4 ) = 0 ) and ( ( year mod 100 ) <> 0 ) or ( ( year mod 400 ) = 0 )   .
*        write: / 'Leap Year'.
        result = abap_true.
    else.
*      write: / 'Not a Leap Year'.
      result = abap_false.
    endif.

  ENDMETHOD.

ENDCLASS.
