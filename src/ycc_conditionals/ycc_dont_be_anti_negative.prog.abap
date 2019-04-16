*&---------------------------------------------------------------------*
*& Report ycc_dont_be_anti_negative
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_dont_be_anti_negative.

class lcl_dont_be_anti_negative definition
  final
  create public .

public section.
    data cash_in_wallet type p decimals 2 value '10.00'.
    methods is_not_logged_in returning value(not_logged_in) type abap_bool.
    methods is_logged_in returning value(logged_in) type abap_bool.
    methods logged_in_dirty.
    methods logged_in_clean.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_dont_be_anti_negative IMPLEMENTATION.
    method is_not_logged_in.
        not_logged_in = abap_false.
    endmethod.

    method is_logged_in.
        logged_in = abap_true.
    endmethod.

    method logged_in_dirty.
        if not is_not_logged_in( ).
            write: /'Dirty dont be anti-negative'.
        endif.
    endmethod.

    method logged_in_clean.
*        use positive conditionals!
        if is_logged_in( ).
            write: /'Clean dont be anti-negative'.
        endif.
    endmethod.

    method main.
        logged_in_dirty( ).
        logged_in_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_dont_be_anti_negative( )->main( ).
