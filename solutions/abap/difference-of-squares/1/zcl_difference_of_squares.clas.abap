CLASS zcl_difference_of_squares DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      ret_difference_of_squares IMPORTING num         TYPE i
                                RETURNING VALUE(diff) TYPE i,
      ret_sum_of_squares        IMPORTING num                   TYPE i
                                RETURNING VALUE(sum_of_squares) TYPE i,
      ret_square_of_sum         IMPORTING num                  TYPE i
                                RETURNING VALUE(square_of_sum) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_difference_of_squares IMPLEMENTATION.
  METHOD ret_difference_of_squares.
    "Implement solution
    data: lv_idx1 type i value 0,
          lv_sum1 type i value 0,
          sum_of_squares1 type i,
          square_of_sum1 type i.
    do num times.
      lv_idx1 = sy-index.
      lv_sum1 = lv_sum1 + lv_idx1 ** 2.
    ENDDO.
    sum_of_squares1 = lv_sum1.

    data: lv_idx2 type i value 0,
          lv_sum2 type i value 0.
    do num times.
      lv_idx2 = sy-index.
      lv_sum2 = lv_sum2 + lv_idx2.
    ENDDO.
    square_of_sum1 = lv_sum2 ** 2.

    diff = square_of_sum1 - sum_of_squares1.
  ENDMETHOD.

  METHOD ret_sum_of_squares.
    "Implement solution
    data: lv_idx type i value 0,
          lv_sum type i value 0.
    do num times.
      lv_idx = sy-index.
      lv_idx = lv_idx ** 2.
      lv_sum = lv_sum + lv_idx.
    ENDDO.
    sum_of_squares = lv_sum.
  ENDMETHOD.

  METHOD ret_square_of_sum.
    "Implement solution
    data: lv_idx type i value 0,
          lv_sum type i value 0.
    do num times.
      lv_idx = sy-index.
      lv_sum = lv_sum + lv_idx.
    ENDDO.
    square_of_sum = lv_sum ** 2.
  ENDMETHOD.
ENDCLASS.
