*&---------------------------------------------------------------------*
*& Report ycc_intent
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_intent.
"Intent Comments.

*Instead, clarify intent in code:
*- Improved function naming
*- Intermediate variable
*- Constant or enum
*- Extract conditional to function

types basetype type i.
types: begin of enum status_enum structure status_type base type basetype,
        inactive value 1,
        active value 2,
        locked value 3,
        none value is initial,
       end of enum status_enum structure status_type.

class lcl_user definition
  final
  create public .

  public section.
    data dirty_status type i.
    data clean_status type status_enum.
endclass.

class lcl_user implementation.
endclass.

start-of-selection.
data(user1) = new lcl_user( ).

"Assure user's account is deactivated.
if user1->dirty_status = 1.
endif.

if user1->clean_status = status_type-inactive.
endif.
