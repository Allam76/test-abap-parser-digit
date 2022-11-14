** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_table_primary definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data l type ref to zcl_sql_tree_node.
        data alias type ref to zcl_sql_tree_node.
        data cols type ref to zcl_sql_tree_node.
        data lateral type ref to zcl_sql_tree_node.
        data sub type ref to zcl_sql_tree_node.
        data alias type ref to zcl_sql_tree_node.
        data cols type ref to zcl_sql_tree_node.
        data t type ref to zcl_sql_tree_node.
        data as type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_table_primary implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'l' value = elements[ 1 ] ) to labelled.
        l = elements[ 1 ].
        append value #( key = 'alias' value = elements[ 2 ] ) to labelled.
        alias = elements[ 2 ].
        append value #( key = 'cols' value = elements[ 3 ] ) to labelled.
        cols = elements[ 3 ].
        append value #( key = 'lateral' value = elements[ 4 ] ) to labelled.
        lateral = elements[ 4 ].
        append value #( key = 'sub' value = elements[ 5 ] ) to labelled.
        sub = elements[ 5 ].
        append value #( key = 'alias' value = elements[ 6 ] ) to labelled.
        alias = elements[ 6 ].
        append value #( key = 'cols' value = elements[ 7 ] ) to labelled.
        cols = elements[ 7 ].
        append value #( key = 't' value = elements[ 8 ] ) to labelled.
        t = elements[ 8 ].
        append value #( key = 'as' value = elements[ 9 ] ) to labelled.
        as = elements[ 9 ].
    endmethod.

endclass.
