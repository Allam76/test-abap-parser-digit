** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_between_or_not_between_op definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data nk type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_between_or_not_between_op implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'nk' value = elements[ 1 ] ) to labelled.
        nk = elements[ 1 ].
    endmethod.

endclass.
