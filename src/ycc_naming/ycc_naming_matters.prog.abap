*&---------------------------------------------------------------------*
*& Report ycc_naming_matters
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_naming_matters.

class lcl_NAMING definition
  final
  create public .

public section.
    data login type abap_bool.
    data logged_in type abap_bool.
    types tyt_numbers type standard table of i with default key.
    methods dirty.
    methods clean.
    methods boolean_dirty.
    methods boolean_clean.
    methods main.

protected section.
private section.
ENDCLASS.



CLASS lcl_NAMING IMPLEMENTATION.
    method dirty.
        data(p) = value tyt_numbers(  ( 5 ) ( 10 ) ( 12 ) ).
        data(t) = 0.

        loop at p assigning field-symbol(<i>).
            add <i> to t.
        endloop.
    endmethod.

    method clean.
        data(prices) = value tyt_numbers(  ( 5 ) ( 10 ) ( 12 ) ).
        data(total) = 0.

        loop at prices assigning field-symbol(<price>).
            add <price> to total.
        endloop.
    endmethod.

    method boolean_dirty.
        if login = abap_true.
            "do something
        endif.
    endmethod.

    method boolean_clean.
        if logged_in = abap_true.
            "do something
        endif.
    endmethod.

    method main.
        dirty( ).
        clean( ).
        boolean_dirty( ).
        boolean_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_naming( )->main( ).
