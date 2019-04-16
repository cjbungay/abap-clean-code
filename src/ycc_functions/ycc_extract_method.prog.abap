*&---------------------------------------------------------------------*
*& Report ycc_extract_method
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_extract_method.

class lcl_extract_method definition
  final
  create public .

public section.
    data if_condition1      type abap_bool value abap_true.
    data if_condition2      type abap_bool value abap_true.
    data while_condition1   type abap_bool.
    data done type abap_bool value abap_true.

    methods do_something.
    methods extract_method_dirty.
    methods extract_method_clean.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_extract_method IMPLEMENTATION.
    method do_something.
        while while_condition1 = abap_false.
            while_condition1 = done.
            write: /'Clean extract method'.
        endwhile.
    endmethod.

    method extract_method_dirty.
        clear while_condition1.

        if if_condition1 = abap_true.
            if if_condition2 = abap_true.
              while while_condition1 = abap_false.
                  while_condition1 = done.
                  write: /'Dirty extract method'.
              endwhile.
            endif.
        endif.
    endmethod.

    method extract_method_clean.
        clear while_condition1.

        if if_condition1 = abap_true.
            if if_condition2 = abap_true.
                do_something( ).
                "like footnotes
            endif.
        endif.
    endmethod.

    method main.
        extract_method_dirty( ).
        extract_method_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_extract_method( )->main( ).
