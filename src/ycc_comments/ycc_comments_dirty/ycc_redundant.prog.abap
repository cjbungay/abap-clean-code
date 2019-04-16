*&---------------------------------------------------------------------*
*& Report ycc_redundant
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_redundant.
"Redundant Comments.

*Assume your reader can read.
*Don’t repeat yourself.

class lcl_user definition
  final
  create public .

public section.
    "Default Constructor.
    methods constructor.
protected section.
    "Calculate Total Charges.
    methods calculate_total_charges.
private section.
ENDCLASS.



CLASS lcl_user IMPLEMENTATION.
    method constructor.
    endmethod.

    method calculate_total_charges.
    endmethod.
ENDCLASS.

start-of-selection.

data(i) = 1." Set i = 1.

data(cory) = new lcl_user( ). "Instantiate a new user.
