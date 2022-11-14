** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class cache_record definition.
    public section.
        data node type ref to zcl_sql_tree_node.
        data tail type i.

        methods constructor importing node type ref to zcl_sql_tree_node tail type i.
endclass.

