*&---------------------------------------------------------------------*
*& Report ycc_defect_log
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

REPORT ycc_defect_log.

data(first_name) = 'Jimmy'.

*DEFECT #5274 DA 12/20/2018
*We weren't checking for null here.
if first_name is not initial.
    "code continues....
endif.

*- Change metadata belongs in source control.
*- A well written book doesn’t need to be covered in author notes.
