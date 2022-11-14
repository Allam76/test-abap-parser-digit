** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_row_value_constructor definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data rowkw type ref to zcl_sql_tree_node.
        data head type ref to zcl_sql_tree_node.
        data tail type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_row_value_constructor implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'rowkw' value = elements[ 1 ] ) to labelled.
        rowkw = elements[ 1 ].
        append value #( key = 'head' value = elements[ 2 ] ) to labelled.
        head = elements[ 2 ].
        append value #( key = 'tail' value = elements[ 3 ] ) to labelled.
        tail = elements[ 3 ].
    endmethod.

endclass.
