CLASS zcl_itab_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
           RETURNING VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
           IMPORTING initial_data TYPE itab_data_type
           RETURNING VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_itab_basics IMPLEMENTATION.

  METHOD fill_itab.
    DATA ls_row TYPE initial_type.

    ls_row-group = 'A'. ls_row-number = 10. ls_row-description = 'Group A-2'. APPEND ls_row TO initial_data.
    ls_row-group = 'B'. ls_row-number =  5. ls_row-description = 'Group B'.   APPEND ls_row TO initial_data.
    ls_row-group = 'A'. ls_row-number =  6. ls_row-description = 'Group A-1'. APPEND ls_row TO initial_data.
    ls_row-group = 'C'. ls_row-number = 22. ls_row-description = 'Group C-1'. APPEND ls_row TO initial_data.
    ls_row-group = 'A'. ls_row-number = 13. ls_row-description = 'Group A-3'. APPEND ls_row TO initial_data.
    ls_row-group = 'C'. ls_row-number = 500. ls_row-description = 'Group C-2'. APPEND ls_row TO initial_data.
  ENDMETHOD.

  METHOD add_to_itab.
    updated_data = initial_data.

    DATA ls_new TYPE initial_type.
    ls_new-group = 'A'.
    ls_new-number = 19.
    ls_new-description = 'Group A-4'.

    APPEND ls_new TO updated_data.
  ENDMETHOD.

  METHOD sort_itab.
    updated_data = initial_data.

    SORT updated_data BY group ASCENDING number DESCENDING.
  ENDMETHOD.

  METHOD search_itab.
    DATA lv_index TYPE i VALUE 1.
    result_index = 0.

    LOOP AT initial_data INTO DATA(ls_row).
      IF ls_row-number = 6.
        result_index = lv_index.
        EXIT.
      ENDIF.
      lv_index = lv_index + 1.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
