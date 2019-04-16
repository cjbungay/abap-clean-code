*&---------------------------------------------------------------------*
*& Report ycc_return_early
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_return_early.

class lcl_return_early definition
  final
  create public .

public section.
    constants min_username_length type i value 6.
    constants max_username_length type i value 25.

    methods contains_cursewords importing i_username type string returning value(r_contains) type abap_bool.
    methods is_unique_username importing i_username type string returning value(r_unique) type abap_bool.
    methods is_alpha_numeric importing i_username type string returning value(r_alpha_numeric) type abap_bool.
    methods is_valid_username_dirty importing i_username type string returning value(r_valid) type abap_bool.
    methods is_valid_username_clean importing i_username type string returning value(r_valid) type abap_bool.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_return_early IMPLEMENTATION.
    method contains_cursewords.
        r_contains = xsdbool( contains( val = to_upper( i_username ) sub = 'BAD' ) ).
    endmethod.

    method is_unique_username.
        r_unique = abap_true.
    endmethod.

    method is_alpha_numeric.
        if xsdbool( contains_any_not_of( val = to_upper( i_username ) sub = sy-abcde ) AND
                    contains_any_not_of( val = i_username  sub = '0123456789'  ) ) = abap_false.
            r_alpha_numeric = abap_true.
        endif.
    endmethod.

    method is_valid_username_dirty.
        if strlen( i_username ) >= min_username_length.
            if strlen( i_username ) <= max_username_length.
                if is_alpha_numeric( i_username ).
                    if not contains_cursewords( i_username ).
                        write: /'Dirty return early method valid username'.
                        r_valid = abap_true.
                    endif.
                endif.
            endif.
        endif.
    endmethod.

    method is_valid_username_clean.
        if strlen( i_username ) < min_username_length. return. endif.

        if strlen( i_username ) > max_username_length. return. endif.

        if not is_alpha_numeric( i_username ). return. endif.

        if contains_cursewords( i_username ). return. endif.

*        Use a return when it enhances readability... In certain routines,
*        once you know the answer…not returning immediately means that you
*        have to write more code.
*        Steve McConnell, “Code Complete”

        write: /'Clean return early method valid username'.
        r_valid = abap_true.
    endmethod.

    method main.
        data(valid_dirty) = is_valid_username_dirty( 'DirtyUser' ).
        data(valid_clean) = is_valid_username_clean( 'CleanUser').
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_return_early( )->main( ).
