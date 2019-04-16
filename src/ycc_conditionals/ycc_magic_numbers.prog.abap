*&---------------------------------------------------------------------*
*& Report ycc_magic_numbers
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_magic_numbers.

class lcl_magic_numbers definition
  final
  create public .

public section.
    constants legal_drinking_age type i value 21.
    types basetype type i.
    types: begin of enum status_enum structure status_type base type basetype,
            inactive value 1,
            active value 2,
            none value is initial,
           end of enum status_enum structure status_type.

    data age type i value 22.
    data status_value_clean type status_enum value status_type-active.
    data status_value_dirty type i value 2.

    methods legal_age_dirty.
    methods legal_age_clean.
    methods status_dirty.
    methods status_clean.
    methods main.
protected section.
private section.
ENDCLASS.



CLASS lcl_magic_numbers IMPLEMENTATION.
    method legal_age_dirty.
        if age > 21.
            write: /'Dirty age magic numbers'.
        endif.
    endmethod.

    method legal_age_clean.
*        Which would you rather read?
*        Sally went to the #12 dealer to buy a #19 #515.
*        Sally went to the Ferrari dealer to buy a red Enzo.
        if age > legal_drinking_age.
            write: /'Clean age magic numbers'.
        endif.
    endmethod.

    method status_dirty.
        if status_value_dirty = 2.
            write: /'Dirty status magic numbers'.
        endif.
    endmethod.

    method status_clean.
        if status_value_clean = status_type-active.
            write: /'Clean status magic numbers'.
        endif.
    endmethod.

    method main.
        legal_age_dirty( ).
        legal_age_clean( ).
        status_dirty( ).
        status_clean( ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_magic_numbers( )->main( ).
