** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_assign_stmt definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data va type ref to zcl_sql_tree_node.
        data e type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_assign_stmt implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'va' value = elements[ 1 ] ) to labelled.
        va = elements[ 1 ].
        append value #( key = 'e' value = elements[ 2 ] ) to labelled.
        e = elements[ 2 ].
    endmethod.

endclass.
