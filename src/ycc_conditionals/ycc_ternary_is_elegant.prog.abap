*&---------------------------------------------------------------------*
*& Report ycc_ternary_is_elegant
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_ternary_is_elegant.

class lcl_ternary_is_elegant definition
  final
  create public .

public section.
    methods is_speaker returning value(speaker) type abap_bool.
    methods ternary_dirty.
    methods ternary_clean.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_ternary_is_elegant IMPLEMENTATION.
    method is_speaker.
        speaker = abap_false.
    endmethod.

    method ternary_dirty.
        data registration_fee type i.

        if is_speaker( ).
            registration_fee = 0.
        else.
            registration_fee = 50.
        endif.

        write: /'Dirty ternary is elegant'.
    endmethod.

    method ternary_clean.
        data(registration_fee) = cond #(  when is_speaker( ) then 0 else 50 ).
*       don't repeat yourself.
        write: /'Clean ternary is elegant'.
    endmethod.

    method main.
        ternary_dirty( ).
        ternary_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_ternary_is_elegant( )->main( ).
