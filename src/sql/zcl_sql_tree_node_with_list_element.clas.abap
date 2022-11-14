** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_with_list_element definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data name type ref to zcl_sql_tree_node.
        data columns type ref to zcl_sql_tree_node.
        data stmt type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_with_list_element implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'name' value = elements[ 1 ] ) to labelled.
        name = elements[ 1 ].
        append value #( key = 'columns' value = elements[ 2 ] ) to labelled.
        columns = elements[ 2 ].
        append value #( key = 'stmt' value = elements[ 3 ] ) to labelled.
        stmt = elements[ 3 ].
    endmethod.

endclass.
