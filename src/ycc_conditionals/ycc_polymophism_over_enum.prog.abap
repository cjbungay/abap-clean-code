*&---------------------------------------------------------------------*
*& Report ycc_polymophism_over_enum
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_polymophism_over_enum.

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
    data first_name type string.
    data last_name type string.
    data status type status_enum.
    data account_balance type i.

    methods constructor importing i_status type status_enum.
endclass.

class lcl_user implementation.
    method constructor.
        status = i_status.
    endmethod.
endclass.

interface lif_user.
  data first_name type string.
  data last_name type string.
  data status type status_enum.
  data account_balance type i.

  methods login.
endinterface.

class lcl_active_user definition
  final
  create public .

  public section.
    interfaces lif_user.
    aliases login for lif_user~login.


endclass.

class lcl_active_user implementation.
    method login.
        write: / 'Clean active user'.
    endmethod.
endclass.

class lcl_inactive_user definition
  final
  create public .

  public section.
    interfaces lif_user.
    aliases login for lif_user~login.


endclass.

class lcl_inactive_user implementation.
    method login.
        write: / 'Clean inactive user'.
    endmethod.
endclass.

class lcl_locked_user definition
  final
  create public .

  public section.
    interfaces lif_user.
    aliases login for lif_user~login.

endclass.

class lcl_locked_user implementation.
    method login.
        write: / 'Clean locked user'.
    endmethod.
endclass.

class lcl_polymophism_over_enum definition
  final
  create public .

public section.
    methods login_user_dirty importing i_user type ref to lcl_user.
    methods login_user_clean importing i_user type ref to lif_user.
    methods main.
protected section.
private section.
ENDCLASS.

CLASS lcl_polymophism_over_enum IMPLEMENTATION.
    method login_user_dirty.
        case i_user->status.
            when status_type-active.
                write: / 'Dirty active user'.
            when status_type-inactive.
                write: / 'Dirty inactive user'.
            when status_type-locked.
                write: / 'Dirty locked user'.
            when others.
        endcase.
    endmethod.

    method login_user_clean.
        i_user->login( ).
    endmethod.

    method main.
        login_user_dirty( new lcl_user( status_type-active ) ).
        login_user_dirty( new lcl_user( status_type-inactive ) ).
        login_user_dirty( new lcl_user( status_type-locked ) ).
        login_user_clean( new lcl_active_user( ) ).
        login_user_clean( new lcl_inactive_user( ) ).
        login_user_clean( new lcl_locked_user( ) ).
    endmethod.
ENDCLASS.

start-of-selection.

new lcl_polymophism_over_enum( )->main( ).
