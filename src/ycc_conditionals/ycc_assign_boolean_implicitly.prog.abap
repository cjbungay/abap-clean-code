*&---------------------------------------------------------------------*
*& Report ycc_assign_boolean_implicitly
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_assign_boolean_implicitly.

class lcl_assign_boolean_implicitly definition
  final
  create public .

public section.
    data cash_in_wallet type p decimals 2 value '10.00'.
    methods assign_boolean_dirty.
    methods assign_boolean_clean.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_assign_boolean_implicitly IMPLEMENTATION.
    method assign_boolean_dirty.
        data going_to_lunch type abap_bool.

        if cash_in_wallet > '6.00'.
            going_to_lunch = abap_true.
        else.
            going_to_lunch = abap_false.
        endif.

        write: /'Dirty assign boolean implicitly'.
    endmethod.

    method assign_boolean_clean.
        data(going_to_lunch) = xsdbool( cash_in_wallet > '6.00' ).
*        1.Fewer lines
*        2.No separate initialization
*        3.No repetition
*        4.Reads like speech
        write: /'Clean assign boolean implicitly'.
    endmethod.

    method main.
        assign_boolean_dirty( ).
        assign_boolean_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_assign_boolean_implicitly( )->main( ).
