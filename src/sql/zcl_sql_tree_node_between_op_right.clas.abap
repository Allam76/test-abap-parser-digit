** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_between_op_right definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data op type ref to zcl_sql_tree_node.
        data begin type ref to zcl_sql_tree_node.
        data end type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_between_op_right implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'op' value = elements[ 1 ] ) to labelled.
        op = elements[ 1 ].
        append value #( key = 'begin' value = elements[ 2 ] ) to labelled.
        begin = elements[ 2 ].
        append value #( key = 'end' value = elements[ 3 ] ) to labelled.
        end = elements[ 3 ].
    endmethod.

endclass.
