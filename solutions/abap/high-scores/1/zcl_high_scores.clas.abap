CLASS zcl_high_scores DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS constructor
      IMPORTING
        scores TYPE integertab.

    METHODS list_scores
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS latest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personalbest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personaltopthree
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA scores_list TYPE integertab.

ENDCLASS.


CLASS zcl_high_scores IMPLEMENTATION.

  METHOD constructor.
    me->scores_list = scores.
  ENDMETHOD.

  METHOD list_scores.
    " add solution here
result = scores_list.

  ENDMETHOD.

  METHOD latest.
    " add solution here
    
    DATA(first_val) = scores_list[ lines( scores_list ) ].

    result = first_val.

  ENDMETHOD.

  METHOD personalbest.
    " add solution here

    LOOP AT scores_list ASSIGNING FIELD-SYMBOL(<score>).
      IF <score> > result.
        result = <score>.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD personaltopthree.
    " add solution here

    DATA(scores) = scores_list.
    SORT scores DESCENDING.

    LOOP AT scores ASSIGNING FIELD-SYMBOL(<score>).
      IF sy-tabix > 3.
        EXIT.
      ENDIF.
      APPEND <score> TO result.
    ENDLOOP.

  ENDMETHOD.


ENDCLASS.
