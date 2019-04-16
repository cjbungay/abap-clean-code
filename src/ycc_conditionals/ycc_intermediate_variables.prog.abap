*&---------------------------------------------------------------------*
*& Report ycc_intermediate_variables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_intermediate_variables.

class lcl_intermediate_variables definition
  final
  create public .

public section.
    constants min_retirement_age type i value 55.
    constants min_pension_employment_years type i value 10.

    types: begin of employee_type,
             age type i,
             years_employed type i,
             is_retired type abap_bool,
           end of employee_type.

    data employee type employee_type.

    methods intermediate_variables_dirty returning value(eligible_for_pension) type abap_bool.
    methods intermediate_variables_clean returning value(eligible_for_pension) type abap_bool.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_intermediate_variables IMPLEMENTATION.
    method intermediate_variables_dirty.
        if employee-age > 55
        and employee-years_employed > 10 "What question is this trying to answer?
        and employee-is_retired = 'X'.
            eligible_for_pension = abap_true.
            write: /'Dirty intermediate variables'.
        endif.
    endmethod.

    method intermediate_variables_clean.
        eligible_for_pension = xsdbool( employee-age > min_retirement_age
                                          and employee-years_employed > min_pension_employment_years
                                          and employee-is_retired = abap_true ).
        write: /'Clean intermediate variables'.
    endmethod.

    method main.
        intermediate_variables_dirty( ).
        intermediate_variables_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_intermediate_variables( )->main( ).
