** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_exists_expr definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data op type ref to zcl_sql_tree_node.
        data sub type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_exists_expr implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'op' value = elements[ 1 ] ) to labelled.
        op = elements[ 1 ].
        append value #( key = 'sub' value = elements[ 2 ] ) to labelled.
        sub = elements[ 2 ].
    endmethod.

endclass.
