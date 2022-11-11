** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

* this is the grammar file that does most of the parsing
* generated do not change

class zcl_digits_grammar definition public
    create public.
  public section.
    types string_string_tab type table of stringtab with empty key.

    class-data failure_node type ref to zcl_digits_tree_node.
    data input_size type i.
    data offset type i.
    data failure type i.

    data input type string.
    data expected type string_string_tab.
    data actions type ref to zcl_digits_actions.

    methods constructor importing input type string actions type ref to zcl_digits_actions.
    methods format_error importing input type string
                                   offset type i
                                   expected type zcl_digits_grammar=>string_string_tab
                          returning value(result) type string.
  private section.
    types: begin of ty_rule_type,
                key type i,
                value type ref to cache_record,
            end of ty_rule_type,
            ty_rule_type_tab type table of ty_rule_type with empty key.

    types: begin of ty_hash_int_type,
                key type i,
                value type ref to cache_record,
            end of ty_hash_int_type,
            ty_hash_int_type_tab type table of ty_hash_int_type with empty key.

    types: begin of ty_hash_label_type,
                key type string,
                value type ty_hash_int_type_tab,
            end of ty_hash_label_type,
            hash_label_type_tab type table of ty_hash_label_type with empty key.

    data cache type hash_label_type_tab.
endclass.
class zcl_digits_grammar implementation.
  method constructor.
    me->input = input.
    input_size = strlen( input ).
    me->actions = actions.
    me->offset = 0.
    me->failure = 0.
  endmethod.

  method format_error.
    split input at '\n' into table data(lines) in character mode.
    data(line_no) = 1.
    data(position) = 0.

    while position <= offset.
      position = position + strlen( lines[ line_no ] ) + 1.
      line_no = line_no + 1.
    endwhile.

    data(line) = lines[ line_no - 1 ].
    data(message) = 'Line ' && line_no && ': expected one of:\n\n'.

    loop at expected into data(pair).
      message = message && |    - { pair[ 2 ] } from { pair[ 1 ] }\n|.
    endloop.
    data(number) = '' && line_no.
    while strlen( number ) < 6.
      number = ` ` && number.
      message = message && '\n' && number && ' | ' && line && '\n'.
    endwhile.

    position = position - strlen( line ) + 10.

    while position < offset.
      message = message && ' '.
      position = position + 1.
    endwhile.
    result = message && '^'.
  endmethod.
endclass.
