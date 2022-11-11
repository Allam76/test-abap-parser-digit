** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_digits_tree_node_root definition public
  inheriting from zcl_digits_tree_node
  create public.
    public section.
        methods constructor importing text type string
                                    offset type i
                                    elements type tree_node_list_tab
                                    labels type stringtab optional.
        data first type ref to zcl_digits_tree_node.
        data second type ref to zcl_digits_tree_node.
    
endclass.

class zcl_digits_tree_node_root implementation.
    method constructor.
        super->constructor( text = text  offset = offset  elements = elements ).
        append value #( key = 'first' value = elements[ 1 ] ) to labelled.
        first = elements[ 1 ].
        append value #( key = 'second' value = elements[ 2 ] ) to labelled.
        second = elements[ 2 ].
    endmethod.
endclass.
