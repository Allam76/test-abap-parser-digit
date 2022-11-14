** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_number definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data int_ type ref to zcl_sql_tree_node.
        data frac type ref to zcl_sql_tree_node.
        data exp type ref to zcl_sql_tree_node.
        data int_ type ref to zcl_sql_tree_node.
        data frac type ref to zcl_sql_tree_node.
        data int_ type ref to zcl_sql_tree_node.
        data exp type ref to zcl_sql_tree_node.
        data int_ type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_number implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'int_' value = elements[ 1 ] ) to labelled.
        int_ = elements[ 1 ].
        append value #( key = 'frac' value = elements[ 2 ] ) to labelled.
        frac = elements[ 2 ].
        append value #( key = 'exp' value = elements[ 3 ] ) to labelled.
        exp = elements[ 3 ].
        append value #( key = 'int_' value = elements[ 4 ] ) to labelled.
        int_ = elements[ 4 ].
        append value #( key = 'frac' value = elements[ 5 ] ) to labelled.
        frac = elements[ 5 ].
        append value #( key = 'int_' value = elements[ 6 ] ) to labelled.
        int_ = elements[ 6 ].
        append value #( key = 'exp' value = elements[ 7 ] ) to labelled.
        exp = elements[ 7 ].
        append value #( key = 'int_' value = elements[ 8 ] ) to labelled.
        int_ = elements[ 8 ].
    endmethod.

endclass.
