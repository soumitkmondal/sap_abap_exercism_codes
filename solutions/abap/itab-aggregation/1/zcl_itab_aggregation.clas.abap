CLASS zcl_itab_aggregation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_itab_aggregation IMPLEMENTATION.
  METHOD perform_aggregation.
    " add solution here
    Data: wa_initialType type initial_numbers_type,
          wa_initialType1 type initial_numbers_type,
          wa_data type aggregated_data_type.

    loop at initial_numbers into wa_initialType.
      loop at initial_numbers into wa_initialType1 where group = wa_initialType-group.
        
        wa_data-group = wa_initialType1-group.
        
        if wa_initialtype1-number > wa_data-max.
          wa_data-max = wa_initialtype1-number.
       ENDIF.
       
       wa_data-sum = wa_data-sum + wa_initialtype1-number.
       wa_data-count = wa_data-count + 1.
       
       if wa_initialtype1-number < wa_data-min.
         wa_data-min = wa_initialtype1-number.
       elseif wa_data-min = 0.
       wa_data-min = wa_initialtype1-number.
       
       endif.
    ENDLOOP.
    
    if line_exists( aggregated_data[ group = wa_initialtype-group ] ).
      
    else.
      wa_data-average = wa_data-sum / wa_data-count.
      append wa_data to aggregated_data.
    endif.
    clear wa_data.
    
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
