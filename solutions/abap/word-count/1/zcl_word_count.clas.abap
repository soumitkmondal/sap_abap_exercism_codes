CLASS zcl_word_count DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF return_structure,
        word  TYPE string,
        count TYPE i,
      END OF return_structure,
      return_table TYPE STANDARD TABLE OF return_structure WITH KEY word.
    METHODS count_words
      IMPORTING
        !phrase       TYPE string
      RETURNING
        VALUE(result) TYPE return_table .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_word_count IMPLEMENTATION.

    METHOD count_words.
      IF phrase IS NOT INITIAL.

        DATA(text) = phrase.

        "TRANSLATE text TO LOWER CASE.
        text = to_lower( text ).
        text = replace( val = text sub = '\n' with = | | occ = 0 ).
        text = replace( val = text sub = '\t' with = | | occ = 0 ).
        text = replace( val = text sub = ',' with = | | occ = 0 ).
        text  = replace( val = text regex = '[^a-z0-9 ]' with = '' occ = 0 ).

        DATA: it_words  TYPE TABLE OF string,
              wa_words  LIKE LINE OF it_words,
              wa_result LIKE LINE OF result.

        SPLIT text AT space INTO TABLE it_words.

        LOOP AT it_words INTO wa_words.

          READ TABLE result INTO wa_result WITH KEY word = wa_words.

          IF wa_words IS INITIAL.
            CONTINUE.
          ENDIF.

          IF sy-subrc = 0.

            wa_result-count = wa_result-count + 1.
            MODIFY TABLE result FROM wa_result.
          ELSE.

            wa_result-word = wa_words.
            wa_result-count = 1.

            INSERT wa_result INTO TABLE result.

          ENDIF.
        ENDLOOP.
      ENDIF.
    ENDMETHOD.
ENDCLASS.
