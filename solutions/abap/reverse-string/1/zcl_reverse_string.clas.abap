CLASS zcl_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_reverse_string IMPLEMENTATION.

  METHOD reverse_string.
    data: inputstr type string, 
    tmpStr type string,
          tmpPart type string,
          strLe type i,
          d type i value 0.
    inputstr = input.
    strLe = STRLEN( inputstr ) - 1.
    while strLe >= d.
      tmpPart = inputstr+strLe(1).
      " tmpStr = tmpStr && tmpPart.
      concatenate tmpStr tmpPart into tmpStr.
      strLe = strLe - 1.
    ENDWHILE.

    result = tmpStr.

  ENDMETHOD.

ENDCLASS.
