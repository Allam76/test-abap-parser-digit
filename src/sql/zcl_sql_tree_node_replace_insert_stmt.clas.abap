** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_replace_insert_stmt definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data ri type ref to zcl_sql_tree_node.
        data t type ref to zcl_sql_tree_node.
        data c type ref to zcl_sql_tree_node.
        data v type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_replace_insert_stmt implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'ri' value = elements[ 1 ] ) to labelled.
        ri = elements[ 1 ].
        append value #( key = 't' value = elements[ 2 ] ) to labelled.
        t = elements[ 2 ].
        append value #( key = 'c' value = elements[ 3 ] ) to labelled.
        c = elements[ 3 ].
        append value #( key = 'v' value = elements[ 4 ] ) to labelled.
        v = elements[ 4 ].
    endmethod.

endclass.
