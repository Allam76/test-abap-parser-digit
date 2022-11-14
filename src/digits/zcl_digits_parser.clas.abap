** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

CLASS zcl_digits_parser DEFINITION PUBLIC
    CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES string_string_tab TYPE TABLE OF stringtab WITH EMPTY KEY.

    CLASS-DATA failure_node TYPE REF TO zcl_digits_tree_node.
    DATA input_size TYPE i.
    DATA offset TYPE i.
    DATA failure TYPE i.

    DATA input TYPE string.
    DATA expected TYPE string_string_tab.
    DATA actions TYPE REF TO zcl_digits_actions.

    CLASS-METHODS class_constructor.
    CLASS-METHODS parse IMPORTING input TYPE string
                                  actions TYPE REF TO zcl_digits_actions OPTIONAL
                        RETURNING VALUE(result) TYPE REF TO zcl_digits_tree_node.
    METHODS parse2 IMPORTING input TYPE string
                   RETURNING VALUE(result) TYPE REF TO zcl_digits_tree_node
                   RAISING zcx_digits_parser_error.
    METHODS parse3 RETURNING VALUE(result) TYPE REF TO zcl_digits_tree_node
                   RAISING zcx_digits_parser_error.

    METHODS constructor IMPORTING input TYPE string actions TYPE REF TO zcl_digits_actions.
    METHODS format_error IMPORTING input TYPE string
                                offset TYPE i
                                expected TYPE string_string_tab
                        RETURNING VALUE(result) TYPE string.
  PRIVATE SECTION.
    TYPES: BEGIN OF ty_rule_type,
                    key TYPE i,
                    value TYPE REF TO cache_record,
                END OF ty_rule_type,
                ty_rule_type_tab TYPE TABLE OF ty_rule_type WITH EMPTY KEY.

    TYPES: BEGIN OF ty_hash_int_type,
                    key TYPE i,
                    value TYPE REF TO cache_record,
                END OF ty_hash_int_type,
                ty_hash_int_type_tab TYPE TABLE OF ty_hash_int_type WITH EMPTY KEY.

    TYPES: BEGIN OF ty_hash_label_type,
                    key TYPE string,
                    value TYPE ty_hash_int_type_tab,
                END OF ty_hash_label_type,
                hash_label_type_tab TYPE TABLE OF ty_hash_label_type WITH EMPTY KEY.
                
    DATA cache TYPE hash_label_type_tab.

    CLASS-DATA regex0 TYPE REF TO cl_abap_regex.
       
    METHODS read_root RETURNING VALUE(result) TYPE REF TO zcl_digits_tree_node.
    METHODS read_digits RETURNING VALUE(result) TYPE REF TO zcl_digits_tree_node.
        
ENDCLASS.

CLASS zcl_digits_parser IMPLEMENTATION.
  METHOD class_constructor.
    regex0 = NEW cl_abap_regex( pattern = '/^[0-9]/' ).
        
    DATA top_level TYPE string.
  ENDMETHOD.

  METHOD constructor.
    me->input = input.
    input_size = strlen( input ).
    me->actions = actions.
    me->offset = 0.
    me->failure = 0.

    DATA test TYPE string.
  ENDMETHOD.
    
  METHOD format_error.
    SPLIT input AT '\n' INTO TABLE DATA(lines) IN CHARACTER MODE.
    DATA(line_no) = 1.
    DATA(position) = 0.

    WHILE position <= offset.
      position = position + strlen( lines[ line_no ] ) + 1.
      line_no = line_no + 1.
    ENDWHILE.

    DATA(line) = lines[ line_no - 1 ].
    DATA(message) = 'Line ' && line_no && ': expected one of:\n\n'.

    LOOP AT expected INTO DATA(pair).
      message = message && |    - { pair[ 2 ] } from { pair[ 1 ] }\n|.
    ENDLOOP.
    DATA(number) = '' && line_no.
    WHILE strlen( number ) < 6.
      number = ` ` && number.
      message = message && '\n' && number && ' | ' && line && '\n'.
    ENDWHILE.

    position = position - strlen( line ) + 10.

    WHILE position < offset.
      message = message && ' '.
      position = position + 1.
    ENDWHILE.
    result = message && '^'.
  ENDMETHOD.
  METHOD read_root.
    DATA(address0) = failure_node.
    DATA(index0) = offset.
    APPEND VALUE #( key = 'root' value = VALUE #( ) ) TO cache.
    IF line_exists( cache[ key = 'root' ] ).
      DATA(rule) = cache[ key = 'root' ]-value.
    ENDIF.
    IF rule IS INITIAL.
      APPEND VALUE #( key = 'root' value = rule ) TO cache.
    ENDIF.
    IF line_exists( rule[ key = offset ] ).
      address0 = rule[ key = offset ]-value->node.
      offset = rule[ key = offset ]-value->tail.
    ELSE.
      DATA(index1) = offset.
      DATA elements0 TYPE zcl_digits_tree_node=>tree_node_list_tab.
      CLEAR elements0.
      DATA(address1) = failure_node.
      DATA chunk0 TYPE string.
      CLEAR chunk0.
      DATA(max0) = offset + 3.
      IF max0 <= input_size.
        chunk0 = substring( val = input off = offset len = max0 - offset ).
      ENDIF.
      IF chunk0 IS NOT INITIAL AND chunk0 = `foo`.
        address1 = NEW zcl_digits_tree_node(
                    text = substring( val = input off = offset len = offset + 3 - offset )
                    offset = offset
                    elements = VALUE #( ) ).
        offset = offset + 3.
      ELSE.
        address1 = failure_node.
        IF offset > failure.
          failure = offset.
        ENDIF.
        IF offset = failure.
          APPEND VALUE #( ( `digits::root` ) ( `first` ) ) TO expected.
        ENDIF.
      ENDIF.
      IF address1 <> failure_node.
        APPEND address1 TO elements0.
        DATA(address2) = failure_node.
        DATA chunk1 TYPE string.
        CLEAR chunk1.
        DATA(max1) = offset + 3.
        IF max1 <= input_size.
          chunk1 = substring( val = input off = offset len = max1 - offset ).
        ENDIF.
        IF chunk1 IS NOT INITIAL AND chunk1 = `bar`.
          address2 = NEW zcl_digits_tree_node(
                        text = substring( val = input off = offset len = offset + 3 - offset )
                        offset = offset
                        elements = VALUE #( ) ).
          offset = offset + 3.
        ELSE.
          address2 = failure_node.
          IF offset > failure.
            failure = offset.
          ENDIF.
          IF offset = failure.
            APPEND VALUE #( ( `digits::root` ) ( `second` ) ) TO expected.
          ENDIF.
        ENDIF.
        IF address2 <> failure_node.
          APPEND address2 TO elements0.
        ELSE.
          CLEAR elements0.
          offset = index1.
        ENDIF.
      ELSE.
        CLEAR elements0.
        offset = index1.
      ENDIF.
      IF elements0 IS INITIAL.
        address0 = failure_node.
      ELSE.
        address0 = zcl_digits_tree_node_root=>action(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
        offset = offset.
      ENDIF.
      APPEND VALUE #( key = index0 value = NEW cache_record( node = address0 tail = offset ) ) TO rule.
    ENDIF.
    result = address0.
  ENDMETHOD.
    
  METHOD read_digits.
    DATA(address0) = failure_node.
    DATA(index0) = offset.
    APPEND VALUE #( key = 'digits' value = VALUE #( ) ) TO cache.
    IF line_exists( cache[ key = 'digits' ] ).
      DATA(rule) = cache[ key = 'digits' ]-value.
    ENDIF.
    IF rule IS INITIAL.
      APPEND VALUE #( key = 'digits' value = rule ) TO cache.
    ENDIF.
    IF line_exists( rule[ key = offset ] ).
      address0 = rule[ key = offset ]-value->node.
      offset = rule[ key = offset ]-value->tail.
    ELSE.
      DATA(index1) = offset.
      DATA elements0 TYPE zcl_digits_tree_node=>tree_node_list_tab.
      CLEAR elements0.
      DATA address1 TYPE REF TO zcl_digits_tree_node.
      CLEAR address1.
      DO.
        DATA chunk0 TYPE string.
        CLEAR chunk0.
        DATA(max0) = offset + 1.
        IF max0 <= input_size.
          chunk0 = substring( val = input off = offset len = max0 - offset ).
        ENDIF.
        IF chunk0 IS NOT INITIAL AND regex0->create_matcher( text = chunk0 )->match( ) = abap_true.
          address1 = NEW zcl_digits_tree_node(
                        text = substring( val = input off = offset len = offset + 1 - offset )
                        offset = offset
                        elements = VALUE #( ) ).
          offset = offset + 1.
        ELSE.
          address1 = failure_node.
          IF offset > failure.
            failure = offset.
          ENDIF.
          IF offset = failure.
            APPEND VALUE #( ( `digits::digits` ) ( `regex0` ) ) TO expected.
          ENDIF.
        ENDIF.
        IF address1 <> failure_node.
          APPEND address1 TO elements0.
        ELSE.
          EXIT.
        ENDIF.
      ENDDO.
      IF lines( elements0 ) >= 0.
        address0 = NEW zcl_digits_tree_node(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
        offset = offset.
      ELSE.
        address0 = failure_node.
      ENDIF.
      APPEND VALUE #( key = index0 value = NEW cache_record( node = address0 tail = offset ) ) TO rule.
    ENDIF.
    result = address0.
  ENDMETHOD.
    
    

  METHOD parse.
    DATA(parser) = NEW zcl_digits_parser( input = input actions = actions ).
    result = parser->parse3( ).
  ENDMETHOD.

  METHOD parse2.
    result = parse( input = input ).
  ENDMETHOD.

  METHOD parse3.
    DATA(tree) = read_root( ).
    IF tree <> failure_node AND offset = input_size.
      result = tree.
      RETURN.
    ENDIF.
    IF expected IS INITIAL.
      failure = offset.
      APPEND VALUE stringtab( ( `digits` ) ( `<EOF>` ) ) TO expected.
    ENDIF.
    RAISE EXCEPTION TYPE zcx_digits_parser_error
        EXPORTING message = format_error( input = input offset = failure expected = expected ).
  ENDMETHOD.

ENDCLASS.