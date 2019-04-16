*&---------------------------------------------------------------------*
*& Report ycc_table_driven_methods
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_table_driven_methods.


types: begin of ty_insurance_rate,
        rate_id type i,
        maximum_age type i,
        rate type p decimals 2,
       end of ty_insurance_rate.

types tyt_insurance_rates type standard table of ty_insurance_rate with key rate_id.

data(insurance_rates_table) = value tyt_insurance_rates( ( rate_id = 1 maximum_age = 20 rate = '346.60' )
                                                         ( rate_id = 2 maximum_age = 30 rate = '420.50' )
                                                         ( rate_id = 3 maximum_age = 40 rate = '476.38' )
                                                         ( rate_id = 4 maximum_age = 50 rate = '516.25') ).

class lcl_insurance_repository definition
final
create public.

public section.
    methods constructor.
    methods get_maximum_age
        importing i_age type ty_insurance_rate-maximum_age
        returning value(r_max_age) type ty_insurance_rate-maximum_age.

    methods get_insurance_rate
        importing i_age type ty_insurance_rate-maximum_age
        returning value(r_rate) type ty_insurance_rate-rate.
endclass.

class lcl_insurance_repository implementation.
    method constructor.
        sort insurance_rates_table descending by maximum_age.
    endmethod.

    method get_maximum_age.
     select min( maximum_age )
        from @insurance_rates_table as insurance_rates
        where maximum_age >= @i_age
        into @r_max_age.
*      Examples
*      •Insurance rates
*      •Pricing structures
*      •Complex and dynamic business
    endmethod.

    method get_insurance_rate.
        r_rate = insurance_rates_table[ maximum_age = get_maximum_age( i_age ) ]-rate.
    endmethod.
endclass.

class lcl_table_driven_methods definition
  final
  create public .

public section.
    data age type i value 28.
    methods table_driven_methods_dirty returning value(r_rate) type ty_insurance_rate-rate.
    methods table_driven_methods_clean returning value(r_rate) type ty_insurance_rate-rate..
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_table_driven_methods IMPLEMENTATION.
    method table_driven_methods_dirty.
        if age < 20.
            r_rate = '346.60'.
        elseif age < 30.
            r_rate = '420.50'.
        elseif age < 40.
            r_rate = '476.38'.
        elseif age < 50.
            r_rate = '516.25'.
        endif.

        write: /'Dirty table driven methods'.
    endmethod.

    method table_driven_methods_clean.
         r_rate = new lcl_insurance_repository( )->get_insurance_rate( age ).
*          •Great for dynamic logic
*          •Avoids hard coding
*          •Write less code -Avoids complex data structures
*          •Easily changeable without a code change/app deployment
         write: /'Clean table driven methods'.
    endmethod.

    method main.
        table_driven_methods_dirty( ).
        table_driven_methods_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_table_driven_methods( )->main( ).
