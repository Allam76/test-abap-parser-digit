** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_ident definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data name type ref to zcl_sql_tree_node.
        data name type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_ident implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'name' value = elements[ 1 ] ) to labelled.
        name = elements[ 1 ].
        append value #( key = 'name' value = elements[ 2 ] ) to labelled.
        name = elements[ 2 ].
    endmethod.

endclass.
