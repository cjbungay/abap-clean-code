*&---------------------------------------------------------------------*
*& Report ycc_encap_complex_conditionals
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_encap_complex_conditionals.

class lcl_encap_complex_conditionals definition
  final
  create public .

public section.
    data is_active type abap_bool value abap_true.
    data is_admin type abap_bool value abap_true.
    data file_extension type string value 'mp4'.

    methods valid_file_request
        importing
            i_file_extension type string
            i_is_Active_file type abap_bool optional
            i_is_Admin type abap_bool optional
        returning
            value(r_valid) type abap_bool.
    methods complex_conditionals_dirty.
    methods complex_conditionals_clean..
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_encap_complex_conditionals IMPLEMENTATION.
    method valid_file_request.
        r_valid = xsdbool( ( i_file_extension = 'mp4' or
             i_file_extension = 'mpg' or
             i_file_extension = 'avi' ) and
           ( i_is_Active_file = abap_true or i_is_admin = abap_true ) ).
    endmethod.

    method complex_conditionals_dirty.
        "Check for valid file extensions.  Confirm admin or active.
        if ( file_extension = 'mp4' or
             file_extension = 'mpg' or
             file_extension = 'avi' ) and
           ( is_Active = abap_true or is_admin = abap_true ).
            write: /'Dirty complex conditionals'.
        endif.
    endmethod.

    method complex_conditionals_clean.
        "Principle: Favor expressive code over comments
        if valid_file_request( i_file_extension = file_extension i_is_active_file = is_Active ).
            write: /'Clean complex conditionals'.
        endif.
    endmethod.

    method main.
        complex_conditionals_dirty( ).
        complex_conditionals_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_encap_complex_conditionals( )->main( ).
