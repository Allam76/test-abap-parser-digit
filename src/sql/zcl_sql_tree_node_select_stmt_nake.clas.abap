** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_select_stmt_nake definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data cte type ref to zcl_sql_tree_node.
        data opts type ref to zcl_sql_tree_node.
        data d type ref to zcl_sql_tree_node.
        data c type ref to zcl_sql_tree_node.
        data f type ref to zcl_sql_tree_node.
        data w type ref to zcl_sql_tree_node.
        data g type ref to zcl_sql_tree_node.
        data h type ref to zcl_sql_tree_node.
        data o type ref to zcl_sql_tree_node.
        data l type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_select_stmt_nake implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'cte' value = elements[ 1 ] ) to labelled.
        cte = elements[ 1 ].
        append value #( key = 'opts' value = elements[ 2 ] ) to labelled.
        opts = elements[ 2 ].
        append value #( key = 'd' value = elements[ 3 ] ) to labelled.
        d = elements[ 3 ].
        append value #( key = 'c' value = elements[ 4 ] ) to labelled.
        c = elements[ 4 ].
        append value #( key = 'f' value = elements[ 5 ] ) to labelled.
        f = elements[ 5 ].
        append value #( key = 'w' value = elements[ 6 ] ) to labelled.
        w = elements[ 6 ].
        append value #( key = 'g' value = elements[ 7 ] ) to labelled.
        g = elements[ 7 ].
        append value #( key = 'h' value = elements[ 8 ] ) to labelled.
        h = elements[ 8 ].
        append value #( key = 'o' value = elements[ 9 ] ) to labelled.
        o = elements[ 9 ].
        append value #( key = 'l' value = elements[ 10 ] ) to labelled.
        l = elements[ 10 ].
    endmethod.

endclass.
