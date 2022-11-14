** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_column_ref definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data tbl type ref to zcl_sql_tree_node.
        data col type ref to zcl_sql_tree_node.
        data col type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_column_ref implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'tbl' value = elements[ 1 ] ) to labelled.
        tbl = elements[ 1 ].
        append value #( key = 'col' value = elements[ 2 ] ) to labelled.
        col = elements[ 2 ].
        append value #( key = 'col' value = elements[ 3 ] ) to labelled.
        col = elements[ 3 ].
    endmethod.

endclass.
