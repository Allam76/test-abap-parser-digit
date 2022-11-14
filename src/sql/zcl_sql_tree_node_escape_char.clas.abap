** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_escape_char definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data h1 type ref to zcl_sql_tree_node.
        data h2 type ref to zcl_sql_tree_node.
        data h3 type ref to zcl_sql_tree_node.
        data h4 type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_escape_char implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'h1' value = elements[ 1 ] ) to labelled.
        h1 = elements[ 1 ].
        append value #( key = 'h2' value = elements[ 2 ] ) to labelled.
        h2 = elements[ 2 ].
        append value #( key = 'h3' value = elements[ 3 ] ) to labelled.
        h3 = elements[ 3 ].
        append value #( key = 'h4' value = elements[ 4 ] ) to labelled.
        h4 = elements[ 4 ].
    endmethod.

endclass.
