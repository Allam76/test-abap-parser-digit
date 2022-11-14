** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class test_simple definition final for testing 
  duration short
  risk level harmless.

  private section.
    methods simple_test for testing raising cx_static_check.
endclass.


class test_simple implementation.

  method simple_test.
    data(node) = zcl_sql_parser=>parse( <text> ).
    cl_abap_unit_assert=>assert_bound( act = node msg = 'node should be bound' ).
  endmethod.

endclass.
