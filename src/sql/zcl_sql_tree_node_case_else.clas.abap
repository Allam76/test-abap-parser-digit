** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_case_else definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data result type ref to zcl_sql_tree_node.
    
endclass.

class zcl_sql_tree_node_case_else implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'result' value = elements[ 1 ] ) to labelled.
        result = elements[ 1 ].
    endmethod.

endclass.
