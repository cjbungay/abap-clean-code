*&---------------------------------------------------------------------*
*& Report ycc_how_many_parameters
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_how_many_parameters.
class lcl_user definition
    final
    create public.

public section.
    methods constructor.
endclass.

class lcl_user implementation.
    method constructor.
        write:/'user created'.
    endmethod.
endclass.

class lcl_how_many_parameters definition
  final
  create public .

public section.
    methods save_user_dirty
        importing
            i_user type ref to lcl_user
            i_send_email type abap_bool
            i_email_format type i
            i_print_report type abap_bool
            i_send_bill type abap_bool.
    methods save_user_clean importing i_user type ref to lcl_user.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_how_many_parameters IMPLEMENTATION.

    method save_user_dirty.
        write: /'Dirty save user method'.
    endmethod.

    method save_user_clean.
        write: /'Clean save user method'.
    endmethod.

    method main.
      data(user) = new lcl_user( ).

      save_user_dirty( i_user = user i_send_email = abap_true i_email_format = 1 i_print_report = abap_false i_send_bill = abap_false  ).
      save_user_clean( user ).
      "strive for 0-2 parameters
      "easier to understand
      "easier to test
      "helps assure function does on thing
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_how_many_parameters( )->main( ).
