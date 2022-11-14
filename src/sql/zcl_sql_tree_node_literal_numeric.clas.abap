** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_literal_numeric definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data value type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_literal_numeric implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'value' value = elements[ 1 ] ) to labelled.
        value = elements[ 1 ].
    endmethod.

endclass.
