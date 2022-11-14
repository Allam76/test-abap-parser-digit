** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_single_quoted_ident definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data chars type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_single_quoted_ident implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'chars' value = elements[ 1 ] ) to labelled.
        chars = elements[ 1 ].
    endmethod.

endclass.
