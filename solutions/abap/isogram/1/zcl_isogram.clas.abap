CLASS zcl_isogram DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS is_isogram
      IMPORTING
        VALUE(phrase)        TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_isogram IMPLEMENTATION.

  METHOD is_isogram.
    " add solution here
    TYPES: BEGIN OF ty_char,
             letter type c LENGTH 1,
           end of ty_char.


   Data: it_char type HASHED TABLE OF ty_char WITH UNIQUE KEY letter,
         wa_char like line of it_char,
         lv_char type c length 1,
         lv_strng type string,
         lv_idx type i,
         lv_isogram type abap_bool value abap_true.

  lv_strng = to_lower( val = phrase ).

  do strlen( lv_strng ) times.
    lv_idx = sy-index - 1.
    lv_char = lv_strng+lv_idx(1).
    wa_char-letter = lv_char.


    if lv_char BETWEEN 'a' and 'z'.
      READ table it_char WITH TABLE KEY letter = lv_Char TRANSPORTING NO FIELDS.

      if sy-subrc = 0.
        lv_isogram = abap_false.
        exit.
      else.
        lv_isogram = abap_true.
        INSERT wa_char INTO TABLE it_char.
      endif.
   endif.
  enddo.
  if lv_isogram = abap_true.
    result = abap_true.
  else.
    result = abap_false.
  endif.
  ENDMETHOD.    
ENDCLASS.
