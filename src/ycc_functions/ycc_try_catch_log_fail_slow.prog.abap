*&---------------------------------------------------------------------*
*& Report ycc_try_catch_log_fail_slow
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_try_catch_log_fail_slow.

class lcx_static_check definition
inheriting from cx_static_check.
endclass.

class lcl_try_catch_log_fail_slow definition
  final
  create public .

public section.
    methods register_speaker raising lcx_static_check.
    methods email_speaker.
    methods log_error importing i_exception type ref to lcx_static_check.
    methods try_catch_log_dirty.
    methods try_catch_log_clean.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_try_catch_log_fail_slow IMPLEMENTATION.
    method register_speaker.
        "register speaker.
    endmethod.

    method email_speaker.
        "email speaker.
    endmethod.

    method log_error.
        "log error.
    endmethod.

    method try_catch_log_dirty.
        try.
            register_speaker( ).
        catch lcx_static_check into data(error).
            log_error( error ).
        endtry.

        email_speaker( ).
        write: /'Dirty try/catch/log'.
    endmethod.

    method try_catch_log_clean.
        register_speaker( ).
        email_speaker( ).

        write: /'Clean try/catch/log'.
    endmethod.

    method main.
          try_catch_log_dirty( ).
          try_catch_log_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_try_catch_log_fail_slow( )->main( ).
