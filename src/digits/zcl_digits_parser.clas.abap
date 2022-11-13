** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_digits_parser definition public
    create public.

  public section.
    types string_string_tab type table of stringtab with empty key.

    class-data failure_node type ref to zcl_digits_tree_node.
    data input_size type i.
    data offset type i.
    data failure type i.

    data input type string.
    data expected type string_string_tab.
    data actions type ref to zcl_digits_actions.


    class-methods class_constructor.
    class-methods parse importing input type string
                                  actions type ref to zcl_digits_actions optional
                        returning value(result) type ref to zcl_digits_tree_node.
    methods parse2 importing input type string
                   returning value(result) type ref to zcl_digits_tree_node
                   raising zcx_digits_parser_error.
    methods parse3 returning value(result) type ref to zcl_digits_tree_node
                   raising zcx_digits_parser_error.

    methods constructor importing input type string actions type ref to zcl_digits_actions.
    methods format_error importing input type string
                                offset type i
                                expected type string_string_tab
                        returning value(result) type string.
    private section.
        types: begin of ty_rule_type,
                    key type i,
                    value type ref to cache_record,
                end of ty_rule_type,
                ty_rule_type_tab type table of ty_rule_type with empty key.

        types: begin of ty_hash_int_type,
                    key type i,
                    value type ref to cache_record,
                end of ty_hash_int_type,
                ty_hash_int_type_tab type table of ty_hash_int_type with empty key.

        types: begin of ty_hash_label_type,
                    key type string,
                    value type ty_hash_int_type_tab,
                end of ty_hash_label_type,
                hash_label_type_tab type table of ty_hash_label_type with empty key.
                
        data cache type hash_label_type_tab.

        class-data regex0 type ref to cl_abap_regex.
        
        methods read_root returning value(result) type ref to zcl_digits_tree_node.
        methods read_digits returning value(result) type ref to zcl_digits_tree_node.
        
endclass.

class zcl_digits_parser implementation.
    method class_constructor.
        regex0 = new cl_abap_regex( pattern = '/^[0-9]/' ).
        
        data top_level type string.
    endmethod.

    method constructor.
        me->input = input.
        input_size = strlen( input ).
        me->actions = actions.
        me->offset = 0.
        me->failure = 0.

        data test type string.
    endmethod.
    
    method format_error.
        split input at '\n' into table data(lines) in character mode.
        data(line_no) = 1.
        data(position) = 0.

        while position <= offset.
            position = position + strlen( lines[ line_no ] ) + 1.
            line_no = line_no + 1.
        endwhile.

        data(line) = lines[ line_no - 1 ].
        data(message) = 'Line ' && line_no && ': expected one of:\n\n'.

        loop at expected into data(pair).
            message = message && |    - { pair[ 2 ] } from { pair[ 1 ] }\n|.
        endloop.
        data(number) = '' && line_no.
        while strlen( number ) < 6.
            number = ` ` && number.
            message = message && '\n' && number && ' | ' && line && '\n'.
        endwhile.

        position = position - strlen( line ) + 10.

        while position < offset.
            message = message && ' '.
            position = position + 1.
        endwhile.
        result = message && '^'.
    endmethod.    
    method read_root.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'root' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'root' ] ).
            data(rule) = cache[ key = 'root' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'root' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_digits_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            data chunk0 type string.
            clear chunk0.
            data(max0) = offset + 3.
            if max0 <= input_size.
                chunk0 = substring( val = input off = offset len = max0 - offset ).
            endif.
            if chunk0 is not initial and chunk0 = `foo`.
                [object Object] = new zcl_digits_tree_node(
                    text = substring( val = input off = address1 len = offset - address1 )
                    offset = address1
                    elements = offset + 3 ).
                offset = offset.
            else.
                address1 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `digits::root` ) ( `first` ) ) to expected.
                endif.
            endif.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data chunk1 type string.
                clear chunk1.
                data(max1) = offset + 3.
                if max1 <= input_size.
                    chunk1 = substring( val = input off = offset len = max1 - offset ).
                endif.
                if chunk1 is not initial and chunk1 = `bar`.
                    [object Object] = new zcl_digits_tree_node(
                        text = substring( val = input off = address2 len = offset - address2 )
                        offset = address2
                        elements = offset + 3 ).
                    offset = offset.
                else.
                    address2 = failure_node.
                    if offset > failure.
                        failure = offset.
                    endif.
                    if offset = failure.
                        append value #( ( `digits::root` ) ( `second` ) ) to expected.
                    endif.
                endif.
                if address2 <> failure_node.
                    append address2 to elements0.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                [object Object] = zcl_digits_tree_node_result = first && second.=>action(
                    text = substring( val = input off = address0 len = index1 - address0 )
                    offset = address0
                    elements = offset ).
                offset = index1.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_digits.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'digits' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'digits' ] ).
            data(rule) = cache[ key = 'digits' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'digits' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_digits_tree_node=>tree_node_list_tab.
            clear elements0.
            data address1 type ref to zcl_digits_tree_node.
            clear address1.
            do.
                data chunk0 type string.
                clear chunk0.
                data(max0) = offset + 1.
                if max0 <= input_size.
                    chunk0 = substring( val = input off = offset len = max0 - offset ).
                endif.
                if chunk0 is not initial and regex0->create_matcher( text = chunk0 )->match( ) = abap_true.
                    address1 = new zcl_digits_tree_node(
                        text = substring( val = input off = offset len = offset + 1 - offset )
                        offset = offset
                        elements = value #( ) ).
                    offset = offset + 1.
                else.
                    address1 = failure_node.
                    if offset > failure.
                        failure = offset.
                    endif.
                    if offset = failure.
                        append value #( ( `digits::digits` ) ( `regex0` ) ) to expected.
                    endif.
                endif.
                if address1 <> failure_node.
                    append address1 to elements0.
                else.
                    exit.
                endif.
            enddo.
            if lines( elements0 ) >= 0.
                address0 = new zcl_digits_tree_node(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            else.
                address0 = failure_node.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    

  method parse.
    data(parser) = new zcl_digits_parser( input = input actions = actions ).
    result = parser->parse3( ).
  endmethod.

  method parse2.
    result = parse( input = input ).
  endmethod.

  method parse3.
    data(tree) = read_root( ).
    if tree <> failure_node and offset = input_size.
      result = tree.
      return.
    endif.
    if expected is initial.
      failure = offset.
      append value stringtab( ( `digits` ) ( `<EOF>` ) ) to expected.
    endif.
    raise exception type zcx_digits_parser_error
        exporting message = format_error( input = input offset = failure expected = expected ).
  endmethod.

endclass.
