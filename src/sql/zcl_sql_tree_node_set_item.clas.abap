** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_set_item definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data c type ref to zcl_sql_tree_node.
        data v type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_set_item implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'c' value = elements[ 1 ] ) to labelled.
        c = elements[ 1 ].
        append value #( key = 'v' value = elements[ 2 ] ) to labelled.
        v = elements[ 2 ].
    endmethod.

endclass.
