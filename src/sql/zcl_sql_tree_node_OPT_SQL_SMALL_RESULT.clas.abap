** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_tree_node_OPT_SQL_SMALL_RESULT definition public
  inheriting from zcl_sql_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
    
endclass.

class zcl_sql_tree_node_OPT_SQL_SMALL_RESULT implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
    endmethod.

endclass.
