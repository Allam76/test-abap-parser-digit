** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_int definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data digit type ref to zcl_sql_tree_node.
        data op type ref to zcl_sql_tree_node.
        data digits type ref to zcl_sql_tree_node.
        data op type ref to zcl_sql_tree_node.
        data digit type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_int implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'digit' value = elements[ 1 ] ) to labelled.
        digit = elements[ 1 ].
        append value #( key = 'op' value = elements[ 2 ] ) to labelled.
        op = elements[ 2 ].
        append value #( key = 'digits' value = elements[ 3 ] ) to labelled.
        digits = elements[ 3 ].
        append value #( key = 'op' value = elements[ 4 ] ) to labelled.
        op = elements[ 4 ].
        append value #( key = 'digit' value = elements[ 5 ] ) to labelled.
        digit = elements[ 5 ].
    endmethod.

endclass.
