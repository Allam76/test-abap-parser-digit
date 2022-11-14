** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_literal_datetime definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data type type ref to zcl_sql_tree_node.
        data ca type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_literal_datetime implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'type' value = elements[ 1 ] ) to labelled.
        type = elements[ 1 ].
        append value #( key = 'ca' value = elements[ 2 ] ) to labelled.
        ca = elements[ 2 ].
    endmethod.

endclass.
