** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_with_clause definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data recursive type ref to zcl_sql_tree_node.
        data list type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_with_clause implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'recursive' value = elements[ 1 ] ) to labelled.
        recursive = elements[ 1 ].
        append value #( key = 'list' value = elements[ 2 ] ) to labelled.
        list = elements[ 2 ].
    endmethod.

endclass.
