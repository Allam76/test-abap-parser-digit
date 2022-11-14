** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_column_name definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data start type ref to zcl_sql_tree_node.
        data parts type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_column_name implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'start' value = elements[ 1 ] ) to labelled.
        start = elements[ 1 ].
        append value #( key = 'parts' value = elements[ 2 ] ) to labelled.
        parts = elements[ 2 ].
    endmethod.

endclass.
