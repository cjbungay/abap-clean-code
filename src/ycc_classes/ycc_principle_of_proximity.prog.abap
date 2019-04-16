*&---------------------------------------------------------------------*
*& Report ycc_principle_of_proximity
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_principle_of_proximity.
class lcx_speaker_invalid definition
inheriting from cx_static_check.
endclass.

class lcx_static_check definition
inheriting from cx_static_check.
endclass.

class lcl_sessions definition
final
create public.

public section.
    methods count returning value(r_count) type i.
endclass.

class lcl_sessions implementation.
    method count.
    endmethod.
endclass.


class lcl_principle_of_proximity definition
  final
  create public .

public section.
    methods constructor.
private section.
    data first_name type string.
    data last_name type string.
    data email type string.
    data sessions type ref to lcl_sessions.

    methods validate_registration raising lcx_speaker_invalid.
    methods validate_data raising lcx_static_check.
    methods speaker_meets_requirements returning value(r_meets_requirements) type abap_bool.
    methods approve_sessions.
    methods is_exceptional_on_paper returning value(r_exceptional) type abap_bool.
    methods obvious_red_flags returning value(r_red_flags) type abap_bool.
ENDCLASS.



CLASS lcl_principle_of_proximity IMPLEMENTATION.
    method constructor.
        create object sessions.
    endmethod.
*    - Strive to make code read top to bottom when possible
*    - Keep related actions together
    method validate_registration.
        validate_data( ).

        if not speaker_meets_requirements( ).
            raise exception type lcx_speaker_invalid.
        endif.

        approve_sessions( ).
    endmethod.

    method validate_data.
        if first_name is initial. raise exception type lcx_static_check. endif.
        if last_name is initial. raise exception type lcx_static_check. endif.
        if email is initial. raise exception type lcx_static_check. endif.
        if sessions->count( ) = 0. raise exception type lcx_static_check. endif.
    endmethod.

    method speaker_meets_requirements.
        r_meets_requirements = xsdbool( is_exceptional_on_paper( ) or not obvious_red_flags( ) ).
    endmethod.

    method approve_sessions.
    endmethod.

    method is_exceptional_on_paper.
    endmethod.

    method obvious_red_flags.
    endmethod.
ENDCLASS.
