CLASS zcl_acronym DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS parse IMPORTING phrase         TYPE string
                  RETURNING VALUE(acronym) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_acronym IMPLEMENTATION.
  METHOD parse.

    Data(text) = phrase.

    "text = to_lower( text ).

    text = to_lower( text ).
    text = replace( val = text sub = '\n' with = | | occ = 0 ).
    text = replace( val = text sub = '\t' with = | | occ = 0 ).
    text = replace( val = text sub = ',' with = | | occ = 0 ).
    text = replace( val = text sub = '-' with = | | occ = 0 ).
    text  = replace( val = text regex = '[^a-z0-9 ]' with = '' occ = 0 ).


    Data: it_words type table of string,
          wa_words like line of it_words,
          shortFrm type string value ''.

    Data: word type string value ''.

    SPLIT text at space into table it_words.

    LOOP at it_words into wa_words.

      if wa_words is initial.
        continue.
      endif.



     word = wa_words.
     word =  word+0(1).
     shortFrm = shortFrm && word.

     clear word.
     clear wa_words.

    endloop.

    acronym = to_upper( shortfrm ).
  ENDMETHOD.
ENDCLASS.
