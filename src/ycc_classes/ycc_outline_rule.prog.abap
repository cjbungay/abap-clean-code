*&---------------------------------------------------------------------*
*& Report ycc_outline_rule
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_outline_rule.
class lcl_class definition
  final
  create public .

public section.
*    Collapsed code should read like an outline.
*    Strive for multiple layers of abstraction.
    methods h1.
        methods h1_p1.
            methods h1_p1_l1.
        methods h1_p2.
        methods h1_p3.
    methods h2.
        methods h2_p1.
        methods h2_p2.
    methods h3.
        methods h3_p1.
protected section.
private section.
ENDCLASS.



CLASS lcl_class IMPLEMENTATION.
    method h1.
        h1_p1( ).
        h1_p2( ).
        h1_p3( ).
    endmethod.

    method h1_p1.
        h1_p1_l1( ).
    endmethod.

    method h1_p1_l1.
    endmethod.

    method h1_p2.
    endmethod.

    method h1_p3.
    endmethod.

    method h2.
        h2_p1( ).
        h2_p2( ).
    endmethod.

    method h2_p1.
    endmethod.

    method h2_p2.
    endmethod.

    method h3.
        h3_p1( ).
    endmethod.

    method h3_p1.
    endmethod.
ENDCLASS.
