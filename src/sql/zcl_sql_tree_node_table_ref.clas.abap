** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_table_ref definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data t type ref to zcl_sql_tree_node.
        data op type ref to zcl_sql_tree_node.
        data t type ref to zcl_sql_tree_node.
        data spec type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_table_ref implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 't' value = elements[ 1 ] ) to labelled.
        t = elements[ 1 ].
        append value #( key = 'op' value = elements[ 2 ] ) to labelled.
        op = elements[ 2 ].
        append value #( key = 't' value = elements[ 3 ] ) to labelled.
        t = elements[ 3 ].
        append value #( key = 'spec' value = elements[ 4 ] ) to labelled.
        spec = elements[ 4 ].
    endmethod.

endclass.
