** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_digits_tree_node definition public
    create public.
  public section.
    types tree_node_list_tab type table of ref to zcl_digits_tree_node with empty key.
    types: begin of label_hash_entry,
        key type string,
        value type ref to zcl_digits_tree_node,
    end of label_hash_entry,
    label_hash_entry_tab type table of label_hash_entry with key key.

    data text type string.
    data offset type i.
    data elements type tree_node_list_tab.
    data labelled type label_hash_entry_tab.
    data labels type stringtab.

    methods constructor importing text type string
                                  offset type i
                                  elements type tree_node_list_tab
                                  labels type stringtab.
    methods get importing key type string returning value(result) type ref to zcl_digits_tree_node.
endclass.

class zcl_digits_tree_node implementation.
  method constructor.
    me->text = text.
    me->offset = offset.
    me->elements = elements.
    me->labels = labels.
  endmethod.

  method get.
    result = me->labelled[ key = key ]-value.
  endmethod.
endclass.

