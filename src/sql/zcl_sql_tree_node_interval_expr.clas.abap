** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_interval_expr definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data sign type ref to zcl_sql_tree_node.
        data value type ref to zcl_sql_tree_node.
        data qualifier type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_interval_expr implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'sign' value = elements[ 1 ] ) to labelled.
        sign = elements[ 1 ].
        append value #( key = 'value' value = elements[ 2 ] ) to labelled.
        value = elements[ 2 ].
        append value #( key = 'qualifier' value = elements[ 3 ] ) to labelled.
        qualifier = elements[ 3 ].
    endmethod.

endclass.
