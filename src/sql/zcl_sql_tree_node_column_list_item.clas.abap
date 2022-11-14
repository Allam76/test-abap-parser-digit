** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_column_list_item definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data table type ref to zcl_sql_tree_node.
        data e type ref to zcl_sql_tree_node.
        data alias type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_column_list_item implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'table' value = elements[ 1 ] ) to labelled.
        table = elements[ 1 ].
        append value #( key = 'e' value = elements[ 2 ] ) to labelled.
        e = elements[ 2 ].
        append value #( key = 'alias' value = elements[ 3 ] ) to labelled.
        alias = elements[ 3 ].
    endmethod.

endclass.
