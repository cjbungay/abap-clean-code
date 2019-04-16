*&---------------------------------------------------------------------*
*& Report ycc_divider
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_divider.

class lcl_class definition
  final
  create public .

public section.

protected section.
    methods my_long_function.
private section.
ENDCLASS.



CLASS lcl_class IMPLEMENTATION.
    method my_long_function.
*        lots
*        of
*        code

        "- Start search for available concert tickets.

*        lots
*        of
*        concert
*        search
*        code

        "- End of concert ticket search.

*        lots
*        more
*        code

        "Need comments to divide function sections? Refactor!
    endmethod.
ENDCLASS.
