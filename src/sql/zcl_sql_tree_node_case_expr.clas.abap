** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_case_expr definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data expr type ref to zcl_sql_tree_node.
        data condition_list type ref to zcl_sql_tree_node.
        data otherwise type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_case_expr implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'expr' value = elements[ 1 ] ) to labelled.
        expr = elements[ 1 ].
        append value #( key = 'condition_list' value = elements[ 2 ] ) to labelled.
        condition_list = elements[ 2 ].
        append value #( key = 'otherwise' value = elements[ 3 ] ) to labelled.
        otherwise = elements[ 3 ].
    endmethod.

endclass.
