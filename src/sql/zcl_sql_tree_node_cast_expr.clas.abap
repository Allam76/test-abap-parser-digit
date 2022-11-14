** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_cast_expr definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data expr type ref to zcl_sql_tree_node.
        data target type ref to zcl_sql_tree_node.
        data e type ref to zcl_sql_tree_node.
        data precision type ref to zcl_sql_tree_node.
        data e type ref to zcl_sql_tree_node.
        data precision type ref to zcl_sql_tree_node.
        data scale type ref to zcl_sql_tree_node.
        data e type ref to zcl_sql_tree_node.
        data s type ref to zcl_sql_tree_node.
        data t type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_cast_expr implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'expr' value = elements[ 1 ] ) to labelled.
        expr = elements[ 1 ].
        append value #( key = 'target' value = elements[ 2 ] ) to labelled.
        target = elements[ 2 ].
        append value #( key = 'e' value = elements[ 3 ] ) to labelled.
        e = elements[ 3 ].
        append value #( key = 'precision' value = elements[ 4 ] ) to labelled.
        precision = elements[ 4 ].
        append value #( key = 'e' value = elements[ 5 ] ) to labelled.
        e = elements[ 5 ].
        append value #( key = 'precision' value = elements[ 6 ] ) to labelled.
        precision = elements[ 6 ].
        append value #( key = 'scale' value = elements[ 7 ] ) to labelled.
        scale = elements[ 7 ].
        append value #( key = 'e' value = elements[ 8 ] ) to labelled.
        e = elements[ 8 ].
        append value #( key = 's' value = elements[ 9 ] ) to labelled.
        s = elements[ 9 ].
        append value #( key = 't' value = elements[ 10 ] ) to labelled.
        t = elements[ 10 ].
    endmethod.

endclass.
