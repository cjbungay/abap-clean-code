*&---------------------------------------------------------------------*
*& Report ycc_watch_for_flag_arguments
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_watch_for_flag_arguments.
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

class lcl_watch_for_flag_arguments definition
  final
  create public .

public section.
    methods email_user importing i_user type ref to lcl_user.
    methods save_user_dirty
        importing
            i_user type ref to lcl_user
            i_email_user type abap_bool.
    methods save_user_clean importing i_user type ref to lcl_user.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_watch_for_flag_arguments IMPLEMENTATION.
    method email_user.
        "email user.
    endmethod.

    method save_user_dirty.
        "save user.

        if i_email_user = abap_true.
            "email user.
        endif.

        write: /'Dirty save user method'.
    endmethod.

    method save_user_clean.
        "save user.
        write: /'Clean save user method'.
    endmethod.

    method main.
      data(user) = new lcl_user( ).

      "a sign the function is doing two things.
      save_user_dirty( i_user = user i_email_user = abap_true  ).

      save_user_clean( user ).
      email_user( user ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_watch_for_flag_arguments( )->main( ).
