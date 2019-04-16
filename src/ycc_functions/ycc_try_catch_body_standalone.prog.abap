*&---------------------------------------------------------------------*
*& Report ycc_try_catch_body_standalone
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_try_catch_body_standalone.

class lcx_static_check definition
inheriting from cx_static_check.
endclass.

class lcl_try_catch_body_standalone definition
  final
  create public .

public section.
    methods try_catch_dirty.
    methods try_catch_clean.
    methods save_the_planet raising lcx_static_check.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_try_catch_body_standalone IMPLEMENTATION.
    method save_the_planet.
        "many
        "lines
        "of
        "complicated
        "and
        "verbose
        "logic
        "here
    endmethod.

    method try_catch_dirty.
        try.
          "many
          "lines
          "of
          "complicated
          "and
          "verbose
          "logic
          "here
          write: /'Dirty try/catch method'.
        catch lcx_static_check.
            "do something here.
        endtry.
    endmethod.

    method try_catch_clean.
        try.
            save_the_planet( ).
            write: /'Clean try/catch method'.
        catch lcx_static_check.
            "do something here.
        endtry.
    endmethod.

    method main.
        try_catch_dirty( ).
        try_catch_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_try_catch_body_standalone( )->main( ).
