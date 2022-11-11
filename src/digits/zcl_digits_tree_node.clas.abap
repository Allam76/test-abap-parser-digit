** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation


CLASS zcl_digits_tree_node DEFINITION PUBLIC.
    PUBLIC SECTION.
        types elements_list_tab type table of ref to  with default key.
        types: begin of label_hash_entry,
           key type ref to lcl_label,
           value type ref to ,
        end of label_hash_entry,
        label_hash_entry_tab type table of label_hash_entry with key key.

        data text type string.
        data offset type i.
        data elements type elements_list_tab.
        data labelled type label_hash_entry_tab.

        methods constructor importing text type string offset type i elements type elements_list_tab.
        methods get importing key type ref to lcl_label returning value(result) type ref to .

ENDCLASS.

CLASS zcl_digits_tree_node IMPLEMENTATION.
    method constructor.
        me->text = text;
        me->offset = offset;
        me->elements = elements;
    endmethod.

    method get.
        result = me->labelled[ key = key ].
    endmethod.
ENDCLASS.

