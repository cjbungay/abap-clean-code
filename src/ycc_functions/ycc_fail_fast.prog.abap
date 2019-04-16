*&---------------------------------------------------------------------*
*& Report ycc_fail_fast
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_fail_fast.

class lcx_static_check definition
inheriting from cx_static_check.
endclass.

class lcl_fail_fast definition
  final
  create public .

public section.
    methods is_null_or_whitespace
        importing i_string type string
        returning value(r_is) type abap_bool.
    methods register_user_dirty
        importing i_username type string
                  i_password type string
        raising lcx_static_check.
    methods register_user_clean
        importing i_username type string
                  i_password type string
        raising lcx_static_check.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_fail_fast IMPLEMENTATION.
    method is_null_or_whitespace.
        r_is = xsdbool( i_string is initial or i_string ca space ).
    endmethod.

    method register_user_dirty.
        if not is_null_or_whitespace( i_username ).
            if not is_null_or_whitespace( i_password ).
                "register user.
                write: /'Dirty fail fast method register user'.
            else.
                raise exception type lcx_static_check.
            endif.
        else.
            raise exception type lcx_static_check.
        endif.
    endmethod.

    method register_user_clean.
        "guard clauses
        if is_null_or_whitespace( i_username ). raise exception type lcx_static_check. endif.
        if is_null_or_whitespace( i_password ). raise exception type lcx_static_check. endif.

        "register user.
        write: /'Clean fail fast method register user'.
    endmethod.

    method main.
        try.
          register_user_dirty( i_username = 'DirtyUser' i_password = 'DirtyPassword ' ).
          register_user_clean( i_username = 'CleanUser' i_password = 'CleanPassword ' ).
        catch lcx_static_check.
            return.
        endtry.
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_fail_fast( )->main( ).
