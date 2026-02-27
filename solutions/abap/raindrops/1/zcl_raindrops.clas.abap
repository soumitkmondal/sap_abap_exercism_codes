CLASS zcl_raindrops DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS raindrops
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_raindrops IMPLEMENTATION.

  METHOD raindrops.

    DATA(lv_res3) = input MOD 3.
    DATA(lv_res5) = input MOD 5.
    DATA(lv_res7) = input MOD 7.

    Data lv_fres type string value ''.

    IF lv_res3 IS INITIAL.
      DATA(strng1) = 'Pling'.
      CONCATENATE lv_fres strng1 INTO lv_fres.
    ENDIF.

    IF lv_res5 IS INITIAL.
      DATA(strng2) = 'Plang'.
      CONCATENATE lv_fres strng2 INTO lv_fres.
    ENDIF.

    IF lv_res7 IS INITIAL.
      DATA(strng3) = 'Plong'.
      CONCATENATE lv_fres strng3 INTO lv_fres.
    ENDIF.

    IF lv_res3 IS NOT INITIAL AND lv_res5 IS NOT INITIAL AND lv_res7 IS NOT INITIAL.
      lv_fres = | { input } |.
    ENDIF.

    result = lv_fres.

  ENDMETHOD.
ENDCLASS.
