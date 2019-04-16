*&---------------------------------------------------------------------*
*& Report ycc_mayfly_variables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_mayfly_variables.

class lcl_mayfly_variables definition
  final
  create public .

public section.
    methods something_is_true returning value(r_is_true) type abap_bool.
    methods mayfly_dirty.
    methods mayfly_clean.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_mayfly_variables IMPLEMENTATION.
    method something_is_true.
        r_is_true = abap_true.
    endmethod.

    method mayfly_dirty.
*        Would you read this?
*        Bobby - Boy from Chicago
*        Sandy – Girl from New York
*        Tom – Man from Boston Etc...
*        Once upon a time…
*        Without context, it’s noise and mental
        data a type abap_bool.
        data b type i value 0.
        data c type string.
        data d type abap_bool.

        "body continues
        "...
        "...
        "...
        "...

        a = something_is_true( ).

        if a = abap_true.
            c = 'string'.

            if strlen( c ) > b.
              "body continues
              "...
              "...
              "...
              "...

              d = xsdbool( substring( val = c off = 0 len = 3 ) = b  ).
              write: /'Dirty mayfly variables method'.
            endif.
        endif.
    endmethod.

    method mayfly_clean.
        "body
        "...
        "...
        "...
        "...

        if something_is_true( ).
            "initialize variables just in time.
            "Do one thing.
            data(c) = 'string'.
            data(b) = 0.
            if strlen( c ) > b.
              "body continues
              "...
              "...
              "...
              "...

              data(d) = xsdbool( substring( val = c off = 0 len = 3 ) = 0  ).
              write: /'Clean mayfly variables method'.
            endif.
        endif.
    endmethod.

    method main.
      mayfly_dirty( ).
      mayfly_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_mayfly_variables( )->main( ).
