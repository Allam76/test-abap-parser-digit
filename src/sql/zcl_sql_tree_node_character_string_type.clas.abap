** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_character_string_type definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data t type ref to zcl_sql_tree_node.
        data l type ref to zcl_sql_tree_node.
        data t type ref to zcl_sql_tree_node.
        data t type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_character_string_type implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 't' value = elements[ 1 ] ) to labelled.
        t = elements[ 1 ].
        append value #( key = 'l' value = elements[ 2 ] ) to labelled.
        l = elements[ 2 ].
        append value #( key = 't' value = elements[ 3 ] ) to labelled.
        t = elements[ 3 ].
        append value #( key = 't' value = elements[ 4 ] ) to labelled.
        t = elements[ 4 ].
    endmethod.

endclass.
