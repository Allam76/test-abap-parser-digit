** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcx_digits_parser_error definition public
    inheriting from cx_static_check create public.
    public section.
      data message type string.
      methods constructor importing message type string.
endclass.

class zcx_digits_parser_error implementation.
    method constructor.
        super->constructor( ).
        me->message = message.
    endmethod.
endclass.
