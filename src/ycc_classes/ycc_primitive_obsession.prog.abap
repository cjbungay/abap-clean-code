*&---------------------------------------------------------------------*
*& Report ycc_primitive_obsession
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_primitive_obsession.
class lcl_user definition
    final
    create public.

public section.
    methods constructor.

private section.
    data first_name type string.
    data last_name type string.
    data state type string.
    data zip type string.
    data eye_color type string.
    data phone type string.
    data fax type string.
    data maiden_name type string.
endclass.

class lcl_user implementation.
    method constructor.
        write:/'user created'.
    endmethod.
endclass.

class lcl_primitive_obsession definition
  final
  create public .

public section.
    methods save_user_dirty
        importing
          i_first_name type string
          i_last_name type string
          i_state type string
          i_zip type string
          i_eye_color type string
          i_phone type string
          i_fax type string
          i_maiden_name type string.

    methods save_user_clean importing i_user type ref to lcl_user.
*    1.Helps reader conceptualize
*    2.Implicit -> Explicit
*    3.Encapsulation
*    4.Aids maintenance
*    5.Easy to find references
protected section.
private section.
ENDCLASS.



CLASS lcl_primitive_obsession IMPLEMENTATION.
    method save_user_dirty.
    endmethod.

    method save_user_clean.
    endmethod.
ENDCLASS.
