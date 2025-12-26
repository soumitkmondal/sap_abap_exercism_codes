CLASS zcl_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_phone_number IMPLEMENTATION.

  METHOD clean.
    DATA: lv_raw     TYPE string,
          lv_digits  TYPE string.

    lv_raw = number.

    " Empty input
    IF lv_raw IS INITIAL.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Reject letters explicitly
    IF lv_raw CP '*[A-Za-z]*'.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Remove all non-digits
    lv_digits = lv_raw.
    REPLACE ALL OCCURRENCES OF REGEX '[^0-9]' IN lv_digits WITH ''.

    DATA(lv_len) = strlen( lv_digits ).

    " More than 11 digits
    IF lv_len > 11.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " 11 digits must start with 1
    IF lv_len = 11.
      IF lv_digits+0(1) <> '1'.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
      ENDIF.
      " Remove country code
      lv_digits = lv_digits+1.
      lv_len = 10.
    ENDIF.

    " Must be exactly 10 digits now
    IF lv_len <> 10.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Area code validation (first digit cannot be 0 or 1)
    IF lv_digits+0(1) = '0' OR lv_digits+0(1) = '1'.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    " Exchange code validation (4th digit cannot be 0 or 1)
    IF lv_digits+3(1) = '0' OR lv_digits+3(1) = '1'.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    result = lv_digits.
  ENDMETHOD.
ENDCLASS.
