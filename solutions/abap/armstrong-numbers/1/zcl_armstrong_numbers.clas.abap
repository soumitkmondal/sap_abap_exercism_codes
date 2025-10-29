CLASS zcl_armstrong_numbers DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS is_armstrong_number IMPORTING num           TYPE i
                                RETURNING VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_armstrong_numbers IMPLEMENTATION.
  METHOD is_armstrong_number.
    data: n type i,
          d0 type i value 0,
          res type i VALUE 0,
          cnt type i value 0.
    n = num.
    while n > 0.
      d0 = n mod 10.
      cnt = cnt + 1.
      n = n div 10.
    ENDWHILE.

    n = num.
    d0 = 0.

    while n > 0.
      d0 = n mod 10.
      res = res + ( d0 ** cnt ).
      n = n div 10.
    ENDWHILE.

    if res = num.
      result = abap_true.
    else.
      result = abap_false.
    endif.


  ENDMETHOD.
ENDCLASS.

