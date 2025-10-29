CLASS zcl_triangle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      is_equilateral
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_isosceles
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_scalene
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS: is_triangle
      IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool.
ENDCLASS.


CLASS zcl_triangle IMPLEMENTATION.
  METHOD is_triangle.
    IF ( ( side_a + side_b ) ge side_c and ( side_b + side_c ) ge side_a  and ( side_c + side_a ) ge side_b ).
      result = abap_true.
    endif.
    IF ( side_a = 0 OR side_b = 0 OR side_c = 0 ).
      result = abap_false.
    endif.
  ENDMETHOD.

  METHOD is_equilateral.
    "Implement solution
    if ( NOT is_triangle( side_a = side_a side_b = side_b side_c = side_c ) ).
      RAISE EXCEPTION type cx_parameter_invalid.
    endif.
    if ( side_a = side_b and side_c  = side_a ).
      result = abap_true.
    endif.
  ENDMETHOD.

  METHOD is_isosceles.
    if ( NOT is_triangle( side_a = side_a side_b = side_b side_c = side_c ) ).
      RAISE EXCEPTION type cx_parameter_invalid.
    endif.
    if ( side_a = side_b or side_b = side_c or side_a = side_c ).
      result = abap_true.
    endif.
  ENDMETHOD.

  METHOD is_scalene.
    if ( NOT is_triangle( side_a = side_a side_b = side_b side_c = side_c ) ).
      RAISE EXCEPTION type cx_parameter_invalid.
    endif.
    if ( side_a <> side_b and side_b <> side_c and side_a <> side_c ).
      result = abap_true.
    endif.
  ENDMETHOD.
ENDCLASS.
