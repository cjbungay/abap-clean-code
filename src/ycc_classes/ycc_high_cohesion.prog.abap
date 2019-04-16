*&---------------------------------------------------------------------*
*& Report ycc_high_cohesion
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ycc_high_cohesion.

*Dirty names:
*WebsiteBO
*Utility
*Common
*MyFunctions
*JimmysObjects
**Manager / *Processor/*Info

"Specific names lead to smaller more cohesive classes.

"Low Cohesion
class lcl_vehicle_low definition
    final
    create public.

public section.
    methods edit_vehicle_options.
    methods update_pricing.
    methods schedule_maintenance.
    methods send_maintenance_reminder.
    methods select_financing.
    methods calculate_monthly_payment.
endclass.

class lcl_vehicle_low implementation.
    method edit_vehicle_options.
    endmethod.

    method update_pricing.
    endmethod.

    method schedule_maintenance.
    endmethod.

    method send_maintenance_reminder.
    endmethod.

    method select_financing.
    endmethod.

    method calculate_monthly_payment.
    endmethod.
endclass.

"High Cohesion
class lcl_vehicle_high definition
    final
    create public.

public section.
    methods edit_vehicle_options.
    methods update_pricing.
endclass.

class lcl_vehicle_high implementation.
    method edit_vehicle_options.
    endmethod.

    method update_pricing.
    endmethod.
endclass.

class lcl_vehicle_maintenance definition
    final
    create public.

public section.
    methods schedule_maintenance.
    methods send_maintenance_reminder.
endclass.

class lcl_vehicle_maintenance implementation.
    method schedule_maintenance.
    endmethod.

    method send_maintenance_reminder.
    endmethod.
endclass.

class lcl_vehicle_finance definition
    final
    create public.

public section.
    methods select_financing.
    methods calculate_monthly_payment.
endclass.

class lcl_vehicle_finance implementation.
    method select_financing.
    endmethod.

    method calculate_monthly_payment.
    endmethod.
endclass.
