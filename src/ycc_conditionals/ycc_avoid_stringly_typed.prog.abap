*&---------------------------------------------------------------------*
*& Report ycc_avoid_stringly_typed
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_avoid_stringly_typed.

class lcl_avoid_stringly_typed definition
  final
  create public .

public section.
    types basetype type c length 2.
    types: begin of enum employee_type_enum structure employee_type base type basetype,
            manager value 'MG',
            director value 'DR',
            vice_president value 'VP',
            analyst value 'AN',
            none value is initial,
           end of enum employee_type_enum structure employee_type.

    data employees_type type string value 'manager'.

    types: begin of employees,
            type type employee_type_enum,
           end of employees.

    data employee type employees.

    methods constructor.
    methods avoid_stringly_typed_dirty.
    methods avoid_stringly_typed_clean.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_avoid_stringly_typed IMPLEMENTATION.
    method constructor.
        employee-type = employee_type-manager.
    endmethod.

    method avoid_stringly_typed_dirty.
        if employees_type = 'manager'.
            write: /'Dirty avoid stringly typed'.
        endif.
    endmethod.

    method avoid_stringly_typed_clean.
*        1.Strongly typed =>No typos
*        2.Intellisense support
*        3.Documents states
*        4.Searchable
        if employee-type = employee_type-manager.
            write: /'Clean avoid stringly typed'.
        endif.
    endmethod.

    method main.
        avoid_stringly_typed_dirty( ).
        avoid_stringly_typed_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_avoid_stringly_typed( )->main( ).
