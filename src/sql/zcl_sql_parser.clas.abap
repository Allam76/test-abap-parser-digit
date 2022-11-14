** This file was generated from
** See https://github.com/Allam766/canopy-abap/ for documentation

class zcl_sql_parser definition public
    create public.

  public section.
    types string_string_tab type table of stringtab with empty key.

    class-data failure_node type ref to zcl_sql_tree_node.
    data input_size type i.
    data offset type i.
    data failure type i.

    data input type string.
    data expected type string_string_tab.
    data actions type ref to zcl_sql_actions.


    class-methods class_constructor.
    class-methods parse importing input type string
                                  actions type ref to zcl_sql_actions optional
                        returning value(result) type ref to zcl_sql_tree_node.
    methods parse2 importing input type string
                   returning value(result) type ref to zcl_sql_tree_node
                   raising zcx_sql_parser_error.
    methods parse3 returning value(result) type ref to zcl_sql_tree_node
                   raising zcx_sql_parser_error.

    methods constructor importing input type string actions type ref to zcl_sql_actions.
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
        class-data regex1 type ref to cl_abap_regex.
        class-data regex2 type ref to cl_abap_regex.
        class-data regex3 type ref to cl_abap_regex.
        class-data regex4 type ref to cl_abap_regex.
        class-data regex5 type ref to cl_abap_regex.
        class-data regex6 type ref to cl_abap_regex.
        class-data regex7 type ref to cl_abap_regex.
        class-data regex8 type ref to cl_abap_regex.
        class-data regex9 type ref to cl_abap_regex.
        class-data regex10 type ref to cl_abap_regex.
        class-data regex11 type ref to cl_abap_regex.
        class-data regex12 type ref to cl_abap_regex.
        
        methods read_start returning value(result) type ref to zcl_sql_tree_node.
        methods read_union_stmt returning value(result) type ref to zcl_sql_tree_node.
        methods read_select_stmt returning value(result) type ref to zcl_sql_tree_node.
        methods read_with_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_with_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_with_list_element returning value(result) type ref to zcl_sql_tree_node.
        methods read_with_column_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_select_stmt_nake returning value(result) type ref to zcl_sql_tree_node.
        methods read_option_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_query_option returning value(result) type ref to zcl_sql_tree_node.
        methods read_column_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_column_list_item returning value(result) type ref to zcl_sql_tree_node.
        methods read_alias_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_from_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_table_ref_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_table_ref returning value(result) type ref to zcl_sql_tree_node.
        methods read_table_primary returning value(result) type ref to zcl_sql_tree_node.
        methods read_join_op returning value(result) type ref to zcl_sql_tree_node.
        methods read_join_spec returning value(result) type ref to zcl_sql_tree_node.
        methods read_table_name returning value(result) type ref to zcl_sql_tree_node.
        methods read_table_row_value_expr_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_row_value_constructor returning value(result) type ref to zcl_sql_tree_node.
        methods read_on_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_sub_query returning value(result) type ref to zcl_sql_tree_node.
        methods read_derived_col_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_where_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_group_by_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_column_ref_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_having_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_order_by_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_order_by_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_order_by_element returning value(result) type ref to zcl_sql_tree_node.
        methods read_number_or_param returning value(result) type ref to zcl_sql_tree_node.
        methods read_limit_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_update_stmt returning value(result) type ref to zcl_sql_tree_node.
        methods read_set_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_set_item returning value(result) type ref to zcl_sql_tree_node.
        methods read_replace_insert_stmt returning value(result) type ref to zcl_sql_tree_node.
        methods read_replace_insert returning value(result) type ref to zcl_sql_tree_node.
        methods read_value_clause returning value(result) type ref to zcl_sql_tree_node.
        methods read_value_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_value_item returning value(result) type ref to zcl_sql_tree_node.
        methods read_expr_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_case_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_case_when_then returning value(result) type ref to zcl_sql_tree_node.
        methods read_case_else returning value(result) type ref to zcl_sql_tree_node.
        methods read_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_or_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_and_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_not_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_comparison_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_exists_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_exists_op returning value(result) type ref to zcl_sql_tree_node.
        methods read_comparison_op_right returning value(result) type ref to zcl_sql_tree_node.
        methods read_arithmetic_op_right returning value(result) type ref to zcl_sql_tree_node.
        methods read_arithmetic_comparison_operator returning value(result) type ref to zcl_sql_tree_node.
        methods read_is_op_right returning value(result) type ref to zcl_sql_tree_node.
        methods read_between_op_right returning value(result) type ref to zcl_sql_tree_node.
        methods read_between_or_not_between_op returning value(result) type ref to zcl_sql_tree_node.
        methods read_like_op returning value(result) type ref to zcl_sql_tree_node.
        methods read_in_op returning value(result) type ref to zcl_sql_tree_node.
        methods read_like_op_right returning value(result) type ref to zcl_sql_tree_node.
        methods read_in_op_right returning value(result) type ref to zcl_sql_tree_node.
        methods read_additive_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_additive_operator returning value(result) type ref to zcl_sql_tree_node.
        methods read_multiplicative_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_multiplicative_operator returning value(result) type ref to zcl_sql_tree_node.
        methods read_primary returning value(result) type ref to zcl_sql_tree_node.
        methods read_column_ref returning value(result) type ref to zcl_sql_tree_node.
        methods read_column_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_ident returning value(result) type ref to zcl_sql_tree_node.
        methods read_quoted_ident returning value(result) type ref to zcl_sql_tree_node.
        methods read_double_quoted_ident returning value(result) type ref to zcl_sql_tree_node.
        methods read_single_quoted_ident returning value(result) type ref to zcl_sql_tree_node.
        methods read_backticks_quoted_ident returning value(result) type ref to zcl_sql_tree_node.
        methods read_column returning value(result) type ref to zcl_sql_tree_node.
        methods read_column_name returning value(result) type ref to zcl_sql_tree_node.
        methods read_ident_name returning value(result) type ref to zcl_sql_tree_node.
        methods read_ident_start returning value(result) type ref to zcl_sql_tree_node.
        methods read_ident_part returning value(result) type ref to zcl_sql_tree_node.
        methods read_column_part returning value(result) type ref to zcl_sql_tree_node.
        methods read_param returning value(result) type ref to zcl_sql_tree_node.
        methods read_aggr_func returning value(result) type ref to zcl_sql_tree_node.
        methods read_set_function_type returning value(result) type ref to zcl_sql_tree_node.
        methods read_set_quantifier returning value(result) type ref to zcl_sql_tree_node.
        methods read_func_call returning value(result) type ref to zcl_sql_tree_node.
        methods read_scalar_func returning value(result) type ref to zcl_sql_tree_node.
        methods read_cast_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_interval_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_interval_unit returning value(result) type ref to zcl_sql_tree_node.
        methods read_signedness returning value(result) type ref to zcl_sql_tree_node.
        methods read_literal returning value(result) type ref to zcl_sql_tree_node.
        methods read_literal_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_literal_bool returning value(result) type ref to zcl_sql_tree_node.
        methods read_literal_string returning value(result) type ref to zcl_sql_tree_node.
        methods read_literal_datetime returning value(result) type ref to zcl_sql_tree_node.
        methods read_single_char returning value(result) type ref to zcl_sql_tree_node.
        methods read_escape_char returning value(result) type ref to zcl_sql_tree_node.
        methods read_line_terminator returning value(result) type ref to zcl_sql_tree_node.
        methods read_literal_numeric returning value(result) type ref to zcl_sql_tree_node.
        methods read_number returning value(result) type ref to zcl_sql_tree_node.
        methods read_int returning value(result) type ref to zcl_sql_tree_node.
        methods read_frac returning value(result) type ref to zcl_sql_tree_node.
        methods read_exp returning value(result) type ref to zcl_sql_tree_node.
        methods read_digits returning value(result) type ref to zcl_sql_tree_node.
        methods read_digit returning value(result) type ref to zcl_sql_tree_node.
        methods read_hexDigit returning value(result) type ref to zcl_sql_tree_node.
        methods read_e returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_NULL returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_TRUE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_FALSE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_SHOW returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_DROP returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_SELECT returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_UPDATE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_CREATE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_DELETE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_INSERT returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_RECURSIVE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_REPLACE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_EXPLAIN returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_INTO returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_FROM returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_SET returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_AS returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_TABLE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_ON returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_LEFT returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_RIGHT returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_FULL returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_INNER returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_JOIN returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_OUTER returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_UNION returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_VALUES returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_USING returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_LATERAL returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_WHERE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_WITH returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_GROUP returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_BY returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_ORDER returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_HAVING returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_LIMIT returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_ASC returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_DESC returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_ALL returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_DISTINCT returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_BETWEEN returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_IN returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_IS returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_LIKE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_EXISTS returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_NOT returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_AND returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_OR returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_COUNT returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_MAX returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_MIN returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_SUM returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_AVG returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_CASE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_WHEN returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_THEN returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_ELSE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_END returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_CAST returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_CHAR returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_VARCHAR returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_NUMERIC returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_DECIMAL returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_SIGNED returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_UNSIGNED returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_INT returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_INTEGER returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_JSON returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_SMALLINT returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_DATE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_TIME returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_TIMESTAMP returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_USER returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_INTERVAL returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_MINUTE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_HOUR returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_DAY returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_MONTH returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_YEAR returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_CURRENT_DATE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_CURRENT_TIME returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_CURRENT_TIMESTAMP returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_CURRENT_USER returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_SESSION_USER returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_SYSTEM_USER returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_VAR_PRE returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_RETURN returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_ASSIGN returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_DUAL returning value(result) type ref to zcl_sql_tree_node.
        methods read_KW_ROW returning value(result) type ref to zcl_sql_tree_node.
        methods read_OPT_SQL_CALC_FOUND_ROWS returning value(result) type ref to zcl_sql_tree_node.
        methods read_OPT_SQL_CACHE returning value(result) type ref to zcl_sql_tree_node.
        methods read_OPT_SQL_NO_CACHE returning value(result) type ref to zcl_sql_tree_node.
        methods read_OPT_SQL_SMALL_RESULT returning value(result) type ref to zcl_sql_tree_node.
        methods read_OPT_SQL_BIG_RESULT returning value(result) type ref to zcl_sql_tree_node.
        methods read_OPT_SQL_BUFFER_RESULT returning value(result) type ref to zcl_sql_tree_node.
        methods read_DOT returning value(result) type ref to zcl_sql_tree_node.
        methods read_COMMA returning value(result) type ref to zcl_sql_tree_node.
        methods read_STAR returning value(result) type ref to zcl_sql_tree_node.
        methods read_LPAREN returning value(result) type ref to zcl_sql_tree_node.
        methods read_RPAREN returning value(result) type ref to zcl_sql_tree_node.
        methods read_LBRAKE returning value(result) type ref to zcl_sql_tree_node.
        methods read_RBRAKE returning value(result) type ref to zcl_sql_tree_node.
        methods read___ returning value(result) type ref to zcl_sql_tree_node.
        methods read_comment returning value(result) type ref to zcl_sql_tree_node.
        methods read_block_comment returning value(result) type ref to zcl_sql_tree_node.
        methods read_line_comment returning value(result) type ref to zcl_sql_tree_node.
        methods read_char returning value(result) type ref to zcl_sql_tree_node.
        methods read_whitespace returning value(result) type ref to zcl_sql_tree_node.
        methods read_EOL returning value(result) type ref to zcl_sql_tree_node.
        methods read_EOF returning value(result) type ref to zcl_sql_tree_node.
        methods read_proc_stmts returning value(result) type ref to zcl_sql_tree_node.
        methods read_proc_stmt returning value(result) type ref to zcl_sql_tree_node.
        methods read_assign_stmt returning value(result) type ref to zcl_sql_tree_node.
        methods read_return_stmt returning value(result) type ref to zcl_sql_tree_node.
        methods read_proc_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_proc_additive_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_proc_multiplicative_expr returning value(result) type ref to zcl_sql_tree_node.
        methods read_proc_join returning value(result) type ref to zcl_sql_tree_node.
        methods read_proc_primary returning value(result) type ref to zcl_sql_tree_node.
        methods read_proc_func_call returning value(result) type ref to zcl_sql_tree_node.
        methods read_proc_primary_list returning value(result) type ref to zcl_sql_tree_node.
        methods read_proc_array returning value(result) type ref to zcl_sql_tree_node.
        methods read_var_decl returning value(result) type ref to zcl_sql_tree_node.
        methods read_mem_chain returning value(result) type ref to zcl_sql_tree_node.
        methods read_data_type returning value(result) type ref to zcl_sql_tree_node.
        methods read_character_string_type returning value(result) type ref to zcl_sql_tree_node.
        methods read_numeric_type returning value(result) type ref to zcl_sql_tree_node.
        methods read_datetime_type returning value(result) type ref to zcl_sql_tree_node.
        methods read_json_type returning value(result) type ref to zcl_sql_tree_node.
        
endclass.

class zcl_sql_parser implementation.
    method class_constructor.
        regex0 = new cl_abap_regex( pattern = '/^[^"]/' ).
        regex1 = new cl_abap_regex( pattern = '/^[^']/' ).
        regex2 = new cl_abap_regex( pattern = '/^[^`]/' ).
        regex3 = new cl_abap_regex( pattern = '/^[A-Za-z_]/' ).
        regex4 = new cl_abap_regex( pattern = '/^[A-Za-z0-9_]/' ).
        regex5 = new cl_abap_regex( pattern = '/^[A-Za-z0-9_:]/' ).
        regex6 = new cl_abap_regex( pattern = '/^[^'\\\0-\x1F\x7F]/' ).
        regex7 = new cl_abap_regex( pattern = '/^[\n\r]/' ).
        regex8 = new cl_abap_regex( pattern = '/^[0-9]/' ).
        regex9 = new cl_abap_regex( pattern = '/^[0-9a-fA-F]/' ).
        regex10 = new cl_abap_regex( pattern = '/^[eE]/' ).
        regex11 = new cl_abap_regex( pattern = '/^[+\-]/' ).
        regex12 = new cl_abap_regex( pattern = '/^[ \t\n\r]/' ).
        
        
    endmethod.

    method constructor.
        me->input = input.
        input_size = strlen( input ).
        me->actions = actions.
        me->offset = 0.
        me->failure = 0.

        
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
    method read_start.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'start' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'start' ] ).
            data(rule) = cache[ key = 'start' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'start' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_union_stmt( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_update_stmt( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_replace_insert_stmt( ).
                    if address0 = failure_node.
                        offset = index1.
                        address0 = read_proc_stmts( ).
                        if address0 = failure_node.
                            offset = index1.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_union_stmt.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'union_stmt' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'union_stmt' ] ).
            data(rule) = cache[ key = 'union_stmt' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'union_stmt' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_select_stmt( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_kw_union( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_select_stmt( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_union_stmt(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_union_stmt(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_select_stmt.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'select_stmt' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'select_stmt' ] ).
            data(rule) = cache[ key = 'select_stmt' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'select_stmt' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_select_stmt_nake( ).
            if address0 = failure_node.
                offset = index1.
                data(index2) = offset.
                data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements0.
                data(address1) = failure_node.
                if address1 <> failure_node.
                    append address1 to elements0.
                    data(address2) = failure_node.
                    address2 = read___( ).
                    if address2 <> failure_node.
                        append address2 to elements0.
                        data(address3) = failure_node.
                        address3 = read_select_stmt( ).
                        if address3 <> failure_node.
                            append address3 to elements0.
                            data(address4) = failure_node.
                            address4 = read___( ).
                            if address4 <> failure_node.
                                append address4 to elements0.
                                data(address5) = failure_node.
                                if address5 <> failure_node.
                                    append address5 to elements0.
                                else.
                                    clear elements0.
                                    offset = index2.
                                endif.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
                if elements0 is initial.
                    undefined = failure_node.
                else.
                    undefined = new zcl_sql_tree_node_select_stmt(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements0 ).
                    offset = offset.
                endif.
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_with_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'with_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'with_clause' ] ).
            data(rule) = cache[ key = 'with_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'with_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_with( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    data(index2) = offset.
                    undefined = read_kw_recursive( ).
                    if undefined = failure_node.
                        undefined = new zcl_sql_tree_node(
                            text = substring( val = input off = index2 len = index2 - index2 )
                            offset = index2
                            elements = value #( ) ).
                        offset = index2.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_with_list( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_with_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_with_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'with_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'with_list' ] ).
            data(rule) = cache[ key = 'with_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'with_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_with_list_element( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_comma( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_with_list_element( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_with_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_with_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_with_list_element.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'with_list_element' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'with_list_element' ] ).
            data(rule) = cache[ key = 'with_list_element' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'with_list_element' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_ident_name( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    data(index2) = offset.
                    undefined = read_with_column_list( ).
                    if undefined = failure_node.
                        undefined = new zcl_sql_tree_node(
                            text = substring( val = input off = index2 len = index2 - index2 )
                            offset = index2
                            elements = value #( ) ).
                        offset = index2.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            address5 = read_kw_as( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    address7 = read_lparen( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                        data(address8) = failure_node.
                                        address8 = read___( ).
                                        if address8 <> failure_node.
                                            append address8 to elements0.
                                            data(address9) = failure_node.
                                            undefined = read_union_stmt( ).
                                            if address9 <> failure_node.
                                                append address9 to elements0.
                                                data(address10) = failure_node.
                                                address10 = read___( ).
                                                if address10 <> failure_node.
                                                    append address10 to elements0.
                                                    data(address11) = failure_node.
                                                    address11 = read_rparen( ).
                                                    if address11 <> failure_node.
                                                        append address11 to elements0.
                                                    else.
                                                        clear elements0.
                                                        offset = index1.
                                                    endif.
                                                else.
                                                    clear elements0.
                                                    offset = index1.
                                                endif.
                                            else.
                                                clear elements0.
                                                offset = index1.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index1.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_with_list_element(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_with_column_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'with_column_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'with_column_list' ] ).
            data(rule) = cache[ key = 'with_column_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'with_column_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_lparen( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_column( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        data(index2) = offset.
                        data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                        clear elements1.
                        data address5 type ref to zcl_sql_tree_node.
                        clear address5.
                        do.
                            data(index3) = offset.
                            data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                            clear elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_comma( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                    data(address8) = failure_node.
                                    address8 = read___( ).
                                    if address8 <> failure_node.
                                        append address8 to elements2.
                                        data(address9) = failure_node.
                                        address9 = read_column( ).
                                        if address9 <> failure_node.
                                            append address9 to elements2.
                                        else.
                                            clear elements2.
                                            offset = index3.
                                        endif.
                                    else.
                                        clear elements2.
                                        offset = index3.
                                    endif.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                            if elements2 is initial.
                                undefined = failure_node.
                            else.
                                undefined = new zcl_sql_tree_node_with_column_list(
                                    text = substring( val = input off = index3 len = offset - index3 )
                                    offset = index3
                                    elements = elements2 ).
                                offset = offset.
                            endif.
                            if address5 <> failure_node.
                                append address5 to elements1.
                            else.
                                exit.
                            endif.
                        enddo.
                        if lines( elements1 ) >= 0.
                            undefined = new zcl_sql_tree_node(
                                text = substring( val = input off = index2 len = offset - index2 )
                                offset = index2
                                elements = elements1 ).
                            offset = offset.
                        else.
                            undefined = failure_node.
                        endif.
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address10) = failure_node.
                            address10 = read___( ).
                            if address10 <> failure_node.
                                append address10 to elements0.
                                data(address11) = failure_node.
                                address11 = read_rparen( ).
                                if address11 <> failure_node.
                                    append address11 to elements0.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_with_column_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_select_stmt_nake.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'select_stmt_nake' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'select_stmt_nake' ] ).
            data(rule) = cache[ key = 'select_stmt_nake' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'select_stmt_nake' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            data(index2) = offset.
            undefined = read_with_clause( ).
            if undefined = failure_node.
                undefined = new zcl_sql_tree_node(
                    text = substring( val = input off = index2 len = index2 - index2 )
                    offset = index2
                    elements = value #( ) ).
                offset = index2.
            endif.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_kw_select( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            data(index3) = offset.
                            undefined = read_option_clause( ).
                            if undefined = failure_node.
                                undefined = new zcl_sql_tree_node(
                                    text = substring( val = input off = index3 len = index3 - index3 )
                                    offset = index3
                                    elements = value #( ) ).
                                offset = index3.
                            endif.
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    data(index4) = offset.
                                    undefined = read_kw_distinct( ).
                                    if undefined = failure_node.
                                        undefined = new zcl_sql_tree_node(
                                            text = substring( val = input off = index4 len = index4 - index4 )
                                            offset = index4
                                            elements = value #( ) ).
                                        offset = index4.
                                    endif.
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                        data(address8) = failure_node.
                                        address8 = read___( ).
                                        if address8 <> failure_node.
                                            append address8 to elements0.
                                            data(address9) = failure_node.
                                            undefined = read_column_clause( ).
                                            if address9 <> failure_node.
                                                append address9 to elements0.
                                                data(address10) = failure_node.
                                                address10 = read___( ).
                                                if address10 <> failure_node.
                                                    append address10 to elements0.
                                                    data(address11) = failure_node.
                                                    data(index5) = offset.
                                                    undefined = read_from_clause( ).
                                                    if undefined = failure_node.
                                                        undefined = new zcl_sql_tree_node(
                                                            text = substring( val = input off = index5 len = index5 - index5 )
                                                            offset = index5
                                                            elements = value #( ) ).
                                                        offset = index5.
                                                    endif.
                                                    if address11 <> failure_node.
                                                        append address11 to elements0.
                                                        data(address12) = failure_node.
                                                        address12 = read___( ).
                                                        if address12 <> failure_node.
                                                            append address12 to elements0.
                                                            data(address13) = failure_node.
                                                            data(index6) = offset.
                                                            undefined = read_where_clause( ).
                                                            if undefined = failure_node.
                                                                undefined = new zcl_sql_tree_node(
                                                                    text = substring( val = input off = index6 len = index6 - index6 )
                                                                    offset = index6
                                                                    elements = value #( ) ).
                                                                offset = index6.
                                                            endif.
                                                            if address13 <> failure_node.
                                                                append address13 to elements0.
                                                                data(address14) = failure_node.
                                                                address14 = read___( ).
                                                                if address14 <> failure_node.
                                                                    append address14 to elements0.
                                                                    data(address15) = failure_node.
                                                                    data(index7) = offset.
                                                                    undefined = read_group_by_clause( ).
                                                                    if undefined = failure_node.
                                                                        undefined = new zcl_sql_tree_node(
                                                                            text = substring( val = input off = index7 len = index7 - index7 )
                                                                            offset = index7
                                                                            elements = value #( ) ).
                                                                        offset = index7.
                                                                    endif.
                                                                    if address15 <> failure_node.
                                                                        append address15 to elements0.
                                                                        data(address16) = failure_node.
                                                                        address16 = read___( ).
                                                                        if address16 <> failure_node.
                                                                            append address16 to elements0.
                                                                            data(address17) = failure_node.
                                                                            data(index8) = offset.
                                                                            undefined = read_having_clause( ).
                                                                            if undefined = failure_node.
                                                                                undefined = new zcl_sql_tree_node(
                                                                                    text = substring( val = input off = index8 len = index8 - index8 )
                                                                                    offset = index8
                                                                                    elements = value #( ) ).
                                                                                offset = index8.
                                                                            endif.
                                                                            if address17 <> failure_node.
                                                                                append address17 to elements0.
                                                                                data(address18) = failure_node.
                                                                                address18 = read___( ).
                                                                                if address18 <> failure_node.
                                                                                    append address18 to elements0.
                                                                                    data(address19) = failure_node.
                                                                                    data(index9) = offset.
                                                                                    undefined = read_order_by_clause( ).
                                                                                    if undefined = failure_node.
                                                                                        undefined = new zcl_sql_tree_node(
                                                                                            text = substring( val = input off = index9 len = index9 - index9 )
                                                                                            offset = index9
                                                                                            elements = value #( ) ).
                                                                                        offset = index9.
                                                                                    endif.
                                                                                    if address19 <> failure_node.
                                                                                        append address19 to elements0.
                                                                                        data(address20) = failure_node.
                                                                                        address20 = read___( ).
                                                                                        if address20 <> failure_node.
                                                                                            append address20 to elements0.
                                                                                            data(address21) = failure_node.
                                                                                            data(index10) = offset.
                                                                                            undefined = read_limit_clause( ).
                                                                                            if undefined = failure_node.
                                                                                                undefined = new zcl_sql_tree_node(
                                                                                                    text = substring( val = input off = index10 len = index10 - index10 )
                                                                                                    offset = index10
                                                                                                    elements = value #( ) ).
                                                                                                offset = index10.
                                                                                            endif.
                                                                                            if address21 <> failure_node.
                                                                                                append address21 to elements0.
                                                                                            else.
                                                                                                clear elements0.
                                                                                                offset = index1.
                                                                                            endif.
                                                                                        else.
                                                                                            clear elements0.
                                                                                            offset = index1.
                                                                                        endif.
                                                                                    else.
                                                                                        clear elements0.
                                                                                        offset = index1.
                                                                                    endif.
                                                                                else.
                                                                                    clear elements0.
                                                                                    offset = index1.
                                                                                endif.
                                                                            else.
                                                                                clear elements0.
                                                                                offset = index1.
                                                                            endif.
                                                                        else.
                                                                            clear elements0.
                                                                            offset = index1.
                                                                        endif.
                                                                    else.
                                                                        clear elements0.
                                                                        offset = index1.
                                                                    endif.
                                                                else.
                                                                    clear elements0.
                                                                    offset = index1.
                                                                endif.
                                                            else.
                                                                clear elements0.
                                                                offset = index1.
                                                            endif.
                                                        else.
                                                            clear elements0.
                                                            offset = index1.
                                                        endif.
                                                    else.
                                                        clear elements0.
                                                        offset = index1.
                                                    endif.
                                                else.
                                                    clear elements0.
                                                    offset = index1.
                                                endif.
                                            else.
                                                clear elements0.
                                                offset = index1.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index1.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_select_stmt_nake(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_option_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'option_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'option_clause' ] ).
            data(rule) = cache[ key = 'option_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'option_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_query_option( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_query_option( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_option_clause(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_option_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_query_option.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'query_option' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'query_option' ] ).
            data(rule) = cache[ key = 'query_option' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'query_option' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            undefined = read_opt_sql_calc_found_rows( ).
            if undefined = failure_node.
                offset = index1.
                data(index2) = offset.
                undefined = read_opt_sql_cache( ).
                if undefined = failure_node.
                    offset = index2.
                    undefined = read_opt_sql_no_cache( ).
                    if undefined = failure_node.
                        offset = index2.
                    endif.
                endif.
                if undefined = failure_node.
                    offset = index1.
                    undefined = read_opt_sql_big_result( ).
                    if undefined = failure_node.
                        offset = index1.
                        undefined = read_opt_sql_small_result( ).
                        if undefined = failure_node.
                            offset = index1.
                            undefined = read_opt_sql_buffer_result( ).
                            if undefined = failure_node.
                                offset = index1.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_column_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'column_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'column_clause' ] ).
            data(rule) = cache[ key = 'column_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'column_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            undefined = read_kw_all( ).
            if undefined = failure_node.
                offset = index2.
                data(index3) = offset.
                data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements0.
                data(address1) = failure_node.
                address1 = read_star( ).
                if address1 <> failure_node.
                    append address1 to elements0.
                    data(address2) = failure_node.
                    <>.
                    address2 = read_ident_start( ).
                    if address2 <> failure_node.
                        append address2 to elements0.
                    else.
                        clear elements0.
                        offset = index3.
                    endif.
                else.
                    clear elements0.
                    offset = index3.
                endif.
                if elements0 is initial.
                    undefined = failure_node.
                else.
                    undefined = new zcl_sql_tree_node_column_clause(
                        text = substring( val = input off = index3 len = offset - index3 )
                        offset = index3
                        elements = elements0 ).
                    offset = offset.
                endif.
                if undefined = failure_node.
                    offset = index2.
                endif.
            endif.
            if undefined = failure_node.
                offset = index1.
                data(index4) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address3) = failure_node.
                undefined = read_column_list_item( ).
                if address3 <> failure_node.
                    append address3 to elements1.
                    data(address4) = failure_node.
                    data(index5) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data address5 type ref to zcl_sql_tree_node.
                    clear address5.
                    do.
                        data(index6) = offset.
                        data elements3 type zcl_sql_tree_node=>tree_node_list_tab.
                        clear elements3.
                        data(address6) = failure_node.
                        address6 = read___( ).
                        if address6 <> failure_node.
                            append address6 to elements3.
                            data(address7) = failure_node.
                            address7 = read_comma( ).
                            if address7 <> failure_node.
                                append address7 to elements3.
                                data(address8) = failure_node.
                                address8 = read___( ).
                                if address8 <> failure_node.
                                    append address8 to elements3.
                                    data(address9) = failure_node.
                                    address9 = read_column_list_item( ).
                                    if address9 <> failure_node.
                                        append address9 to elements3.
                                    else.
                                        clear elements3.
                                        offset = index6.
                                    endif.
                                else.
                                    clear elements3.
                                    offset = index6.
                                endif.
                            else.
                                clear elements3.
                                offset = index6.
                            endif.
                        else.
                            clear elements3.
                            offset = index6.
                        endif.
                        if elements3 is initial.
                            undefined = failure_node.
                        else.
                            undefined = new zcl_sql_tree_node_column_clause(
                                text = substring( val = input off = index6 len = offset - index6 )
                                offset = index6
                                elements = elements3 ).
                            offset = offset.
                        endif.
                        if address5 <> failure_node.
                            append address5 to elements2.
                        else.
                            exit.
                        endif.
                    enddo.
                    if lines( elements2 ) >= 0.
                        undefined = new zcl_sql_tree_node(
                            text = substring( val = input off = index5 len = offset - index5 )
                            offset = index5
                            elements = elements2 ).
                        offset = offset.
                    else.
                        undefined = failure_node.
                    endif.
                    if address4 <> failure_node.
                        append address4 to elements1.
                    else.
                        clear elements1.
                        offset = index4.
                    endif.
                else.
                    clear elements1.
                    offset = index4.
                endif.
                if elements1 is initial.
                    undefined = failure_node.
                else.
                    undefined = new zcl_sql_tree_node_column_clause(
                        text = substring( val = input off = index4 len = offset - index4 )
                        offset = index4
                        elements = elements1 ).
                    offset = offset.
                endif.
                if undefined = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_column_list_item.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'column_list_item' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'column_list_item' ] ).
            data(rule) = cache[ key = 'column_list_item' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'column_list_item' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_ident( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_dot( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            address5 = read_star( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                address0 = new zcl_sql_tree_node_column_list_item(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                data(index3) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address6) = failure_node.
                undefined = read_expr( ).
                if address6 <> failure_node.
                    append address6 to elements1.
                    data(address7) = failure_node.
                    address7 = read___( ).
                    if address7 <> failure_node.
                        append address7 to elements1.
                        data(address8) = failure_node.
                        data(index4) = offset.
                        undefined = read_alias_clause( ).
                        if undefined = failure_node.
                            undefined = new zcl_sql_tree_node(
                                text = substring( val = input off = index4 len = index4 - index4 )
                                offset = index4
                                elements = value #( ) ).
                            offset = index4.
                        endif.
                        if address8 <> failure_node.
                            append address8 to elements1.
                        else.
                            clear elements1.
                            offset = index3.
                        endif.
                    else.
                        clear elements1.
                        offset = index3.
                    endif.
                else.
                    clear elements1.
                    offset = index3.
                endif.
                if elements1 is initial.
                    address0 = failure_node.
                else.
                    address0 = new zcl_sql_tree_node_column_list_item(
                        text = substring( val = input off = index3 len = offset - index3 )
                        offset = index3
                        elements = elements1 ).
                    offset = offset.
                endif.
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_alias_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'alias_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'alias_clause' ] ).
            data(rule) = cache[ key = 'alias_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'alias_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            data(index2) = offset.
            address1 = read_kw_as( ).
            if address1 = failure_node.
                address1 = new zcl_sql_tree_node(
                    text = substring( val = input off = index2 len = index2 - index2 )
                    offset = index2
                    elements = value #( ) ).
                offset = index2.
            endif.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_ident( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_alias_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_from_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'from_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'from_clause' ] ).
            data(rule) = cache[ key = 'from_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'from_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_from( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_table_ref_list( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_from_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_table_ref_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'table_ref_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'table_ref_list' ] ).
            data(rule) = cache[ key = 'table_ref_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'table_ref_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_table_ref( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        data(index4) = offset.
                        address5 = read_comma( ).
                        if address5 = failure_node.
                            address5 = new zcl_sql_tree_node(
                                text = substring( val = input off = index4 len = index4 - index4 )
                                offset = index4
                                elements = value #( ) ).
                            offset = index4.
                        endif.
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_table_ref( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_table_ref_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_table_ref_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_table_ref.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'table_ref' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'table_ref' ] ).
            data(rule) = cache[ key = 'table_ref' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'table_ref' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            undefined = read_table_primary( ).
            if undefined = failure_node.
                offset = index1.
                data(index2) = offset.
                data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements0.
                data(address1) = failure_node.
                undefined = read_join_op( ).
                if address1 <> failure_node.
                    append address1 to elements0.
                    data(address2) = failure_node.
                    address2 = read___( ).
                    if address2 <> failure_node.
                        append address2 to elements0.
                        data(address3) = failure_node.
                        undefined = read_table_ref( ).
                        if address3 <> failure_node.
                            append address3 to elements0.
                            data(address4) = failure_node.
                            address4 = read___( ).
                            if address4 <> failure_node.
                                append address4 to elements0.
                                data(address5) = failure_node.
                                undefined = read_join_spec( ).
                                if address5 <> failure_node.
                                    append address5 to elements0.
                                else.
                                    clear elements0.
                                    offset = index2.
                                endif.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
                if elements0 is initial.
                    undefined = failure_node.
                else.
                    undefined = new zcl_sql_tree_node_table_ref(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements0 ).
                    offset = offset.
                endif.
                if undefined = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_table_primary.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'table_primary' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'table_primary' ] ).
            data(rule) = cache[ key = 'table_primary' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'table_primary' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_kw_dual( ).
            if address0 = failure_node.
                offset = index1.
                data(index2) = offset.
                data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements0.
                data(address1) = failure_node.
                address1 = read_lparen( ).
                if address1 <> failure_node.
                    append address1 to elements0.
                    data(address2) = failure_node.
                    address2 = read___( ).
                    if address2 <> failure_node.
                        append address2 to elements0.
                        data(address3) = failure_node.
                        address3 = read_kw_values( ).
                        if address3 <> failure_node.
                            append address3 to elements0.
                            data(address4) = failure_node.
                            address4 = read___( ).
                            if address4 <> failure_node.
                                append address4 to elements0.
                                data(address5) = failure_node.
                                undefined = read_table_row_value_expr_list( ).
                                if address5 <> failure_node.
                                    append address5 to elements0.
                                    data(address6) = failure_node.
                                    address6 = read___( ).
                                    if address6 <> failure_node.
                                        append address6 to elements0.
                                        data(address7) = failure_node.
                                        address7 = read_rparen( ).
                                        if address7 <> failure_node.
                                            append address7 to elements0.
                                            data(address8) = failure_node.
                                            address8 = read___( ).
                                            if address8 <> failure_node.
                                                append address8 to elements0.
                                                data(address9) = failure_node.
                                                data(index3) = offset.
                                                address9 = read_kw_as( ).
                                                if address9 = failure_node.
                                                    address9 = new zcl_sql_tree_node(
                                                        text = substring( val = input off = index3 len = index3 - index3 )
                                                        offset = index3
                                                        elements = value #( ) ).
                                                    offset = index3.
                                                endif.
                                                if address9 <> failure_node.
                                                    append address9 to elements0.
                                                    data(address10) = failure_node.
                                                    address10 = read___( ).
                                                    if address10 <> failure_node.
                                                        append address10 to elements0.
                                                        data(address11) = failure_node.
                                                        undefined = read_ident( ).
                                                        if address11 <> failure_node.
                                                            append address11 to elements0.
                                                            data(address12) = failure_node.
                                                            address12 = read___( ).
                                                            if address12 <> failure_node.
                                                                append address12 to elements0.
                                                                data(address13) = failure_node.
                                                                data(index4) = offset.
                                                                undefined = read_derived_col_list( ).
                                                                if undefined = failure_node.
                                                                    undefined = new zcl_sql_tree_node(
                                                                        text = substring( val = input off = index4 len = index4 - index4 )
                                                                        offset = index4
                                                                        elements = value #( ) ).
                                                                    offset = index4.
                                                                endif.
                                                                if address13 <> failure_node.
                                                                    append address13 to elements0.
                                                                else.
                                                                    clear elements0.
                                                                    offset = index2.
                                                                endif.
                                                            else.
                                                                clear elements0.
                                                                offset = index2.
                                                            endif.
                                                        else.
                                                            clear elements0.
                                                            offset = index2.
                                                        endif.
                                                    else.
                                                        clear elements0.
                                                        offset = index2.
                                                    endif.
                                                else.
                                                    clear elements0.
                                                    offset = index2.
                                                endif.
                                            else.
                                                clear elements0.
                                                offset = index2.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index2.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index2.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index2.
                                endif.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
                if elements0 is initial.
                    address0 = failure_node.
                else.
                    address0 = new zcl_sql_tree_node_table_primary(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements0 ).
                    offset = offset.
                endif.
                if address0 = failure_node.
                    offset = index1.
                    data(index5) = offset.
                    data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements1.
                    data(address14) = failure_node.
                    data(index6) = offset.
                    undefined = read_kw_lateral( ).
                    if undefined = failure_node.
                        undefined = new zcl_sql_tree_node(
                            text = substring( val = input off = index6 len = index6 - index6 )
                            offset = index6
                            elements = value #( ) ).
                        offset = index6.
                    endif.
                    if address14 <> failure_node.
                        append address14 to elements1.
                        data(address15) = failure_node.
                        address15 = read___( ).
                        if address15 <> failure_node.
                            append address15 to elements1.
                            data(address16) = failure_node.
                            undefined = read_sub_query( ).
                            if address16 <> failure_node.
                                append address16 to elements1.
                                data(address17) = failure_node.
                                address17 = read___( ).
                                if address17 <> failure_node.
                                    append address17 to elements1.
                                    data(address18) = failure_node.
                                    data(index7) = offset.
                                    address18 = read_kw_as( ).
                                    if address18 = failure_node.
                                        address18 = new zcl_sql_tree_node(
                                            text = substring( val = input off = index7 len = index7 - index7 )
                                            offset = index7
                                            elements = value #( ) ).
                                        offset = index7.
                                    endif.
                                    if address18 <> failure_node.
                                        append address18 to elements1.
                                        data(address19) = failure_node.
                                        address19 = read___( ).
                                        if address19 <> failure_node.
                                            append address19 to elements1.
                                            data(address20) = failure_node.
                                            undefined = read_ident( ).
                                            if address20 <> failure_node.
                                                append address20 to elements1.
                                                data(address21) = failure_node.
                                                address21 = read___( ).
                                                if address21 <> failure_node.
                                                    append address21 to elements1.
                                                    data(address22) = failure_node.
                                                    data(index8) = offset.
                                                    undefined = read_derived_col_list( ).
                                                    if undefined = failure_node.
                                                        undefined = new zcl_sql_tree_node(
                                                            text = substring( val = input off = index8 len = index8 - index8 )
                                                            offset = index8
                                                            elements = value #( ) ).
                                                        offset = index8.
                                                    endif.
                                                    if address22 <> failure_node.
                                                        append address22 to elements1.
                                                    else.
                                                        clear elements1.
                                                        offset = index5.
                                                    endif.
                                                else.
                                                    clear elements1.
                                                    offset = index5.
                                                endif.
                                            else.
                                                clear elements1.
                                                offset = index5.
                                            endif.
                                        else.
                                            clear elements1.
                                            offset = index5.
                                        endif.
                                    else.
                                        clear elements1.
                                        offset = index5.
                                    endif.
                                else.
                                    clear elements1.
                                    offset = index5.
                                endif.
                            else.
                                clear elements1.
                                offset = index5.
                            endif.
                        else.
                            clear elements1.
                            offset = index5.
                        endif.
                    else.
                        clear elements1.
                        offset = index5.
                    endif.
                    if elements1 is initial.
                        address0 = failure_node.
                    else.
                        address0 = new zcl_sql_tree_node_table_primary(
                            text = substring( val = input off = index5 len = offset - index5 )
                            offset = index5
                            elements = elements1 ).
                        offset = offset.
                    endif.
                    if address0 = failure_node.
                        offset = index1.
                        data(index9) = offset.
                        data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                        clear elements2.
                        data(address23) = failure_node.
                        undefined = read_table_name( ).
                        if address23 <> failure_node.
                            append address23 to elements2.
                            data(address24) = failure_node.
                            address24 = read___( ).
                            if address24 <> failure_node.
                                append address24 to elements2.
                                data(address25) = failure_node.
                                data(index10) = offset.
                                address25 = read_kw_as( ).
                                if address25 = failure_node.
                                    address25 = new zcl_sql_tree_node(
                                        text = substring( val = input off = index10 len = index10 - index10 )
                                        offset = index10
                                        elements = value #( ) ).
                                    offset = index10.
                                endif.
                                if address25 <> failure_node.
                                    append address25 to elements2.
                                    data(address26) = failure_node.
                                    address26 = read___( ).
                                    if address26 <> failure_node.
                                        append address26 to elements2.
                                        data(address27) = failure_node.
                                        data(index11) = offset.
                                        undefined = read_ident( ).
                                        if undefined = failure_node.
                                            undefined = new zcl_sql_tree_node(
                                                text = substring( val = input off = index11 len = index11 - index11 )
                                                offset = index11
                                                elements = value #( ) ).
                                            offset = index11.
                                        endif.
                                        if address27 <> failure_node.
                                            append address27 to elements2.
                                        else.
                                            clear elements2.
                                            offset = index9.
                                        endif.
                                    else.
                                        clear elements2.
                                        offset = index9.
                                    endif.
                                else.
                                    clear elements2.
                                    offset = index9.
                                endif.
                            else.
                                clear elements2.
                                offset = index9.
                            endif.
                        else.
                            clear elements2.
                            offset = index9.
                        endif.
                        if elements2 is initial.
                            address0 = failure_node.
                        else.
                            address0 = new zcl_sql_tree_node_table_primary(
                                text = substring( val = input off = index9 len = offset - index9 )
                                offset = index9
                                elements = elements2 ).
                            offset = offset.
                        endif.
                        if address0 = failure_node.
                            offset = index1.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_join_op.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'join_op' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'join_op' ] ).
            data(rule) = cache[ key = 'join_op' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'join_op' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_left( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    data(index3) = offset.
                    address3 = read_kw_outer( ).
                    if address3 = failure_node.
                        address3 = new zcl_sql_tree_node(
                            text = substring( val = input off = index3 len = index3 - index3 )
                            offset = index3
                            elements = value #( ) ).
                        offset = index3.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            address5 = read_kw_join( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                address0 = new zcl_sql_tree_node_join_op(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                data(index4) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address6) = failure_node.
                address6 = read_kw_right( ).
                if address6 <> failure_node.
                    append address6 to elements1.
                    data(address7) = failure_node.
                    address7 = read___( ).
                    if address7 <> failure_node.
                        append address7 to elements1.
                        data(address8) = failure_node.
                        data(index5) = offset.
                        address8 = read_kw_outer( ).
                        if address8 = failure_node.
                            address8 = new zcl_sql_tree_node(
                                text = substring( val = input off = index5 len = index5 - index5 )
                                offset = index5
                                elements = value #( ) ).
                            offset = index5.
                        endif.
                        if address8 <> failure_node.
                            append address8 to elements1.
                            data(address9) = failure_node.
                            address9 = read___( ).
                            if address9 <> failure_node.
                                append address9 to elements1.
                                data(address10) = failure_node.
                                address10 = read_kw_join( ).
                                if address10 <> failure_node.
                                    append address10 to elements1.
                                else.
                                    clear elements1.
                                    offset = index4.
                                endif.
                            else.
                                clear elements1.
                                offset = index4.
                            endif.
                        else.
                            clear elements1.
                            offset = index4.
                        endif.
                    else.
                        clear elements1.
                        offset = index4.
                    endif.
                else.
                    clear elements1.
                    offset = index4.
                endif.
                if elements1 is initial.
                    address0 = failure_node.
                else.
                    address0 = new zcl_sql_tree_node_join_op(
                        text = substring( val = input off = index4 len = offset - index4 )
                        offset = index4
                        elements = elements1 ).
                    offset = offset.
                endif.
                if address0 = failure_node.
                    offset = index1.
                    data(index6) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address11) = failure_node.
                    address11 = read_kw_full( ).
                    if address11 <> failure_node.
                        append address11 to elements2.
                        data(address12) = failure_node.
                        address12 = read___( ).
                        if address12 <> failure_node.
                            append address12 to elements2.
                            data(address13) = failure_node.
                            data(index7) = offset.
                            address13 = read_kw_outer( ).
                            if address13 = failure_node.
                                address13 = new zcl_sql_tree_node(
                                    text = substring( val = input off = index7 len = index7 - index7 )
                                    offset = index7
                                    elements = value #( ) ).
                                offset = index7.
                            endif.
                            if address13 <> failure_node.
                                append address13 to elements2.
                                data(address14) = failure_node.
                                address14 = read___( ).
                                if address14 <> failure_node.
                                    append address14 to elements2.
                                    data(address15) = failure_node.
                                    address15 = read_kw_join( ).
                                    if address15 <> failure_node.
                                        append address15 to elements2.
                                    else.
                                        clear elements2.
                                        offset = index6.
                                    endif.
                                else.
                                    clear elements2.
                                    offset = index6.
                                endif.
                            else.
                                clear elements2.
                                offset = index6.
                            endif.
                        else.
                            clear elements2.
                            offset = index6.
                        endif.
                    else.
                        clear elements2.
                        offset = index6.
                    endif.
                    if elements2 is initial.
                        address0 = failure_node.
                    else.
                        address0 = new zcl_sql_tree_node_join_op(
                            text = substring( val = input off = index6 len = offset - index6 )
                            offset = index6
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address0 = failure_node.
                        offset = index1.
                        data(index8) = offset.
                        data elements3 type zcl_sql_tree_node=>tree_node_list_tab.
                        clear elements3.
                        data(address16) = failure_node.
                        data(index9) = offset.
                        data(index10) = offset.
                        data elements4 type zcl_sql_tree_node=>tree_node_list_tab.
                        clear elements4.
                        data(address17) = failure_node.
                        address17 = read_kw_inner( ).
                        if address17 <> failure_node.
                            append address17 to elements4.
                            data(address18) = failure_node.
                            address18 = read___( ).
                            if address18 <> failure_node.
                                append address18 to elements4.
                            else.
                                clear elements4.
                                offset = index10.
                            endif.
                        else.
                            clear elements4.
                            offset = index10.
                        endif.
                        if elements4 is initial.
                            undefined = failure_node.
                        else.
                            undefined = new zcl_sql_tree_node_join_op(
                                text = substring( val = input off = index10 len = offset - index10 )
                                offset = index10
                                elements = elements4 ).
                            offset = offset.
                        endif.
                        if address16 = failure_node.
                            address16 = new zcl_sql_tree_node(
                                text = substring( val = input off = index9 len = index9 - index9 )
                                offset = index9
                                elements = value #( ) ).
                            offset = index9.
                        endif.
                        if address16 <> failure_node.
                            append address16 to elements3.
                            data(address19) = failure_node.
                            address19 = read_kw_join( ).
                            if address19 <> failure_node.
                                append address19 to elements3.
                            else.
                                clear elements3.
                                offset = index8.
                            endif.
                        else.
                            clear elements3.
                            offset = index8.
                        endif.
                        if elements3 is initial.
                            address0 = failure_node.
                        else.
                            address0 = new zcl_sql_tree_node_join_op(
                                text = substring( val = input off = index8 len = offset - index8 )
                                offset = index8
                                elements = elements3 ).
                            offset = offset.
                        endif.
                        if address0 = failure_node.
                            offset = index1.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_join_spec.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'join_spec' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'join_spec' ] ).
            data(rule) = cache[ key = 'join_spec' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'join_spec' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_on( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_expr( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_join_spec(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if undefined = failure_node.
                offset = index1.
                data(index3) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address4) = failure_node.
                address4 = read_kw_using( ).
                if address4 <> failure_node.
                    append address4 to elements1.
                    data(address5) = failure_node.
                    address5 = read___( ).
                    if address5 <> failure_node.
                        append address5 to elements1.
                        data(address6) = failure_node.
                        address6 = read_lparen( ).
                        if address6 <> failure_node.
                            append address6 to elements1.
                            data(address7) = failure_node.
                            address7 = read___( ).
                            if address7 <> failure_node.
                                append address7 to elements1.
                                data(address8) = failure_node.
                                undefined = read_ident_name( ).
                                if address8 <> failure_node.
                                    append address8 to elements1.
                                    data(address9) = failure_node.
                                    data(index4) = offset.
                                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                                    clear elements2.
                                    data address10 type ref to zcl_sql_tree_node.
                                    clear address10.
                                    do.
                                        data(index5) = offset.
                                        data elements3 type zcl_sql_tree_node=>tree_node_list_tab.
                                        clear elements3.
                                        data(address11) = failure_node.
                                        address11 = read___( ).
                                        if address11 <> failure_node.
                                            append address11 to elements3.
                                            data(address12) = failure_node.
                                            address12 = read_comma( ).
                                            if address12 <> failure_node.
                                                append address12 to elements3.
                                                data(address13) = failure_node.
                                                address13 = read___( ).
                                                if address13 <> failure_node.
                                                    append address13 to elements3.
                                                    data(address14) = failure_node.
                                                    address14 = read_ident_name( ).
                                                    if address14 <> failure_node.
                                                        append address14 to elements3.
                                                    else.
                                                        clear elements3.
                                                        offset = index5.
                                                    endif.
                                                else.
                                                    clear elements3.
                                                    offset = index5.
                                                endif.
                                            else.
                                                clear elements3.
                                                offset = index5.
                                            endif.
                                        else.
                                            clear elements3.
                                            offset = index5.
                                        endif.
                                        if elements3 is initial.
                                            undefined = failure_node.
                                        else.
                                            undefined = new zcl_sql_tree_node_join_spec(
                                                text = substring( val = input off = index5 len = offset - index5 )
                                                offset = index5
                                                elements = elements3 ).
                                            offset = offset.
                                        endif.
                                        if address10 <> failure_node.
                                            append address10 to elements2.
                                        else.
                                            exit.
                                        endif.
                                    enddo.
                                    if lines( elements2 ) >= 0.
                                        undefined = new zcl_sql_tree_node(
                                            text = substring( val = input off = index4 len = offset - index4 )
                                            offset = index4
                                            elements = elements2 ).
                                        offset = offset.
                                    else.
                                        undefined = failure_node.
                                    endif.
                                    if address9 <> failure_node.
                                        append address9 to elements1.
                                        data(address15) = failure_node.
                                        address15 = read___( ).
                                        if address15 <> failure_node.
                                            append address15 to elements1.
                                            data(address16) = failure_node.
                                            address16 = read_rparen( ).
                                            if address16 <> failure_node.
                                                append address16 to elements1.
                                            else.
                                                clear elements1.
                                                offset = index3.
                                            endif.
                                        else.
                                            clear elements1.
                                            offset = index3.
                                        endif.
                                    else.
                                        clear elements1.
                                        offset = index3.
                                    endif.
                                else.
                                    clear elements1.
                                    offset = index3.
                                endif.
                            else.
                                clear elements1.
                                offset = index3.
                            endif.
                        else.
                            clear elements1.
                            offset = index3.
                        endif.
                    else.
                        clear elements1.
                        offset = index3.
                    endif.
                else.
                    clear elements1.
                    offset = index3.
                endif.
                if elements1 is initial.
                    undefined = failure_node.
                else.
                    undefined = new zcl_sql_tree_node_join_spec(
                        text = substring( val = input off = index3 len = offset - index3 )
                        offset = index3
                        elements = elements1 ).
                    offset = offset.
                endif.
                if undefined = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_table_name.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'table_name' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'table_name' ] ).
            data(rule) = cache[ key = 'table_name' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'table_name' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_ident( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index3) = offset.
                data(index4) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address3) = failure_node.
                address3 = read___( ).
                if address3 <> failure_node.
                    append address3 to elements1.
                    data(address4) = failure_node.
                    address4 = read_dot( ).
                    if address4 <> failure_node.
                        append address4 to elements1.
                        data(address5) = failure_node.
                        address5 = read___( ).
                        if address5 <> failure_node.
                            append address5 to elements1.
                            data(address6) = failure_node.
                            address6 = read_ident( ).
                            if address6 <> failure_node.
                                append address6 to elements1.
                            else.
                                clear elements1.
                                offset = index4.
                            endif.
                        else.
                            clear elements1.
                            offset = index4.
                        endif.
                    else.
                        clear elements1.
                        offset = index4.
                    endif.
                else.
                    clear elements1.
                    offset = index4.
                endif.
                if elements1 is initial.
                    undefined = failure_node.
                else.
                    undefined = new zcl_sql_tree_node_table_name(
                        text = substring( val = input off = index4 len = offset - index4 )
                        offset = index4
                        elements = elements1 ).
                    offset = offset.
                endif.
                if undefined = failure_node.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index3 len = index3 - index3 )
                        offset = index3
                        elements = value #( ) ).
                    offset = index3.
                endif.
                if address2 <> failure_node.
                    append address2 to elements0.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                address0 = new zcl_sql_tree_node_table_name(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                undefined = read_var_decl( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_table_row_value_expr_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'table_row_value_expr_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'table_row_value_expr_list' ] ).
            data(rule) = cache[ key = 'table_row_value_expr_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'table_row_value_expr_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_row_value_constructor( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_comma( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_row_value_constructor( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_table_row_value_expr_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_table_row_value_expr_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_row_value_constructor.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'row_value_constructor' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'row_value_constructor' ] ).
            data(rule) = cache[ key = 'row_value_constructor' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'row_value_constructor' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            data(index2) = offset.
            undefined = read_kw_row( ).
            if undefined = failure_node.
                undefined = new zcl_sql_tree_node(
                    text = substring( val = input off = index2 len = index2 - index2 )
                    offset = index2
                    elements = value #( ) ).
                offset = index2.
            endif.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_lparen( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_literal( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    data(index3) = offset.
                                    data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                                    clear elements1.
                                    data address8 type ref to zcl_sql_tree_node.
                                    clear address8.
                                    do.
                                        data(index4) = offset.
                                        data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                                        clear elements2.
                                        data(address9) = failure_node.
                                        address9 = read___( ).
                                        if address9 <> failure_node.
                                            append address9 to elements2.
                                            data(address10) = failure_node.
                                            address10 = read_comma( ).
                                            if address10 <> failure_node.
                                                append address10 to elements2.
                                                data(address11) = failure_node.
                                                address11 = read___( ).
                                                if address11 <> failure_node.
                                                    append address11 to elements2.
                                                    data(address12) = failure_node.
                                                    address12 = read_literal( ).
                                                    if address12 <> failure_node.
                                                        append address12 to elements2.
                                                    else.
                                                        clear elements2.
                                                        offset = index4.
                                                    endif.
                                                else.
                                                    clear elements2.
                                                    offset = index4.
                                                endif.
                                            else.
                                                clear elements2.
                                                offset = index4.
                                            endif.
                                        else.
                                            clear elements2.
                                            offset = index4.
                                        endif.
                                        if elements2 is initial.
                                            undefined = failure_node.
                                        else.
                                            undefined = new zcl_sql_tree_node_row_value_constructor(
                                                text = substring( val = input off = index4 len = offset - index4 )
                                                offset = index4
                                                elements = elements2 ).
                                            offset = offset.
                                        endif.
                                        if address8 <> failure_node.
                                            append address8 to elements1.
                                        else.
                                            exit.
                                        endif.
                                    enddo.
                                    if lines( elements1 ) >= 0.
                                        undefined = new zcl_sql_tree_node(
                                            text = substring( val = input off = index3 len = offset - index3 )
                                            offset = index3
                                            elements = elements1 ).
                                        offset = offset.
                                    else.
                                        undefined = failure_node.
                                    endif.
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                        data(address13) = failure_node.
                                        address13 = read___( ).
                                        if address13 <> failure_node.
                                            append address13 to elements0.
                                            data(address14) = failure_node.
                                            address14 = read_rparen( ).
                                            if address14 <> failure_node.
                                                append address14 to elements0.
                                            else.
                                                clear elements0.
                                                offset = index1.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index1.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_row_value_constructor(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_on_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'on_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'on_clause' ] ).
            data(rule) = cache[ key = 'on_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'on_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_on( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_expr( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_on_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_sub_query.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'sub_query' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'sub_query' ] ).
            data(rule) = cache[ key = 'sub_query' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'sub_query' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_lparen( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_union_stmt( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            address5 = read_rparen( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_sub_query(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_derived_col_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'derived_col_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'derived_col_list' ] ).
            data(rule) = cache[ key = 'derived_col_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'derived_col_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_lparen( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_ident( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            data(index2) = offset.
                            data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                            clear elements1.
                            data address6 type ref to zcl_sql_tree_node.
                            clear address6.
                            do.
                                data(index3) = offset.
                                data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                                clear elements2.
                                data(address7) = failure_node.
                                address7 = read___( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                    data(address8) = failure_node.
                                    address8 = read_comma( ).
                                    if address8 <> failure_node.
                                        append address8 to elements2.
                                        data(address9) = failure_node.
                                        address9 = read___( ).
                                        if address9 <> failure_node.
                                            append address9 to elements2.
                                            data(address10) = failure_node.
                                            address10 = read_ident( ).
                                            if address10 <> failure_node.
                                                append address10 to elements2.
                                            else.
                                                clear elements2.
                                                offset = index3.
                                            endif.
                                        else.
                                            clear elements2.
                                            offset = index3.
                                        endif.
                                    else.
                                        clear elements2.
                                        offset = index3.
                                    endif.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                                if elements2 is initial.
                                    undefined = failure_node.
                                else.
                                    undefined = new zcl_sql_tree_node_derived_col_list(
                                        text = substring( val = input off = index3 len = offset - index3 )
                                        offset = index3
                                        elements = elements2 ).
                                    offset = offset.
                                endif.
                                if address6 <> failure_node.
                                    append address6 to elements1.
                                else.
                                    exit.
                                endif.
                            enddo.
                            if lines( elements1 ) >= 0.
                                undefined = new zcl_sql_tree_node(
                                    text = substring( val = input off = index2 len = offset - index2 )
                                    offset = index2
                                    elements = elements1 ).
                                offset = offset.
                            else.
                                undefined = failure_node.
                            endif.
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address11) = failure_node.
                                address11 = read___( ).
                                if address11 <> failure_node.
                                    append address11 to elements0.
                                    data(address12) = failure_node.
                                    address12 = read_rparen( ).
                                    if address12 <> failure_node.
                                        append address12 to elements0.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_derived_col_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_where_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'where_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'where_clause' ] ).
            data(rule) = cache[ key = 'where_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'where_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_where( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_expr( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_where_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_group_by_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'group_by_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'group_by_clause' ] ).
            data(rule) = cache[ key = 'group_by_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'group_by_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_group( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_kw_by( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_column_ref_list( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_group_by_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_column_ref_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'column_ref_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'column_ref_list' ] ).
            data(rule) = cache[ key = 'column_ref_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'column_ref_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_column_ref( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_comma( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_column_ref( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_column_ref_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_column_ref_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_having_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'having_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'having_clause' ] ).
            data(rule) = cache[ key = 'having_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'having_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_having( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_expr( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_having_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_order_by_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'order_by_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'order_by_clause' ] ).
            data(rule) = cache[ key = 'order_by_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'order_by_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_order( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_kw_by( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_order_by_list( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_order_by_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_order_by_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'order_by_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'order_by_list' ] ).
            data(rule) = cache[ key = 'order_by_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'order_by_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_order_by_element( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_comma( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_order_by_element( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_order_by_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_order_by_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_order_by_element.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'order_by_element' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'order_by_element' ] ).
            data(rule) = cache[ key = 'order_by_element' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'order_by_element' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_expr( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    data(index2) = offset.
                    data(index3) = offset.
                    undefined = read_kw_desc( ).
                    if undefined = failure_node.
                        offset = index3.
                        undefined = read_kw_asc( ).
                        if undefined = failure_node.
                            offset = index3.
                        endif.
                    endif.
                    if undefined = failure_node.
                        undefined = new zcl_sql_tree_node(
                            text = substring( val = input off = index2 len = index2 - index2 )
                            offset = index2
                            elements = value #( ) ).
                        offset = index2.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_order_by_element(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_number_or_param.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'number_or_param' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'number_or_param' ] ).
            data(rule) = cache[ key = 'number_or_param' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'number_or_param' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_literal_numeric( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_param( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_limit_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'limit_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'limit_clause' ] ).
            data(rule) = cache[ key = 'limit_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'limit_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_limit( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_number_or_param( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            data(index2) = offset.
                            data(index3) = offset.
                            data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                            clear elements1.
                            data(address6) = failure_node.
                            address6 = read_comma( ).
                            if address6 <> failure_node.
                                append address6 to elements1.
                                data(address7) = failure_node.
                                address7 = read___( ).
                                if address7 <> failure_node.
                                    append address7 to elements1.
                                    data(address8) = failure_node.
                                    address8 = read_number_or_param( ).
                                    if address8 <> failure_node.
                                        append address8 to elements1.
                                    else.
                                        clear elements1.
                                        offset = index3.
                                    endif.
                                else.
                                    clear elements1.
                                    offset = index3.
                                endif.
                            else.
                                clear elements1.
                                offset = index3.
                            endif.
                            if elements1 is initial.
                                undefined = failure_node.
                            else.
                                undefined = new zcl_sql_tree_node_limit_clause(
                                    text = substring( val = input off = index3 len = offset - index3 )
                                    offset = index3
                                    elements = elements1 ).
                                offset = offset.
                            endif.
                            if undefined = failure_node.
                                undefined = new zcl_sql_tree_node(
                                    text = substring( val = input off = index2 len = index2 - index2 )
                                    offset = index2
                                    elements = value #( ) ).
                                offset = index2.
                            endif.
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_limit_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_update_stmt.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'update_stmt' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'update_stmt' ] ).
            data(rule) = cache[ key = 'update_stmt' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'update_stmt' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_update( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_table_name( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            address5 = read_kw_set( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    undefined = read_set_list( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                        data(address8) = failure_node.
                                        address8 = read___( ).
                                        if address8 <> failure_node.
                                            append address8 to elements0.
                                            data(address9) = failure_node.
                                            undefined = read_where_clause( ).
                                            if address9 <> failure_node.
                                                append address9 to elements0.
                                            else.
                                                clear elements0.
                                                offset = index1.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index1.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_update_stmt(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_set_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'set_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'set_list' ] ).
            data(rule) = cache[ key = 'set_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'set_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_set_item( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_comma( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_set_item( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_set_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_set_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_set_item.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'set_item' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'set_item' ] ).
            data(rule) = cache[ key = 'set_item' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'set_item' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_column_name( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_additive_expr( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_set_item(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_replace_insert_stmt.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'replace_insert_stmt' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'replace_insert_stmt' ] ).
            data(rule) = cache[ key = 'replace_insert_stmt' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'replace_insert_stmt' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_replace_insert( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_kw_into( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_table_name( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    address7 = read_lparen( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                        data(address8) = failure_node.
                                        address8 = read___( ).
                                        if address8 <> failure_node.
                                            append address8 to elements0.
                                            data(address9) = failure_node.
                                            undefined = read_column_list( ).
                                            if address9 <> failure_node.
                                                append address9 to elements0.
                                                data(address10) = failure_node.
                                                address10 = read___( ).
                                                if address10 <> failure_node.
                                                    append address10 to elements0.
                                                    data(address11) = failure_node.
                                                    address11 = read_rparen( ).
                                                    if address11 <> failure_node.
                                                        append address11 to elements0.
                                                        data(address12) = failure_node.
                                                        address12 = read___( ).
                                                        if address12 <> failure_node.
                                                            append address12 to elements0.
                                                            data(address13) = failure_node.
                                                            undefined = read_value_clause( ).
                                                            if address13 <> failure_node.
                                                                append address13 to elements0.
                                                            else.
                                                                clear elements0.
                                                                offset = index1.
                                                            endif.
                                                        else.
                                                            clear elements0.
                                                            offset = index1.
                                                        endif.
                                                    else.
                                                        clear elements0.
                                                        offset = index1.
                                                    endif.
                                                else.
                                                    clear elements0.
                                                    offset = index1.
                                                endif.
                                            else.
                                                clear elements0.
                                                offset = index1.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index1.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_replace_insert_stmt(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_replace_insert.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'replace_insert' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'replace_insert' ] ).
            data(rule) = cache[ key = 'replace_insert' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'replace_insert' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_kw_insert( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_replace( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_value_clause.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'value_clause' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'value_clause' ] ).
            data(rule) = cache[ key = 'value_clause' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'value_clause' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_values( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_value_list( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_value_clause(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_value_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'value_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'value_list' ] ).
            data(rule) = cache[ key = 'value_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'value_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_value_item( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_comma( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_value_item( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_value_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_value_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_value_item.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'value_item' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'value_item' ] ).
            data(rule) = cache[ key = 'value_item' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'value_item' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_lparen( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_expr_list( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            address5 = read_rparen( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_value_item(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_expr_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'expr_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'expr_list' ] ).
            data(rule) = cache[ key = 'expr_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'expr_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_expr( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_comma( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_expr( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_expr_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_expr_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_case_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'case_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'case_expr' ] ).
            data(rule) = cache[ key = 'case_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'case_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_case( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    data(index2) = offset.
                    undefined = read_expr( ).
                    if undefined = failure_node.
                        undefined = new zcl_sql_tree_node(
                            text = substring( val = input off = index2 len = index2 - index2 )
                            offset = index2
                            elements = value #( ) ).
                        offset = index2.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            data(index3) = offset.
                            data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                            clear elements1.
                            data address6 type ref to zcl_sql_tree_node.
                            clear address6.
                            do.
                                address6 = read_case_when_then( ).
                                if address6 <> failure_node.
                                    append address6 to elements1.
                                else.
                                    exit.
                                endif.
                            enddo.
                            if lines( elements1 ) >= 0 and lines( elements1 ) <= 1.
                                undefined = new zcl_sql_tree_node(
                                    text = substring( val = input off = index3 len = offset - index3 )
                                    offset = index3
                                    elements = elements1 ).
                                offset = offset.
                            else.
                                undefined = failure_node.
                            endif.
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address7) = failure_node.
                                address7 = read___( ).
                                if address7 <> failure_node.
                                    append address7 to elements0.
                                    data(address8) = failure_node.
                                    data(index4) = offset.
                                    undefined = read_case_else( ).
                                    if undefined = failure_node.
                                        undefined = new zcl_sql_tree_node(
                                            text = substring( val = input off = index4 len = index4 - index4 )
                                            offset = index4
                                            elements = value #( ) ).
                                        offset = index4.
                                    endif.
                                    if address8 <> failure_node.
                                        append address8 to elements0.
                                        data(address9) = failure_node.
                                        address9 = read___( ).
                                        if address9 <> failure_node.
                                            append address9 to elements0.
                                            data(address10) = failure_node.
                                            address10 = read_kw_end( ).
                                            if address10 <> failure_node.
                                                append address10 to elements0.
                                                data(address11) = failure_node.
                                                address11 = read___( ).
                                                if address11 <> failure_node.
                                                    append address11 to elements0.
                                                    data(address12) = failure_node.
                                                    data(index5) = offset.
                                                    address12 = read_kw_case( ).
                                                    if address12 = failure_node.
                                                        address12 = new zcl_sql_tree_node(
                                                            text = substring( val = input off = index5 len = index5 - index5 )
                                                            offset = index5
                                                            elements = value #( ) ).
                                                        offset = index5.
                                                    endif.
                                                    if address12 <> failure_node.
                                                        append address12 to elements0.
                                                    else.
                                                        clear elements0.
                                                        offset = index1.
                                                    endif.
                                                else.
                                                    clear elements0.
                                                    offset = index1.
                                                endif.
                                            else.
                                                clear elements0.
                                                offset = index1.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index1.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_case_expr(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_case_when_then.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'case_when_then' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'case_when_then' ] ).
            data(rule) = cache[ key = 'case_when_then' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'case_when_then' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_when( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_expr( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            address5 = read_kw_then( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    undefined = read_expr( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                        data(address8) = failure_node.
                                        address8 = read___( ).
                                        if address8 <> failure_node.
                                            append address8 to elements0.
                                        else.
                                            clear elements0.
                                            offset = index1.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_case_when_then(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_case_else.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'case_else' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'case_else' ] ).
            data(rule) = cache[ key = 'case_else' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'case_else' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_else( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_expr( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_case_else(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'expr' ] ).
            data(rule) = cache[ key = 'expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_or_expr( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_select_stmt( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_or_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'or_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'or_expr' ] ).
            data(rule) = cache[ key = 'or_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'or_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_and_expr( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_kw_or( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_and_expr( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_or_expr(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_or_expr(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_and_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'and_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'and_expr' ] ).
            data(rule) = cache[ key = 'and_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'and_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_not_expr( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_kw_and( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_not_expr( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_and_expr(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_and_expr(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_not_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'not_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'not_expr' ] ).
            data(rule) = cache[ key = 'not_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'not_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_comparison_expr( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_exists_expr( ).
                if address0 = failure_node.
                    offset = index1.
                    data(index2) = offset.
                    data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements0.
                    data(address1) = failure_node.
                    data(index3) = offset.
                    address1 = read_kw_not( ).
                    if address1 = failure_node.
                        offset = index3.
                        data(index4) = offset.
                        data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                        clear elements1.
                        data(address2) = failure_node.
                        if address2 <> failure_node.
                            append address2 to elements1.
                            data(address3) = failure_node.
                            <>.
                            if address3 <> failure_node.
                                append address3 to elements1.
                            else.
                                clear elements1.
                                offset = index4.
                            endif.
                        else.
                            clear elements1.
                            offset = index4.
                        endif.
                        if elements1 is initial.
                            address1 = failure_node.
                        else.
                            address1 = new zcl_sql_tree_node_not_expr(
                                text = substring( val = input off = index4 len = offset - index4 )
                                offset = index4
                                elements = elements1 ).
                            offset = offset.
                        endif.
                        if address1 = failure_node.
                            offset = index3.
                        endif.
                    endif.
                    if address1 <> failure_node.
                        append address1 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_not_expr( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                    if elements0 is initial.
                        address0 = failure_node.
                    else.
                        address0 = new zcl_sql_tree_node_not_expr(
                            text = substring( val = input off = index2 len = offset - index2 )
                            offset = index2
                            elements = elements0 ).
                        offset = offset.
                    endif.
                    if address0 = failure_node.
                        offset = index1.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_comparison_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'comparison_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'comparison_expr' ] ).
            data(rule) = cache[ key = 'comparison_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'comparison_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_additive_expr( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    data(index2) = offset.
                    undefined = read_comparison_op_right( ).
                    if undefined = failure_node.
                        undefined = new zcl_sql_tree_node(
                            text = substring( val = input off = index2 len = index2 - index2 )
                            offset = index2
                            elements = value #( ) ).
                        offset = index2.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_comparison_expr(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_exists_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'exists_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'exists_expr' ] ).
            data(rule) = cache[ key = 'exists_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'exists_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_exists_op( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_sub_query( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_exists_expr(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_exists_op.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'exists_op' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'exists_op' ] ).
            data(rule) = cache[ key = 'exists_op' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'exists_op' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_not( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_kw_exists( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_exists_op(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_exists( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_comparison_op_right.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'comparison_op_right' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'comparison_op_right' ] ).
            data(rule) = cache[ key = 'comparison_op_right' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'comparison_op_right' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_arithmetic_op_right( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_in_op_right( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_between_op_right( ).
                    if address0 = failure_node.
                        offset = index1.
                        address0 = read_is_op_right( ).
                        if address0 = failure_node.
                            offset = index1.
                            address0 = read_like_op_right( ).
                            if address0 = failure_node.
                                offset = index1.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_arithmetic_op_right.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'arithmetic_op_right' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'arithmetic_op_right' ] ).
            data(rule) = cache[ key = 'arithmetic_op_right' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'arithmetic_op_right' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data address1 type ref to zcl_sql_tree_node.
            clear address1.
            do.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements1.
                    data(address3) = failure_node.
                    address3 = read_arithmetic_comparison_operator( ).
                    if address3 <> failure_node.
                        append address3 to elements1.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements1.
                            data(address5) = failure_node.
                            address5 = read_additive_expr( ).
                            if address5 <> failure_node.
                                append address5 to elements1.
                            else.
                                clear elements1.
                                offset = index2.
                            endif.
                        else.
                            clear elements1.
                            offset = index2.
                        endif.
                    else.
                        clear elements1.
                        offset = index2.
                    endif.
                else.
                    clear elements1.
                    offset = index2.
                endif.
                if elements1 is initial.
                    undefined = failure_node.
                else.
                    undefined = new zcl_sql_tree_node_arithmetic_op_right(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                endif.
                if address1 <> failure_node.
                    append address1 to elements0.
                else.
                    exit.
                endif.
            enddo.
            if lines( elements0 ) >= 0 and lines( elements0 ) <= 1.
                undefined = new zcl_sql_tree_node(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            else.
                undefined = failure_node.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_arithmetic_comparison_operator.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'arithmetic_comparison_operator' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'arithmetic_comparison_operator' ] ).
            data(rule) = cache[ key = 'arithmetic_comparison_operator' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'arithmetic_comparison_operator' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            if address0 = failure_node.
                offset = index1.
                if address0 = failure_node.
                    offset = index1.
                    if address0 = failure_node.
                        offset = index1.
                        if address0 = failure_node.
                            offset = index1.
                            if address0 = failure_node.
                                offset = index1.
                                if address0 = failure_node.
                                    offset = index1.
                                    if address0 = failure_node.
                                        offset = index1.
                                    endif.
                                endif.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_is_op_right.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'is_op_right' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'is_op_right' ] ).
            data(rule) = cache[ key = 'is_op_right' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'is_op_right' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_is( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_additive_expr( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                address0 = new zcl_sql_tree_node_is_op_right(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                data(index3) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address4) = failure_node.
                data(index4) = offset.
                data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements2.
                data(address5) = failure_node.
                address5 = read_kw_is( ).
                if address5 <> failure_node.
                    append address5 to elements2.
                    data(address6) = failure_node.
                    address6 = read___( ).
                    if address6 <> failure_node.
                        append address6 to elements2.
                        data(address7) = failure_node.
                        address7 = read_kw_not( ).
                        if address7 <> failure_node.
                            append address7 to elements2.
                        else.
                            clear elements2.
                            offset = index4.
                        endif.
                    else.
                        clear elements2.
                        offset = index4.
                    endif.
                else.
                    clear elements2.
                    offset = index4.
                endif.
                if elements2 is initial.
                    undefined = failure_node.
                else.
                    undefined = new zcl_sql_tree_node_is_op_right(
                        text = substring( val = input off = index4 len = offset - index4 )
                        offset = index4
                        elements = elements2 ).
                    offset = offset.
                endif.
                if address4 <> failure_node.
                    append address4 to elements1.
                    data(address8) = failure_node.
                    address8 = read___( ).
                    if address8 <> failure_node.
                        append address8 to elements1.
                        data(address9) = failure_node.
                        undefined = read_additive_expr( ).
                        if address9 <> failure_node.
                            append address9 to elements1.
                        else.
                            clear elements1.
                            offset = index3.
                        endif.
                    else.
                        clear elements1.
                        offset = index3.
                    endif.
                else.
                    clear elements1.
                    offset = index3.
                endif.
                if elements1 is initial.
                    address0 = failure_node.
                else.
                    address0 = new zcl_sql_tree_node_is_op_right(
                        text = substring( val = input off = index3 len = offset - index3 )
                        offset = index3
                        elements = elements1 ).
                    offset = offset.
                endif.
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_between_op_right.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'between_op_right' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'between_op_right' ] ).
            data(rule) = cache[ key = 'between_op_right' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'between_op_right' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_between_or_not_between_op( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_additive_expr( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            address5 = read_kw_and( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    undefined = read_additive_expr( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_between_op_right(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_between_or_not_between_op.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'between_or_not_between_op' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'between_or_not_between_op' ] ).
            data(rule) = cache[ key = 'between_or_not_between_op' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'between_or_not_between_op' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_not( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_kw_between( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_between_or_not_between_op(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_between( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_like_op.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'like_op' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'like_op' ] ).
            data(rule) = cache[ key = 'like_op' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'like_op' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_not( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_kw_like( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_like_op(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_like( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_in_op.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'in_op' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'in_op' ] ).
            data(rule) = cache[ key = 'in_op' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'in_op' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_not( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_kw_in( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_in_op(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_in( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_like_op_right.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'like_op_right' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'like_op_right' ] ).
            data(rule) = cache[ key = 'like_op_right' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'like_op_right' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_like_op( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_comparison_expr( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_like_op_right(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_in_op_right.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'in_op_right' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'in_op_right' ] ).
            data(rule) = cache[ key = 'in_op_right' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'in_op_right' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_in_op( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_lparen( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_expr_list( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    address7 = read_rparen( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                    else.
                                        clear elements0.
                                        offset = index2.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index2.
                                endif.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                address0 = new zcl_sql_tree_node_in_op_right(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                data(index3) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address8) = failure_node.
                undefined = read_in_op( ).
                if address8 <> failure_node.
                    append address8 to elements1.
                    data(address9) = failure_node.
                    address9 = read___( ).
                    if address9 <> failure_node.
                        append address9 to elements1.
                        data(address10) = failure_node.
                        undefined = read_var_decl( ).
                        if address10 <> failure_node.
                            append address10 to elements1.
                        else.
                            clear elements1.
                            offset = index3.
                        endif.
                    else.
                        clear elements1.
                        offset = index3.
                    endif.
                else.
                    clear elements1.
                    offset = index3.
                endif.
                if elements1 is initial.
                    address0 = failure_node.
                else.
                    address0 = new zcl_sql_tree_node_in_op_right(
                        text = substring( val = input off = index3 len = offset - index3 )
                        offset = index3
                        elements = elements1 ).
                    offset = offset.
                endif.
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_additive_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'additive_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'additive_expr' ] ).
            data(rule) = cache[ key = 'additive_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'additive_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_multiplicative_expr( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_additive_operator( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_multiplicative_expr( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_additive_expr(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_additive_expr(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_additive_operator.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'additive_operator' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'additive_operator' ] ).
            data(rule) = cache[ key = 'additive_operator' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'additive_operator' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            if address0 = failure_node.
                offset = index1.
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_multiplicative_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'multiplicative_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'multiplicative_expr' ] ).
            data(rule) = cache[ key = 'multiplicative_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'multiplicative_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_primary( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_multiplicative_operator( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_primary( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_multiplicative_expr(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_multiplicative_expr(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_multiplicative_operator.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'multiplicative_operator' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'multiplicative_operator' ] ).
            data(rule) = cache[ key = 'multiplicative_operator' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'multiplicative_operator' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            if address0 = failure_node.
                offset = index1.
                if address0 = failure_node.
                    offset = index1.
                    if address0 = failure_node.
                        offset = index1.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_primary.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'primary' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'primary' ] ).
            data(rule) = cache[ key = 'primary' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'primary' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_literal( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_cast_expr( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_aggr_func( ).
                    if address0 = failure_node.
                        offset = index1.
                        address0 = read_func_call( ).
                        if address0 = failure_node.
                            offset = index1.
                            address0 = read_case_expr( ).
                            if address0 = failure_node.
                                offset = index1.
                                address0 = read_column_ref( ).
                                if address0 = failure_node.
                                    offset = index1.
                                    address0 = read_param( ).
                                    if address0 = failure_node.
                                        offset = index1.
                                        data(index2) = offset.
                                        data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
                                        clear elements0.
                                        data(address1) = failure_node.
                                        address1 = read_lparen( ).
                                        if address1 <> failure_node.
                                            append address1 to elements0.
                                            data(address2) = failure_node.
                                            address2 = read___( ).
                                            if address2 <> failure_node.
                                                append address2 to elements0.
                                                data(address3) = failure_node.
                                                undefined = read_expr( ).
                                                if address3 <> failure_node.
                                                    append address3 to elements0.
                                                    data(address4) = failure_node.
                                                    address4 = read___( ).
                                                    if address4 <> failure_node.
                                                        append address4 to elements0.
                                                        data(address5) = failure_node.
                                                        address5 = read_rparen( ).
                                                        if address5 <> failure_node.
                                                            append address5 to elements0.
                                                        else.
                                                            clear elements0.
                                                            offset = index2.
                                                        endif.
                                                    else.
                                                        clear elements0.
                                                        offset = index2.
                                                    endif.
                                                else.
                                                    clear elements0.
                                                    offset = index2.
                                                endif.
                                            else.
                                                clear elements0.
                                                offset = index2.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index2.
                                        endif.
                                        if elements0 is initial.
                                            address0 = failure_node.
                                        else.
                                            address0 = new zcl_sql_tree_node_primary(
                                                text = substring( val = input off = index2 len = offset - index2 )
                                                offset = index2
                                                elements = elements0 ).
                                            offset = offset.
                                        endif.
                                        if address0 = failure_node.
                                            offset = index1.
                                            data(index3) = offset.
                                            data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                                            clear elements1.
                                            data(address6) = failure_node.
                                            address6 = read_lparen( ).
                                            if address6 <> failure_node.
                                                append address6 to elements1.
                                                data(address7) = failure_node.
                                                address7 = read___( ).
                                                if address7 <> failure_node.
                                                    append address7 to elements1.
                                                    data(address8) = failure_node.
                                                    undefined = read_expr_list( ).
                                                    if address8 <> failure_node.
                                                        append address8 to elements1.
                                                        data(address9) = failure_node.
                                                        address9 = read___( ).
                                                        if address9 <> failure_node.
                                                            append address9 to elements1.
                                                            data(address10) = failure_node.
                                                            address10 = read_rparen( ).
                                                            if address10 <> failure_node.
                                                                append address10 to elements1.
                                                            else.
                                                                clear elements1.
                                                                offset = index3.
                                                            endif.
                                                        else.
                                                            clear elements1.
                                                            offset = index3.
                                                        endif.
                                                    else.
                                                        clear elements1.
                                                        offset = index3.
                                                    endif.
                                                else.
                                                    clear elements1.
                                                    offset = index3.
                                                endif.
                                            else.
                                                clear elements1.
                                                offset = index3.
                                            endif.
                                            if elements1 is initial.
                                                address0 = failure_node.
                                            else.
                                                address0 = new zcl_sql_tree_node_primary(
                                                    text = substring( val = input off = index3 len = offset - index3 )
                                                    offset = index3
                                                    elements = elements1 ).
                                                offset = offset.
                                            endif.
                                            if address0 = failure_node.
                                                offset = index1.
                                                address0 = read_var_decl( ).
                                                if address0 = failure_node.
                                                    offset = index1.
                                                    address0 = read_interval_expr( ).
                                                    if address0 = failure_node.
                                                        offset = index1.
                                                    endif.
                                                endif.
                                            endif.
                                        endif.
                                    endif.
                                endif.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_column_ref.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'column_ref' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'column_ref' ] ).
            data(rule) = cache[ key = 'column_ref' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'column_ref' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_ident( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_dot( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_column( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                address0 = new zcl_sql_tree_node_column_ref(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                undefined = read_column( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_column_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'column_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'column_list' ] ).
            data(rule) = cache[ key = 'column_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'column_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_column( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_comma( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_column( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_column_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_column_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_ident.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'ident' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'ident' ] ).
            data(rule) = cache[ key = 'ident' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'ident' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            undefined = read_ident_name( ).
            if address0 = failure_node.
                offset = index1.
                undefined = read_quoted_ident( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_quoted_ident.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'quoted_ident' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'quoted_ident' ] ).
            data(rule) = cache[ key = 'quoted_ident' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'quoted_ident' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_double_quoted_ident( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_single_quoted_ident( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_backticks_quoted_ident( ).
                    if address0 = failure_node.
                        offset = index1.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_double_quoted_ident.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'double_quoted_ident' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'double_quoted_ident' ] ).
            data(rule) = cache[ key = 'double_quoted_ident' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'double_quoted_ident' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data chunk0 type string.
                    clear chunk0.
                    data(max0) = offset + 1.
                    if max0 <= input_size.
                        chunk0 = substring( val = input off = offset len = max0 - offset ).
                    endif.
                    if chunk0 is not initial and regex0->create_matcher( text = chunk0 )->match( ) = abap_true.
                        address3 = new zcl_sql_tree_node(
                            text = substring( val = input off = offset len = offset + 1 - offset )
                            offset = offset
                            elements = value #( ) ).
                        offset = offset + 1.
                    else.
                        address3 = failure_node.
                        if offset > failure.
                            failure = offset.
                        endif.
                        if offset = failure.
                            append value #( ( `sql::double_quoted_ident` ) ( `regex0` ) ) to expected.
                        endif.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0 and lines( elements1 ) <= 1.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
                endif.
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address4) = failure_node.
                    if address4 <> failure_node.
                        append address4 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_double_quoted_ident(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_single_quoted_ident.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'single_quoted_ident' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'single_quoted_ident' ] ).
            data(rule) = cache[ key = 'single_quoted_ident' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'single_quoted_ident' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data chunk0 type string.
                    clear chunk0.
                    data(max0) = offset + 1.
                    if max0 <= input_size.
                        chunk0 = substring( val = input off = offset len = max0 - offset ).
                    endif.
                    if chunk0 is not initial and regex1->create_matcher( text = chunk0 )->match( ) = abap_true.
                        address3 = new zcl_sql_tree_node(
                            text = substring( val = input off = offset len = offset + 1 - offset )
                            offset = offset
                            elements = value #( ) ).
                        offset = offset + 1.
                    else.
                        address3 = failure_node.
                        if offset > failure.
                            failure = offset.
                        endif.
                        if offset = failure.
                            append value #( ( `sql::single_quoted_ident` ) ( `regex1` ) ) to expected.
                        endif.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0 and lines( elements1 ) <= 1.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
                endif.
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address4) = failure_node.
                    if address4 <> failure_node.
                        append address4 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_single_quoted_ident(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_backticks_quoted_ident.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'backticks_quoted_ident' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'backticks_quoted_ident' ] ).
            data(rule) = cache[ key = 'backticks_quoted_ident' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'backticks_quoted_ident' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data chunk0 type string.
                    clear chunk0.
                    data(max0) = offset + 1.
                    if max0 <= input_size.
                        chunk0 = substring( val = input off = offset len = max0 - offset ).
                    endif.
                    if chunk0 is not initial and regex2->create_matcher( text = chunk0 )->match( ) = abap_true.
                        address3 = new zcl_sql_tree_node(
                            text = substring( val = input off = offset len = offset + 1 - offset )
                            offset = offset
                            elements = value #( ) ).
                        offset = offset + 1.
                    else.
                        address3 = failure_node.
                        if offset > failure.
                            failure = offset.
                        endif.
                        if offset = failure.
                            append value #( ( `sql::backticks_quoted_ident` ) ( `regex2` ) ) to expected.
                        endif.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0 and lines( elements1 ) <= 1.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
                endif.
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address4) = failure_node.
                    if address4 <> failure_node.
                        append address4 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_backticks_quoted_ident(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_column.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'column' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'column' ] ).
            data(rule) = cache[ key = 'column' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'column' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            undefined = read_column_name( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_quoted_ident( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_column_name.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'column_name' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'column_name' ] ).
            data(rule) = cache[ key = 'column_name' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'column_name' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_ident_start( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    address3 = read_column_part( ).
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_column_name(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_ident_name.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'ident_name' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'ident_name' ] ).
            data(rule) = cache[ key = 'ident_name' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'ident_name' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_ident_start( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    address3 = read_ident_part( ).
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_ident_name(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_ident_start.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'ident_start' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'ident_start' ] ).
            data(rule) = cache[ key = 'ident_start' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'ident_start' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data chunk0 type string.
            clear chunk0.
            data(max0) = offset + 1.
            if max0 <= input_size.
                chunk0 = substring( val = input off = offset len = max0 - offset ).
            endif.
            if chunk0 is not initial and regex3->create_matcher( text = chunk0 )->match( ) = abap_true.
                address0 = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                address0 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::ident_start` ) ( `regex3` ) ) to expected.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_ident_part.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'ident_part' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'ident_part' ] ).
            data(rule) = cache[ key = 'ident_part' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'ident_part' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data chunk0 type string.
            clear chunk0.
            data(max0) = offset + 1.
            if max0 <= input_size.
                chunk0 = substring( val = input off = offset len = max0 - offset ).
            endif.
            if chunk0 is not initial and regex4->create_matcher( text = chunk0 )->match( ) = abap_true.
                address0 = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                address0 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::ident_part` ) ( `regex4` ) ) to expected.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_column_part.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'column_part' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'column_part' ] ).
            data(rule) = cache[ key = 'column_part' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'column_part' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data chunk0 type string.
            clear chunk0.
            data(max0) = offset + 1.
            if max0 <= input_size.
                chunk0 = substring( val = input off = offset len = max0 - offset ).
            endif.
            if chunk0 is not initial and regex5->create_matcher( text = chunk0 )->match( ) = abap_true.
                address0 = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                address0 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::column_part` ) ( `regex5` ) ) to expected.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_param.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'param' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'param' ] ).
            data(rule) = cache[ key = 'param' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'param' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read_ident_name( ).
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
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_param(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_aggr_func.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'aggr_func' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'aggr_func' ] ).
            data(rule) = cache[ key = 'aggr_func' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'aggr_func' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_kw_count( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_lparen( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_star( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    address7 = read_rparen( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                    else.
                                        clear elements0.
                                        offset = index2.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index2.
                                endif.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                address0 = new zcl_sql_tree_node_aggr_func(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                data(index3) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address8) = failure_node.
                undefined = read_set_function_type( ).
                if address8 <> failure_node.
                    append address8 to elements1.
                    data(address9) = failure_node.
                    address9 = read___( ).
                    if address9 <> failure_node.
                        append address9 to elements1.
                        data(address10) = failure_node.
                        address10 = read_lparen( ).
                        if address10 <> failure_node.
                            append address10 to elements1.
                            data(address11) = failure_node.
                            address11 = read___( ).
                            if address11 <> failure_node.
                                append address11 to elements1.
                                data(address12) = failure_node.
                                data(index4) = offset.
                                undefined = read_set_quantifier( ).
                                if undefined = failure_node.
                                    undefined = new zcl_sql_tree_node(
                                        text = substring( val = input off = index4 len = index4 - index4 )
                                        offset = index4
                                        elements = value #( ) ).
                                    offset = index4.
                                endif.
                                if address12 <> failure_node.
                                    append address12 to elements1.
                                    data(address13) = failure_node.
                                    address13 = read___( ).
                                    if address13 <> failure_node.
                                        append address13 to elements1.
                                        data(address14) = failure_node.
                                        undefined = read_column_ref( ).
                                        if address14 <> failure_node.
                                            append address14 to elements1.
                                            data(address15) = failure_node.
                                            address15 = read___( ).
                                            if address15 <> failure_node.
                                                append address15 to elements1.
                                                data(address16) = failure_node.
                                                address16 = read_rparen( ).
                                                if address16 <> failure_node.
                                                    append address16 to elements1.
                                                else.
                                                    clear elements1.
                                                    offset = index3.
                                                endif.
                                            else.
                                                clear elements1.
                                                offset = index3.
                                            endif.
                                        else.
                                            clear elements1.
                                            offset = index3.
                                        endif.
                                    else.
                                        clear elements1.
                                        offset = index3.
                                    endif.
                                else.
                                    clear elements1.
                                    offset = index3.
                                endif.
                            else.
                                clear elements1.
                                offset = index3.
                            endif.
                        else.
                            clear elements1.
                            offset = index3.
                        endif.
                    else.
                        clear elements1.
                        offset = index3.
                    endif.
                else.
                    clear elements1.
                    offset = index3.
                endif.
                if elements1 is initial.
                    address0 = failure_node.
                else.
                    address0 = new zcl_sql_tree_node_aggr_func(
                        text = substring( val = input off = index3 len = offset - index3 )
                        offset = index3
                        elements = elements1 ).
                    offset = offset.
                endif.
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_set_function_type.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'set_function_type' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'set_function_type' ] ).
            data(rule) = cache[ key = 'set_function_type' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'set_function_type' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_kw_avg( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_max( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_kw_min( ).
                    if address0 = failure_node.
                        offset = index1.
                        address0 = read_kw_sum( ).
                        if address0 = failure_node.
                            offset = index1.
                            address0 = read_kw_count( ).
                            if address0 = failure_node.
                                offset = index1.
                                if address0 = failure_node.
                                    offset = index1.
                                endif.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_set_quantifier.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'set_quantifier' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'set_quantifier' ] ).
            data(rule) = cache[ key = 'set_quantifier' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'set_quantifier' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_kw_distinct( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_all( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_func_call.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'func_call' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'func_call' ] ).
            data(rule) = cache[ key = 'func_call' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'func_call' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_ident( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_lparen( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            data(index3) = offset.
                            undefined = read_expr_list( ).
                            if undefined = failure_node.
                                undefined = new zcl_sql_tree_node(
                                    text = substring( val = input off = index3 len = index3 - index3 )
                                    offset = index3
                                    elements = value #( ) ).
                                offset = index3.
                            endif.
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    address7 = read_rparen( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                    else.
                                        clear elements0.
                                        offset = index2.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index2.
                                endif.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                address0 = new zcl_sql_tree_node_func_call(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                data(index4) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address8) = failure_node.
                data(index5) = offset.
                undefined = read_kw_year( ).
                if undefined = failure_node.
                    offset = index5.
                    undefined = read_kw_month( ).
                    if undefined = failure_node.
                        offset = index5.
                        undefined = read_kw_day( ).
                        if undefined = failure_node.
                            offset = index5.
                            undefined = read_kw_hour( ).
                            if undefined = failure_node.
                                offset = index5.
                                undefined = read_kw_minute( ).
                                if undefined = failure_node.
                                    offset = index5.
                                endif.
                            endif.
                        endif.
                    endif.
                endif.
                if address8 <> failure_node.
                    append address8 to elements1.
                    data(address9) = failure_node.
                    address9 = read___( ).
                    if address9 <> failure_node.
                        append address9 to elements1.
                        data(address10) = failure_node.
                        address10 = read_lparen( ).
                        if address10 <> failure_node.
                            append address10 to elements1.
                            data(address11) = failure_node.
                            address11 = read___( ).
                            if address11 <> failure_node.
                                append address11 to elements1.
                                data(address12) = failure_node.
                                data(index6) = offset.
                                undefined = read_expr_list( ).
                                if undefined = failure_node.
                                    undefined = new zcl_sql_tree_node(
                                        text = substring( val = input off = index6 len = index6 - index6 )
                                        offset = index6
                                        elements = value #( ) ).
                                    offset = index6.
                                endif.
                                if address12 <> failure_node.
                                    append address12 to elements1.
                                    data(address13) = failure_node.
                                    address13 = read___( ).
                                    if address13 <> failure_node.
                                        append address13 to elements1.
                                        data(address14) = failure_node.
                                        address14 = read_rparen( ).
                                        if address14 <> failure_node.
                                            append address14 to elements1.
                                        else.
                                            clear elements1.
                                            offset = index4.
                                        endif.
                                    else.
                                        clear elements1.
                                        offset = index4.
                                    endif.
                                else.
                                    clear elements1.
                                    offset = index4.
                                endif.
                            else.
                                clear elements1.
                                offset = index4.
                            endif.
                        else.
                            clear elements1.
                            offset = index4.
                        endif.
                    else.
                        clear elements1.
                        offset = index4.
                    endif.
                else.
                    clear elements1.
                    offset = index4.
                endif.
                if elements1 is initial.
                    address0 = failure_node.
                else.
                    address0 = new zcl_sql_tree_node_func_call(
                        text = substring( val = input off = index4 len = offset - index4 )
                        offset = index4
                        elements = elements1 ).
                    offset = offset.
                endif.
                if address0 = failure_node.
                    offset = index1.
                    undefined = read_scalar_func( ).
                    if address0 = failure_node.
                        offset = index1.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_scalar_func.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'scalar_func' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'scalar_func' ] ).
            data(rule) = cache[ key = 'scalar_func' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'scalar_func' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_kw_current_date( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_current_time( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_kw_current_timestamp( ).
                    if address0 = failure_node.
                        offset = index1.
                        address0 = read_kw_current_user( ).
                        if address0 = failure_node.
                            offset = index1.
                            address0 = read_kw_user( ).
                            if address0 = failure_node.
                                offset = index1.
                                address0 = read_kw_session_user( ).
                                if address0 = failure_node.
                                    offset = index1.
                                    address0 = read_kw_system_user( ).
                                    if address0 = failure_node.
                                        offset = index1.
                                    endif.
                                endif.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_cast_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'cast_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'cast_expr' ] ).
            data(rule) = cache[ key = 'cast_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'cast_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_cast( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_lparen( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_expr( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    address7 = read_kw_as( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                        data(address8) = failure_node.
                                        address8 = read___( ).
                                        if address8 <> failure_node.
                                            append address8 to elements0.
                                            data(address9) = failure_node.
                                            undefined = read_data_type( ).
                                            if address9 <> failure_node.
                                                append address9 to elements0.
                                                data(address10) = failure_node.
                                                address10 = read___( ).
                                                if address10 <> failure_node.
                                                    append address10 to elements0.
                                                    data(address11) = failure_node.
                                                    address11 = read_rparen( ).
                                                    if address11 <> failure_node.
                                                        append address11 to elements0.
                                                    else.
                                                        clear elements0.
                                                        offset = index2.
                                                    endif.
                                                else.
                                                    clear elements0.
                                                    offset = index2.
                                                endif.
                                            else.
                                                clear elements0.
                                                offset = index2.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index2.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index2.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index2.
                                endif.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_cast_expr(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if undefined = failure_node.
                offset = index1.
                data(index3) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address12) = failure_node.
                address12 = read_kw_cast( ).
                if address12 <> failure_node.
                    append address12 to elements1.
                    data(address13) = failure_node.
                    address13 = read___( ).
                    if address13 <> failure_node.
                        append address13 to elements1.
                        data(address14) = failure_node.
                        address14 = read_lparen( ).
                        if address14 <> failure_node.
                            append address14 to elements1.
                            data(address15) = failure_node.
                            address15 = read___( ).
                            if address15 <> failure_node.
                                append address15 to elements1.
                                data(address16) = failure_node.
                                undefined = read_expr( ).
                                if address16 <> failure_node.
                                    append address16 to elements1.
                                    data(address17) = failure_node.
                                    address17 = read___( ).
                                    if address17 <> failure_node.
                                        append address17 to elements1.
                                        data(address18) = failure_node.
                                        address18 = read_kw_as( ).
                                        if address18 <> failure_node.
                                            append address18 to elements1.
                                            data(address19) = failure_node.
                                            address19 = read___( ).
                                            if address19 <> failure_node.
                                                append address19 to elements1.
                                                data(address20) = failure_node.
                                                address20 = read_kw_decimal( ).
                                                if address20 <> failure_node.
                                                    append address20 to elements1.
                                                    data(address21) = failure_node.
                                                    address21 = read___( ).
                                                    if address21 <> failure_node.
                                                        append address21 to elements1.
                                                        data(address22) = failure_node.
                                                        address22 = read_lparen( ).
                                                        if address22 <> failure_node.
                                                            append address22 to elements1.
                                                            data(address23) = failure_node.
                                                            address23 = read___( ).
                                                            if address23 <> failure_node.
                                                                append address23 to elements1.
                                                                data(address24) = failure_node.
                                                                undefined = read_int( ).
                                                                if address24 <> failure_node.
                                                                    append address24 to elements1.
                                                                    data(address25) = failure_node.
                                                                    address25 = read___( ).
                                                                    if address25 <> failure_node.
                                                                        append address25 to elements1.
                                                                        data(address26) = failure_node.
                                                                        address26 = read_rparen( ).
                                                                        if address26 <> failure_node.
                                                                            append address26 to elements1.
                                                                            data(address27) = failure_node.
                                                                            address27 = read___( ).
                                                                            if address27 <> failure_node.
                                                                                append address27 to elements1.
                                                                                data(address28) = failure_node.
                                                                                address28 = read_rparen( ).
                                                                                if address28 <> failure_node.
                                                                                    append address28 to elements1.
                                                                                else.
                                                                                    clear elements1.
                                                                                    offset = index3.
                                                                                endif.
                                                                            else.
                                                                                clear elements1.
                                                                                offset = index3.
                                                                            endif.
                                                                        else.
                                                                            clear elements1.
                                                                            offset = index3.
                                                                        endif.
                                                                    else.
                                                                        clear elements1.
                                                                        offset = index3.
                                                                    endif.
                                                                else.
                                                                    clear elements1.
                                                                    offset = index3.
                                                                endif.
                                                            else.
                                                                clear elements1.
                                                                offset = index3.
                                                            endif.
                                                        else.
                                                            clear elements1.
                                                            offset = index3.
                                                        endif.
                                                    else.
                                                        clear elements1.
                                                        offset = index3.
                                                    endif.
                                                else.
                                                    clear elements1.
                                                    offset = index3.
                                                endif.
                                            else.
                                                clear elements1.
                                                offset = index3.
                                            endif.
                                        else.
                                            clear elements1.
                                            offset = index3.
                                        endif.
                                    else.
                                        clear elements1.
                                        offset = index3.
                                    endif.
                                else.
                                    clear elements1.
                                    offset = index3.
                                endif.
                            else.
                                clear elements1.
                                offset = index3.
                            endif.
                        else.
                            clear elements1.
                            offset = index3.
                        endif.
                    else.
                        clear elements1.
                        offset = index3.
                    endif.
                else.
                    clear elements1.
                    offset = index3.
                endif.
                if elements1 is initial.
                    undefined = failure_node.
                else.
                    undefined = new zcl_sql_tree_node_cast_expr(
                        text = substring( val = input off = index3 len = offset - index3 )
                        offset = index3
                        elements = elements1 ).
                    offset = offset.
                endif.
                if undefined = failure_node.
                    offset = index1.
                    data(index4) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address29) = failure_node.
                    address29 = read_kw_cast( ).
                    if address29 <> failure_node.
                        append address29 to elements2.
                        data(address30) = failure_node.
                        address30 = read___( ).
                        if address30 <> failure_node.
                            append address30 to elements2.
                            data(address31) = failure_node.
                            address31 = read_lparen( ).
                            if address31 <> failure_node.
                                append address31 to elements2.
                                data(address32) = failure_node.
                                address32 = read___( ).
                                if address32 <> failure_node.
                                    append address32 to elements2.
                                    data(address33) = failure_node.
                                    undefined = read_expr( ).
                                    if address33 <> failure_node.
                                        append address33 to elements2.
                                        data(address34) = failure_node.
                                        address34 = read___( ).
                                        if address34 <> failure_node.
                                            append address34 to elements2.
                                            data(address35) = failure_node.
                                            address35 = read_kw_as( ).
                                            if address35 <> failure_node.
                                                append address35 to elements2.
                                                data(address36) = failure_node.
                                                address36 = read___( ).
                                                if address36 <> failure_node.
                                                    append address36 to elements2.
                                                    data(address37) = failure_node.
                                                    address37 = read_kw_decimal( ).
                                                    if address37 <> failure_node.
                                                        append address37 to elements2.
                                                        data(address38) = failure_node.
                                                        address38 = read___( ).
                                                        if address38 <> failure_node.
                                                            append address38 to elements2.
                                                            data(address39) = failure_node.
                                                            address39 = read_lparen( ).
                                                            if address39 <> failure_node.
                                                                append address39 to elements2.
                                                                data(address40) = failure_node.
                                                                address40 = read___( ).
                                                                if address40 <> failure_node.
                                                                    append address40 to elements2.
                                                                    data(address41) = failure_node.
                                                                    undefined = read_int( ).
                                                                    if address41 <> failure_node.
                                                                        append address41 to elements2.
                                                                        data(address42) = failure_node.
                                                                        address42 = read___( ).
                                                                        if address42 <> failure_node.
                                                                            append address42 to elements2.
                                                                            data(address43) = failure_node.
                                                                            address43 = read_comma( ).
                                                                            if address43 <> failure_node.
                                                                                append address43 to elements2.
                                                                                data(address44) = failure_node.
                                                                                address44 = read___( ).
                                                                                if address44 <> failure_node.
                                                                                    append address44 to elements2.
                                                                                    data(address45) = failure_node.
                                                                                    undefined = read_int( ).
                                                                                    if address45 <> failure_node.
                                                                                        append address45 to elements2.
                                                                                        data(address46) = failure_node.
                                                                                        address46 = read___( ).
                                                                                        if address46 <> failure_node.
                                                                                            append address46 to elements2.
                                                                                            data(address47) = failure_node.
                                                                                            address47 = read_rparen( ).
                                                                                            if address47 <> failure_node.
                                                                                                append address47 to elements2.
                                                                                                data(address48) = failure_node.
                                                                                                address48 = read___( ).
                                                                                                if address48 <> failure_node.
                                                                                                    append address48 to elements2.
                                                                                                    data(address49) = failure_node.
                                                                                                    address49 = read_rparen( ).
                                                                                                    if address49 <> failure_node.
                                                                                                        append address49 to elements2.
                                                                                                    else.
                                                                                                        clear elements2.
                                                                                                        offset = index4.
                                                                                                    endif.
                                                                                                else.
                                                                                                    clear elements2.
                                                                                                    offset = index4.
                                                                                                endif.
                                                                                            else.
                                                                                                clear elements2.
                                                                                                offset = index4.
                                                                                            endif.
                                                                                        else.
                                                                                            clear elements2.
                                                                                            offset = index4.
                                                                                        endif.
                                                                                    else.
                                                                                        clear elements2.
                                                                                        offset = index4.
                                                                                    endif.
                                                                                else.
                                                                                    clear elements2.
                                                                                    offset = index4.
                                                                                endif.
                                                                            else.
                                                                                clear elements2.
                                                                                offset = index4.
                                                                            endif.
                                                                        else.
                                                                            clear elements2.
                                                                            offset = index4.
                                                                        endif.
                                                                    else.
                                                                        clear elements2.
                                                                        offset = index4.
                                                                    endif.
                                                                else.
                                                                    clear elements2.
                                                                    offset = index4.
                                                                endif.
                                                            else.
                                                                clear elements2.
                                                                offset = index4.
                                                            endif.
                                                        else.
                                                            clear elements2.
                                                            offset = index4.
                                                        endif.
                                                    else.
                                                        clear elements2.
                                                        offset = index4.
                                                    endif.
                                                else.
                                                    clear elements2.
                                                    offset = index4.
                                                endif.
                                            else.
                                                clear elements2.
                                                offset = index4.
                                            endif.
                                        else.
                                            clear elements2.
                                            offset = index4.
                                        endif.
                                    else.
                                        clear elements2.
                                        offset = index4.
                                    endif.
                                else.
                                    clear elements2.
                                    offset = index4.
                                endif.
                            else.
                                clear elements2.
                                offset = index4.
                            endif.
                        else.
                            clear elements2.
                            offset = index4.
                        endif.
                    else.
                        clear elements2.
                        offset = index4.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_cast_expr(
                            text = substring( val = input off = index4 len = offset - index4 )
                            offset = index4
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if undefined = failure_node.
                        offset = index1.
                        data(index5) = offset.
                        data elements3 type zcl_sql_tree_node=>tree_node_list_tab.
                        clear elements3.
                        data(address50) = failure_node.
                        address50 = read_kw_cast( ).
                        if address50 <> failure_node.
                            append address50 to elements3.
                            data(address51) = failure_node.
                            address51 = read___( ).
                            if address51 <> failure_node.
                                append address51 to elements3.
                                data(address52) = failure_node.
                                address52 = read_lparen( ).
                                if address52 <> failure_node.
                                    append address52 to elements3.
                                    data(address53) = failure_node.
                                    address53 = read___( ).
                                    if address53 <> failure_node.
                                        append address53 to elements3.
                                        data(address54) = failure_node.
                                        undefined = read_expr( ).
                                        if address54 <> failure_node.
                                            append address54 to elements3.
                                            data(address55) = failure_node.
                                            address55 = read___( ).
                                            if address55 <> failure_node.
                                                append address55 to elements3.
                                                data(address56) = failure_node.
                                                address56 = read_kw_as( ).
                                                if address56 <> failure_node.
                                                    append address56 to elements3.
                                                    data(address57) = failure_node.
                                                    address57 = read___( ).
                                                    if address57 <> failure_node.
                                                        append address57 to elements3.
                                                        data(address58) = failure_node.
                                                        undefined = read_signedness( ).
                                                        if address58 <> failure_node.
                                                            append address58 to elements3.
                                                            data(address59) = failure_node.
                                                            address59 = read___( ).
                                                            if address59 <> failure_node.
                                                                append address59 to elements3.
                                                                data(address60) = failure_node.
                                                                data(index6) = offset.
                                                                undefined = read_kw_integer( ).
                                                                if undefined = failure_node.
                                                                    undefined = new zcl_sql_tree_node(
                                                                        text = substring( val = input off = index6 len = index6 - index6 )
                                                                        offset = index6
                                                                        elements = value #( ) ).
                                                                    offset = index6.
                                                                endif.
                                                                if address60 <> failure_node.
                                                                    append address60 to elements3.
                                                                    data(address61) = failure_node.
                                                                    address61 = read___( ).
                                                                    if address61 <> failure_node.
                                                                        append address61 to elements3.
                                                                        data(address62) = failure_node.
                                                                        address62 = read_rparen( ).
                                                                        if address62 <> failure_node.
                                                                            append address62 to elements3.
                                                                        else.
                                                                            clear elements3.
                                                                            offset = index5.
                                                                        endif.
                                                                    else.
                                                                        clear elements3.
                                                                        offset = index5.
                                                                    endif.
                                                                else.
                                                                    clear elements3.
                                                                    offset = index5.
                                                                endif.
                                                            else.
                                                                clear elements3.
                                                                offset = index5.
                                                            endif.
                                                        else.
                                                            clear elements3.
                                                            offset = index5.
                                                        endif.
                                                    else.
                                                        clear elements3.
                                                        offset = index5.
                                                    endif.
                                                else.
                                                    clear elements3.
                                                    offset = index5.
                                                endif.
                                            else.
                                                clear elements3.
                                                offset = index5.
                                            endif.
                                        else.
                                            clear elements3.
                                            offset = index5.
                                        endif.
                                    else.
                                        clear elements3.
                                        offset = index5.
                                    endif.
                                else.
                                    clear elements3.
                                    offset = index5.
                                endif.
                            else.
                                clear elements3.
                                offset = index5.
                            endif.
                        else.
                            clear elements3.
                            offset = index5.
                        endif.
                        if elements3 is initial.
                            undefined = failure_node.
                        else.
                            undefined = new zcl_sql_tree_node_cast_expr(
                                text = substring( val = input off = index5 len = offset - index5 )
                                offset = index5
                                elements = elements3 ).
                            offset = offset.
                        endif.
                        if undefined = failure_node.
                            offset = index1.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_interval_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'interval_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'interval_expr' ] ).
            data(rule) = cache[ key = 'interval_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'interval_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_interval( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    data(index2) = offset.
                    data(index3) = offset.
                    if undefined = failure_node.
                        offset = index3.
                        if undefined = failure_node.
                            offset = index3.
                        endif.
                    endif.
                    if undefined = failure_node.
                        undefined = new zcl_sql_tree_node(
                            text = substring( val = input off = index2 len = index2 - index2 )
                            offset = index2
                            elements = value #( ) ).
                        offset = index2.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            data(index4) = offset.
                            if address5 = failure_node.
                                address5 = new zcl_sql_tree_node(
                                    text = substring( val = input off = index4 len = index4 - index4 )
                                    offset = index4
                                    elements = value #( ) ).
                                offset = index4.
                            endif.
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    undefined = read_int( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                        data(address8) = failure_node.
                                        data(index5) = offset.
                                        if address8 = failure_node.
                                            address8 = new zcl_sql_tree_node(
                                                text = substring( val = input off = index5 len = index5 - index5 )
                                                offset = index5
                                                elements = value #( ) ).
                                            offset = index5.
                                        endif.
                                        if address8 <> failure_node.
                                            append address8 to elements0.
                                            data(address9) = failure_node.
                                            address9 = read___( ).
                                            if address9 <> failure_node.
                                                append address9 to elements0.
                                                data(address10) = failure_node.
                                                undefined = read_interval_unit( ).
                                                if address10 <> failure_node.
                                                    append address10 to elements0.
                                                else.
                                                    clear elements0.
                                                    offset = index1.
                                                endif.
                                            else.
                                                clear elements0.
                                                offset = index1.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index1.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_interval_expr(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_interval_unit.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'interval_unit' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'interval_unit' ] ).
            data(rule) = cache[ key = 'interval_unit' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'interval_unit' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_kw_minute( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_hour( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_kw_day( ).
                    if address0 = failure_node.
                        offset = index1.
                        address0 = read_kw_month( ).
                        if address0 = failure_node.
                            offset = index1.
                            address0 = read_kw_year( ).
                            if address0 = failure_node.
                                offset = index1.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_signedness.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'signedness' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'signedness' ] ).
            data(rule) = cache[ key = 'signedness' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'signedness' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_kw_signed( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_unsigned( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_literal.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'literal' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'literal' ] ).
            data(rule) = cache[ key = 'literal' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'literal' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_literal_string( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_literal_numeric( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_literal_bool( ).
                    if address0 = failure_node.
                        offset = index1.
                        address0 = read_kw_null( ).
                        if address0 = failure_node.
                            offset = index1.
                            address0 = read_literal_datetime( ).
                            if address0 = failure_node.
                                offset = index1.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_literal_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'literal_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'literal_list' ] ).
            data(rule) = cache[ key = 'literal_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'literal_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_literal( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_comma( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_literal( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_literal_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_literal_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_literal_bool.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'literal_bool' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'literal_bool' ] ).
            data(rule) = cache[ key = 'literal_bool' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'literal_bool' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_kw_true( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_kw_false( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_literal_string.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'literal_string' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'literal_string' ] ).
            data(rule) = cache[ key = 'literal_string' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'literal_string' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    address3 = read_single_char( ).
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    address2 = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    address2 = failure_node.
                endif.
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address4) = failure_node.
                    if address4 <> failure_node.
                        append address4 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
                else.
                    clear elements0.
                    offset = index1.
                endif.
            else.
                clear elements0.
                offset = index1.
            endif.
            if elements0 is initial.
                undefined = failure_node.
            else.
                undefined = new zcl_sql_tree_node_literal_string(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_literal_datetime.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'literal_datetime' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'literal_datetime' ] ).
            data(rule) = cache[ key = 'literal_datetime' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'literal_datetime' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            data(index2) = offset.
            undefined = read_kw_time( ).
            if undefined = failure_node.
                offset = index2.
                undefined = read_kw_date( ).
                if undefined = failure_node.
                    offset = index2.
                    undefined = read_kw_timestamp( ).
                    if undefined = failure_node.
                        offset = index2.
                    endif.
                endif.
            endif.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    data(index3) = offset.
                    data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements1.
                    data(address4) = failure_node.
                    if address4 <> failure_node.
                        append address4 to elements1.
                        data(address5) = failure_node.
                        data(index4) = offset.
                        data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                        clear elements2.
                        data address6 type ref to zcl_sql_tree_node.
                        clear address6.
                        do.
                            address6 = read_single_char( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                            else.
                                exit.
                            endif.
                        enddo.
                        if lines( elements2 ) >= 0.
                            address5 = new zcl_sql_tree_node(
                                text = substring( val = input off = index4 len = offset - index4 )
                                offset = index4
                                elements = elements2 ).
                            offset = offset.
                        else.
                            address5 = failure_node.
                        endif.
                        if address5 <> failure_node.
                            append address5 to elements1.
                            data(address7) = failure_node.
                            if address7 <> failure_node.
                                append address7 to elements1.
                            else.
                                clear elements1.
                                offset = index3.
                            endif.
                        else.
                            clear elements1.
                            offset = index3.
                        endif.
                    else.
                        clear elements1.
                        offset = index3.
                    endif.
                    if elements1 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_literal_datetime(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements1 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_literal_datetime(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_single_char.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'single_char' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'single_char' ] ).
            data(rule) = cache[ key = 'single_char' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'single_char' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data chunk0 type string.
            clear chunk0.
            data(max0) = offset + 1.
            if max0 <= input_size.
                chunk0 = substring( val = input off = offset len = max0 - offset ).
            endif.
            if chunk0 is not initial and regex6->create_matcher( text = chunk0 )->match( ) = abap_true.
                address0 = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                address0 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::single_char` ) ( `regex6` ) ) to expected.
                endif.
            endif.
            if address0 = failure_node.
                offset = index1.
                address0 = read_escape_char( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_escape_char.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'escape_char' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'escape_char' ] ).
            data(rule) = cache[ key = 'escape_char' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'escape_char' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            if address0 = failure_node.
                offset = index1.
                if address0 = failure_node.
                    offset = index1.
                    if address0 = failure_node.
                        offset = index1.
                        if address0 = failure_node.
                            offset = index1.
                            if address0 = failure_node.
                                offset = index1.
                                if address0 = failure_node.
                                    offset = index1.
                                    if address0 = failure_node.
                                        offset = index1.
                                        if address0 = failure_node.
                                            offset = index1.
                                            if address0 = failure_node.
                                                offset = index1.
                                                if address0 = failure_node.
                                                    offset = index1.
                                                    data(index2) = offset.
                                                    data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
                                                    clear elements0.
                                                    data(address1) = failure_node.
                                                    if address1 <> failure_node.
                                                        append address1 to elements0.
                                                        data(address2) = failure_node.
                                                        undefined = read_hexdigit( ).
                                                        if address2 <> failure_node.
                                                            append address2 to elements0.
                                                            data(address3) = failure_node.
                                                            undefined = read_hexdigit( ).
                                                            if address3 <> failure_node.
                                                                append address3 to elements0.
                                                                data(address4) = failure_node.
                                                                undefined = read_hexdigit( ).
                                                                if address4 <> failure_node.
                                                                    append address4 to elements0.
                                                                    data(address5) = failure_node.
                                                                    undefined = read_hexdigit( ).
                                                                    if address5 <> failure_node.
                                                                        append address5 to elements0.
                                                                    else.
                                                                        clear elements0.
                                                                        offset = index2.
                                                                    endif.
                                                                else.
                                                                    clear elements0.
                                                                    offset = index2.
                                                                endif.
                                                            else.
                                                                clear elements0.
                                                                offset = index2.
                                                            endif.
                                                        else.
                                                            clear elements0.
                                                            offset = index2.
                                                        endif.
                                                    else.
                                                        clear elements0.
                                                        offset = index2.
                                                    endif.
                                                    if elements0 is initial.
                                                        address0 = failure_node.
                                                    else.
                                                        address0 = new zcl_sql_tree_node_escape_char(
                                                            text = substring( val = input off = index2 len = offset - index2 )
                                                            offset = index2
                                                            elements = elements0 ).
                                                        offset = offset.
                                                    endif.
                                                    if address0 = failure_node.
                                                        offset = index1.
                                                    endif.
                                                endif.
                                            endif.
                                        endif.
                                    endif.
                                endif.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_line_terminator.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'line_terminator' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'line_terminator' ] ).
            data(rule) = cache[ key = 'line_terminator' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'line_terminator' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data chunk0 type string.
            clear chunk0.
            data(max0) = offset + 1.
            if max0 <= input_size.
                chunk0 = substring( val = input off = offset len = max0 - offset ).
            endif.
            if chunk0 is not initial and regex7->create_matcher( text = chunk0 )->match( ) = abap_true.
                address0 = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                address0 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::line_terminator` ) ( `regex7` ) ) to expected.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_literal_numeric.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'literal_numeric' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'literal_numeric' ] ).
            data(rule) = cache[ key = 'literal_numeric' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'literal_numeric' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            undefined = read_number( ).
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_number.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'number' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'number' ] ).
            data(rule) = cache[ key = 'number' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'number' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_int( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                undefined = read_frac( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_exp( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                address0 = new zcl_sql_tree_node_number(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                data(index3) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address5) = failure_node.
                undefined = read_int( ).
                if address5 <> failure_node.
                    append address5 to elements1.
                    data(address6) = failure_node.
                    undefined = read_frac( ).
                    if address6 <> failure_node.
                        append address6 to elements1.
                        data(address7) = failure_node.
                        address7 = read___( ).
                        if address7 <> failure_node.
                            append address7 to elements1.
                        else.
                            clear elements1.
                            offset = index3.
                        endif.
                    else.
                        clear elements1.
                        offset = index3.
                    endif.
                else.
                    clear elements1.
                    offset = index3.
                endif.
                if elements1 is initial.
                    address0 = failure_node.
                else.
                    address0 = new zcl_sql_tree_node_number(
                        text = substring( val = input off = index3 len = offset - index3 )
                        offset = index3
                        elements = elements1 ).
                    offset = offset.
                endif.
                if address0 = failure_node.
                    offset = index1.
                    data(index4) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address8) = failure_node.
                    undefined = read_int( ).
                    if address8 <> failure_node.
                        append address8 to elements2.
                        data(address9) = failure_node.
                        undefined = read_exp( ).
                        if address9 <> failure_node.
                            append address9 to elements2.
                            data(address10) = failure_node.
                            address10 = read___( ).
                            if address10 <> failure_node.
                                append address10 to elements2.
                            else.
                                clear elements2.
                                offset = index4.
                            endif.
                        else.
                            clear elements2.
                            offset = index4.
                        endif.
                    else.
                        clear elements2.
                        offset = index4.
                    endif.
                    if elements2 is initial.
                        address0 = failure_node.
                    else.
                        address0 = new zcl_sql_tree_node_number(
                            text = substring( val = input off = index4 len = offset - index4 )
                            offset = index4
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address0 = failure_node.
                        offset = index1.
                        data(index5) = offset.
                        data elements3 type zcl_sql_tree_node=>tree_node_list_tab.
                        clear elements3.
                        data(address11) = failure_node.
                        undefined = read_int( ).
                        if address11 <> failure_node.
                            append address11 to elements3.
                            data(address12) = failure_node.
                            address12 = read___( ).
                            if address12 <> failure_node.
                                append address12 to elements3.
                            else.
                                clear elements3.
                                offset = index5.
                            endif.
                        else.
                            clear elements3.
                            offset = index5.
                        endif.
                        if elements3 is initial.
                            address0 = failure_node.
                        else.
                            address0 = new zcl_sql_tree_node_number(
                                text = substring( val = input off = index5 len = offset - index5 )
                                offset = index5
                                elements = elements3 ).
                            offset = offset.
                        endif.
                        if address0 = failure_node.
                            offset = index1.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_int.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'int' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'int' ] ).
            data(rule) = cache[ key = 'int' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'int' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_digits( ).
            if address0 = failure_node.
                offset = index1.
                undefined = read_digit( ).
                if address0 = failure_node.
                    offset = index1.
                    data(index2) = offset.
                    data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements0.
                    data(address1) = failure_node.
                    data(index3) = offset.
                    if undefined = failure_node.
                        offset = index3.
                        if undefined = failure_node.
                            offset = index3.
                        endif.
                    endif.
                    if address1 <> failure_node.
                        append address1 to elements0.
                        data(address2) = failure_node.
                        undefined = read_digits( ).
                        if address2 <> failure_node.
                            append address2 to elements0.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                    if elements0 is initial.
                        address0 = failure_node.
                    else.
                        address0 = new zcl_sql_tree_node_int(
                            text = substring( val = input off = index2 len = offset - index2 )
                            offset = index2
                            elements = elements0 ).
                        offset = offset.
                    endif.
                    if address0 = failure_node.
                        offset = index1.
                        data(index4) = offset.
                        data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                        clear elements1.
                        data(address3) = failure_node.
                        data(index5) = offset.
                        if undefined = failure_node.
                            offset = index5.
                            if undefined = failure_node.
                                offset = index5.
                            endif.
                        endif.
                        if address3 <> failure_node.
                            append address3 to elements1.
                            data(address4) = failure_node.
                            undefined = read_digit( ).
                            if address4 <> failure_node.
                                append address4 to elements1.
                            else.
                                clear elements1.
                                offset = index4.
                            endif.
                        else.
                            clear elements1.
                            offset = index4.
                        endif.
                        if elements1 is initial.
                            address0 = failure_node.
                        else.
                            address0 = new zcl_sql_tree_node_int(
                                text = substring( val = input off = index4 len = offset - index4 )
                                offset = index4
                                elements = elements1 ).
                            offset = offset.
                        endif.
                        if address0 = failure_node.
                            offset = index1.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_frac.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'frac' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'frac' ] ).
            data(rule) = cache[ key = 'frac' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'frac' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                undefined = read_digits( ).
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
                address0 = new zcl_sql_tree_node_frac(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_exp.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'exp' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'exp' ] ).
            data(rule) = cache[ key = 'exp' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'exp' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_e( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                undefined = read_digits( ).
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
                address0 = new zcl_sql_tree_node_exp(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
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
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data address1 type ref to zcl_sql_tree_node.
            clear address1.
            do.
                address1 = read_digit( ).
                if address1 <> failure_node.
                    append address1 to elements0.
                else.
                    exit.
                endif.
            enddo.
            if lines( elements0 ) >= 0 and lines( elements0 ) <= 1.
                undefined = new zcl_sql_tree_node(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            else.
                undefined = failure_node.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_digit.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'digit' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'digit' ] ).
            data(rule) = cache[ key = 'digit' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'digit' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data chunk0 type string.
            clear chunk0.
            data(max0) = offset + 1.
            if max0 <= input_size.
                chunk0 = substring( val = input off = offset len = max0 - offset ).
            endif.
            if chunk0 is not initial and regex8->create_matcher( text = chunk0 )->match( ) = abap_true.
                address0 = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                address0 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::digit` ) ( `regex8` ) ) to expected.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_hexDigit.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'hexDigit' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'hexDigit' ] ).
            data(rule) = cache[ key = 'hexDigit' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'hexDigit' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data chunk0 type string.
            clear chunk0.
            data(max0) = offset + 1.
            if max0 <= input_size.
                chunk0 = substring( val = input off = offset len = max0 - offset ).
            endif.
            if chunk0 is not initial and regex9->create_matcher( text = chunk0 )->match( ) = abap_true.
                address0 = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                address0 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::hexDigit` ) ( `regex9` ) ) to expected.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_e.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'e' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'e' ] ).
            data(rule) = cache[ key = 'e' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'e' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            data chunk0 type string.
            clear chunk0.
            data(max0) = offset + 1.
            if max0 <= input_size.
                chunk0 = substring( val = input off = offset len = max0 - offset ).
            endif.
            if chunk0 is not initial and regex10->create_matcher( text = chunk0 )->match( ) = abap_true.
                undefined = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                undefined = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::e` ) ( `regex10` ) ) to expected.
                endif.
            endif.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data chunk1 type string.
                clear chunk1.
                data(max1) = offset + 1.
                if max1 <= input_size.
                    chunk1 = substring( val = input off = offset len = max1 - offset ).
                endif.
                if chunk1 is not initial and regex11->create_matcher( text = chunk1 )->match( ) = abap_true.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = offset len = offset + 1 - offset )
                        offset = offset
                        elements = value #( ) ).
                    offset = offset + 1.
                else.
                    undefined = failure_node.
                    if offset > failure.
                        failure = offset.
                    endif.
                    if offset = failure.
                        append value #( ( `sql::e` ) ( `regex11` ) ) to expected.
                    endif.
                endif.
                if undefined = failure_node.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = index2 - index2 )
                        offset = index2
                        elements = value #( ) ).
                    offset = index2.
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
                address0 = new zcl_sql_tree_node_e(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_NULL.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_NULL' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_NULL' ] ).
            data(rule) = cache[ key = 'KW_NULL' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_NULL' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_NULL(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_TRUE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_TRUE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_TRUE' ] ).
            data(rule) = cache[ key = 'KW_TRUE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_TRUE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_TRUE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_FALSE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_FALSE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_FALSE' ] ).
            data(rule) = cache[ key = 'KW_FALSE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_FALSE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_FALSE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_SHOW.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_SHOW' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_SHOW' ] ).
            data(rule) = cache[ key = 'KW_SHOW' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_SHOW' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_SHOW(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_DROP.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_DROP' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_DROP' ] ).
            data(rule) = cache[ key = 'KW_DROP' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_DROP' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_DROP(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_SELECT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_SELECT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_SELECT' ] ).
            data(rule) = cache[ key = 'KW_SELECT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_SELECT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_SELECT(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_UPDATE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_UPDATE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_UPDATE' ] ).
            data(rule) = cache[ key = 'KW_UPDATE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_UPDATE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_UPDATE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_CREATE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_CREATE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_CREATE' ] ).
            data(rule) = cache[ key = 'KW_CREATE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_CREATE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_CREATE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_DELETE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_DELETE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_DELETE' ] ).
            data(rule) = cache[ key = 'KW_DELETE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_DELETE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_DELETE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_INSERT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_INSERT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_INSERT' ] ).
            data(rule) = cache[ key = 'KW_INSERT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_INSERT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_INSERT(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_RECURSIVE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_RECURSIVE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_RECURSIVE' ] ).
            data(rule) = cache[ key = 'KW_RECURSIVE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_RECURSIVE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_RECURSIVE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_REPLACE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_REPLACE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_REPLACE' ] ).
            data(rule) = cache[ key = 'KW_REPLACE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_REPLACE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_REPLACE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_EXPLAIN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_EXPLAIN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_EXPLAIN' ] ).
            data(rule) = cache[ key = 'KW_EXPLAIN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_EXPLAIN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_EXPLAIN(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_INTO.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_INTO' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_INTO' ] ).
            data(rule) = cache[ key = 'KW_INTO' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_INTO' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_INTO(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_FROM.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_FROM' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_FROM' ] ).
            data(rule) = cache[ key = 'KW_FROM' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_FROM' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_FROM(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_SET.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_SET' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_SET' ] ).
            data(rule) = cache[ key = 'KW_SET' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_SET' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_SET(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_AS.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_AS' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_AS' ] ).
            data(rule) = cache[ key = 'KW_AS' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_AS' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_AS(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_TABLE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_TABLE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_TABLE' ] ).
            data(rule) = cache[ key = 'KW_TABLE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_TABLE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_TABLE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_ON.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_ON' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_ON' ] ).
            data(rule) = cache[ key = 'KW_ON' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_ON' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_ON(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_LEFT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_LEFT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_LEFT' ] ).
            data(rule) = cache[ key = 'KW_LEFT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_LEFT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_LEFT(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_RIGHT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_RIGHT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_RIGHT' ] ).
            data(rule) = cache[ key = 'KW_RIGHT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_RIGHT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_RIGHT(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_FULL.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_FULL' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_FULL' ] ).
            data(rule) = cache[ key = 'KW_FULL' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_FULL' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_FULL(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_INNER.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_INNER' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_INNER' ] ).
            data(rule) = cache[ key = 'KW_INNER' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_INNER' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_INNER(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_JOIN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_JOIN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_JOIN' ] ).
            data(rule) = cache[ key = 'KW_JOIN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_JOIN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_JOIN(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_OUTER.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_OUTER' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_OUTER' ] ).
            data(rule) = cache[ key = 'KW_OUTER' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_OUTER' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_OUTER(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_UNION.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_UNION' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_UNION' ] ).
            data(rule) = cache[ key = 'KW_UNION' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_UNION' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_UNION(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_VALUES.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_VALUES' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_VALUES' ] ).
            data(rule) = cache[ key = 'KW_VALUES' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_VALUES' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_VALUES(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_USING.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_USING' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_USING' ] ).
            data(rule) = cache[ key = 'KW_USING' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_USING' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_USING(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_LATERAL.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_LATERAL' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_LATERAL' ] ).
            data(rule) = cache[ key = 'KW_LATERAL' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_LATERAL' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_LATERAL(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_WHERE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_WHERE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_WHERE' ] ).
            data(rule) = cache[ key = 'KW_WHERE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_WHERE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_WHERE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_WITH.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_WITH' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_WITH' ] ).
            data(rule) = cache[ key = 'KW_WITH' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_WITH' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_WITH(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_GROUP.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_GROUP' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_GROUP' ] ).
            data(rule) = cache[ key = 'KW_GROUP' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_GROUP' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_GROUP(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_BY.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_BY' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_BY' ] ).
            data(rule) = cache[ key = 'KW_BY' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_BY' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_BY(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_ORDER.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_ORDER' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_ORDER' ] ).
            data(rule) = cache[ key = 'KW_ORDER' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_ORDER' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_ORDER(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_HAVING.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_HAVING' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_HAVING' ] ).
            data(rule) = cache[ key = 'KW_HAVING' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_HAVING' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_HAVING(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_LIMIT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_LIMIT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_LIMIT' ] ).
            data(rule) = cache[ key = 'KW_LIMIT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_LIMIT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_LIMIT(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_ASC.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_ASC' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_ASC' ] ).
            data(rule) = cache[ key = 'KW_ASC' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_ASC' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_ASC(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_DESC.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_DESC' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_DESC' ] ).
            data(rule) = cache[ key = 'KW_DESC' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_DESC' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_DESC(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_ALL.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_ALL' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_ALL' ] ).
            data(rule) = cache[ key = 'KW_ALL' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_ALL' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_ALL(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_DISTINCT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_DISTINCT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_DISTINCT' ] ).
            data(rule) = cache[ key = 'KW_DISTINCT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_DISTINCT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_DISTINCT(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_BETWEEN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_BETWEEN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_BETWEEN' ] ).
            data(rule) = cache[ key = 'KW_BETWEEN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_BETWEEN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_BETWEEN(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_IN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_IN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_IN' ] ).
            data(rule) = cache[ key = 'KW_IN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_IN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_IN(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_IS.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_IS' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_IS' ] ).
            data(rule) = cache[ key = 'KW_IS' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_IS' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_IS(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_LIKE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_LIKE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_LIKE' ] ).
            data(rule) = cache[ key = 'KW_LIKE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_LIKE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_LIKE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_EXISTS.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_EXISTS' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_EXISTS' ] ).
            data(rule) = cache[ key = 'KW_EXISTS' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_EXISTS' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_EXISTS(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_NOT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_NOT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_NOT' ] ).
            data(rule) = cache[ key = 'KW_NOT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_NOT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_NOT(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_AND.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_AND' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_AND' ] ).
            data(rule) = cache[ key = 'KW_AND' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_AND' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_AND(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_OR.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_OR' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_OR' ] ).
            data(rule) = cache[ key = 'KW_OR' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_OR' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_OR(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_COUNT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_COUNT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_COUNT' ] ).
            data(rule) = cache[ key = 'KW_COUNT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_COUNT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_COUNT(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_MAX.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_MAX' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_MAX' ] ).
            data(rule) = cache[ key = 'KW_MAX' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_MAX' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_MAX(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_MIN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_MIN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_MIN' ] ).
            data(rule) = cache[ key = 'KW_MIN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_MIN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_MIN(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_SUM.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_SUM' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_SUM' ] ).
            data(rule) = cache[ key = 'KW_SUM' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_SUM' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_SUM(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_AVG.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_AVG' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_AVG' ] ).
            data(rule) = cache[ key = 'KW_AVG' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_AVG' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_AVG(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_CASE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_CASE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_CASE' ] ).
            data(rule) = cache[ key = 'KW_CASE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_CASE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_CASE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_WHEN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_WHEN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_WHEN' ] ).
            data(rule) = cache[ key = 'KW_WHEN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_WHEN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_WHEN(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_THEN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_THEN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_THEN' ] ).
            data(rule) = cache[ key = 'KW_THEN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_THEN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_THEN(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_ELSE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_ELSE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_ELSE' ] ).
            data(rule) = cache[ key = 'KW_ELSE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_ELSE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_ELSE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_END.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_END' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_END' ] ).
            data(rule) = cache[ key = 'KW_END' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_END' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_END(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_CAST.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_CAST' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_CAST' ] ).
            data(rule) = cache[ key = 'KW_CAST' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_CAST' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_CAST(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_CHAR.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_CHAR' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_CHAR' ] ).
            data(rule) = cache[ key = 'KW_CHAR' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_CHAR' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_CHAR(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_VARCHAR.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_VARCHAR' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_VARCHAR' ] ).
            data(rule) = cache[ key = 'KW_VARCHAR' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_VARCHAR' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_VARCHAR(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_NUMERIC.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_NUMERIC' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_NUMERIC' ] ).
            data(rule) = cache[ key = 'KW_NUMERIC' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_NUMERIC' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_NUMERIC(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_DECIMAL.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_DECIMAL' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_DECIMAL' ] ).
            data(rule) = cache[ key = 'KW_DECIMAL' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_DECIMAL' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_DECIMAL(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_SIGNED.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_SIGNED' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_SIGNED' ] ).
            data(rule) = cache[ key = 'KW_SIGNED' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_SIGNED' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_SIGNED(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_UNSIGNED.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_UNSIGNED' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_UNSIGNED' ] ).
            data(rule) = cache[ key = 'KW_UNSIGNED' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_UNSIGNED' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_UNSIGNED(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_INT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_INT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_INT' ] ).
            data(rule) = cache[ key = 'KW_INT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_INT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_INT(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_INTEGER.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_INTEGER' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_INTEGER' ] ).
            data(rule) = cache[ key = 'KW_INTEGER' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_INTEGER' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_INTEGER(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_JSON.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_JSON' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_JSON' ] ).
            data(rule) = cache[ key = 'KW_JSON' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_JSON' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_JSON(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_SMALLINT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_SMALLINT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_SMALLINT' ] ).
            data(rule) = cache[ key = 'KW_SMALLINT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_SMALLINT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_SMALLINT(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_DATE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_DATE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_DATE' ] ).
            data(rule) = cache[ key = 'KW_DATE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_DATE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_DATE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_TIME.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_TIME' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_TIME' ] ).
            data(rule) = cache[ key = 'KW_TIME' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_TIME' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_TIME(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_TIMESTAMP.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_TIMESTAMP' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_TIMESTAMP' ] ).
            data(rule) = cache[ key = 'KW_TIMESTAMP' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_TIMESTAMP' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_TIMESTAMP(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_USER.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_USER' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_USER' ] ).
            data(rule) = cache[ key = 'KW_USER' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_USER' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_USER(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_INTERVAL.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_INTERVAL' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_INTERVAL' ] ).
            data(rule) = cache[ key = 'KW_INTERVAL' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_INTERVAL' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_INTERVAL(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_MINUTE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_MINUTE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_MINUTE' ] ).
            data(rule) = cache[ key = 'KW_MINUTE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_MINUTE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_MINUTE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_HOUR.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_HOUR' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_HOUR' ] ).
            data(rule) = cache[ key = 'KW_HOUR' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_HOUR' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_HOUR(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_DAY.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_DAY' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_DAY' ] ).
            data(rule) = cache[ key = 'KW_DAY' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_DAY' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_DAY(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_MONTH.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_MONTH' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_MONTH' ] ).
            data(rule) = cache[ key = 'KW_MONTH' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_MONTH' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_MONTH(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_YEAR.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_YEAR' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_YEAR' ] ).
            data(rule) = cache[ key = 'KW_YEAR' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_YEAR' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_YEAR(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_CURRENT_DATE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_CURRENT_DATE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_CURRENT_DATE' ] ).
            data(rule) = cache[ key = 'KW_CURRENT_DATE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_CURRENT_DATE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_CURRENT_DATE(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_CURRENT_TIME.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_CURRENT_TIME' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_CURRENT_TIME' ] ).
            data(rule) = cache[ key = 'KW_CURRENT_TIME' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_CURRENT_TIME' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_CURRENT_TIME(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_CURRENT_TIMESTAMP.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_CURRENT_TIMESTAMP' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_CURRENT_TIMESTAMP' ] ).
            data(rule) = cache[ key = 'KW_CURRENT_TIMESTAMP' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_CURRENT_TIMESTAMP' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_CURRENT_TIMESTAMP(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_CURRENT_USER.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_CURRENT_USER' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_CURRENT_USER' ] ).
            data(rule) = cache[ key = 'KW_CURRENT_USER' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_CURRENT_USER' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_CURRENT_USER(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_SESSION_USER.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_SESSION_USER' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_SESSION_USER' ] ).
            data(rule) = cache[ key = 'KW_SESSION_USER' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_SESSION_USER' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_SESSION_USER(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_SYSTEM_USER.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_SYSTEM_USER' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_SYSTEM_USER' ] ).
            data(rule) = cache[ key = 'KW_SYSTEM_USER' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_SYSTEM_USER' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_SYSTEM_USER(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_VAR_PRE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_VAR_PRE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_VAR_PRE' ] ).
            data(rule) = cache[ key = 'KW_VAR_PRE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_VAR_PRE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_RETURN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_RETURN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_RETURN' ] ).
            data(rule) = cache[ key = 'KW_RETURN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_RETURN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_ASSIGN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_ASSIGN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_ASSIGN' ] ).
            data(rule) = cache[ key = 'KW_ASSIGN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_ASSIGN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_DUAL.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_DUAL' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_DUAL' ] ).
            data(rule) = cache[ key = 'KW_DUAL' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_DUAL' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_KW_ROW.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'KW_ROW' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'KW_ROW' ] ).
            data(rule) = cache[ key = 'KW_ROW' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'KW_ROW' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                <>.
                address2 = read_ident_start( ).
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
                address0 = new zcl_sql_tree_node_KW_ROW(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_OPT_SQL_CALC_FOUND_ROWS.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'OPT_SQL_CALC_FOUND_ROWS' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'OPT_SQL_CALC_FOUND_ROWS' ] ).
            data(rule) = cache[ key = 'OPT_SQL_CALC_FOUND_ROWS' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'OPT_SQL_CALC_FOUND_ROWS' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_OPT_SQL_CACHE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'OPT_SQL_CACHE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'OPT_SQL_CACHE' ] ).
            data(rule) = cache[ key = 'OPT_SQL_CACHE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'OPT_SQL_CACHE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_OPT_SQL_NO_CACHE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'OPT_SQL_NO_CACHE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'OPT_SQL_NO_CACHE' ] ).
            data(rule) = cache[ key = 'OPT_SQL_NO_CACHE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'OPT_SQL_NO_CACHE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_OPT_SQL_SMALL_RESULT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'OPT_SQL_SMALL_RESULT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'OPT_SQL_SMALL_RESULT' ] ).
            data(rule) = cache[ key = 'OPT_SQL_SMALL_RESULT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'OPT_SQL_SMALL_RESULT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_OPT_SQL_BIG_RESULT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'OPT_SQL_BIG_RESULT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'OPT_SQL_BIG_RESULT' ] ).
            data(rule) = cache[ key = 'OPT_SQL_BIG_RESULT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'OPT_SQL_BIG_RESULT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_OPT_SQL_BUFFER_RESULT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'OPT_SQL_BUFFER_RESULT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'OPT_SQL_BUFFER_RESULT' ] ).
            data(rule) = cache[ key = 'OPT_SQL_BUFFER_RESULT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'OPT_SQL_BUFFER_RESULT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_DOT.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'DOT' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'DOT' ] ).
            data(rule) = cache[ key = 'DOT' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'DOT' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_COMMA.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'COMMA' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'COMMA' ] ).
            data(rule) = cache[ key = 'COMMA' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'COMMA' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_STAR.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'STAR' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'STAR' ] ).
            data(rule) = cache[ key = 'STAR' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'STAR' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_LPAREN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'LPAREN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'LPAREN' ] ).
            data(rule) = cache[ key = 'LPAREN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'LPAREN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_RPAREN.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'RPAREN' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'RPAREN' ] ).
            data(rule) = cache[ key = 'RPAREN' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'RPAREN' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_LBRAKE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'LBRAKE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'LBRAKE' ] ).
            data(rule) = cache[ key = 'LBRAKE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'LBRAKE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_RBRAKE.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'RBRAKE' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'RBRAKE' ] ).
            data(rule) = cache[ key = 'RBRAKE' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'RBRAKE' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read___.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = '__' value = value #( ) ) to cache.
        if line_exists( cache[ key = '__' ] ).
            data(rule) = cache[ key = '__' ]-value.
        endif.
        if rule is initial.
            append value #( key = '__' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data address1 type ref to zcl_sql_tree_node.
            clear address1.
            do.
                data(index2) = offset.
                address1 = read_whitespace( ).
                if address1 = failure_node.
                    offset = index2.
                    address1 = read_comment( ).
                    if address1 = failure_node.
                        offset = index2.
                    endif.
                endif.
                if address1 <> failure_node.
                    append address1 to elements0.
                else.
                    exit.
                endif.
            enddo.
            if lines( elements0 ) >= 0.
                address0 = new zcl_sql_tree_node(
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
    
    method read_comment.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'comment' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'comment' ] ).
            data(rule) = cache[ key = 'comment' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'comment' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_block_comment( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_line_comment( ).
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_block_comment.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'block_comment' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'block_comment' ] ).
            data(rule) = cache[ key = 'block_comment' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'block_comment' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    <>.
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_char( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_block_comment(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    address2 = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    address2 = failure_node.
                endif.
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address6) = failure_node.
                    if address6 <> failure_node.
                        append address6 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_block_comment(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_line_comment.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'line_comment' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'line_comment' ] ).
            data(rule) = cache[ key = 'line_comment' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'line_comment' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    <>.
                    address4 = read_eol( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_char( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_line_comment(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    address2 = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    address2 = failure_node.
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
                address0 = new zcl_sql_tree_node_line_comment(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_char.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'char' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'char' ] ).
            data(rule) = cache[ key = 'char' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'char' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            if offset < input_size.
                address0 = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                address0 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::char` ) ( `<any char>` ) ) to expected.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_whitespace.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'whitespace' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'whitespace' ] ).
            data(rule) = cache[ key = 'whitespace' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'whitespace' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data chunk0 type string.
            clear chunk0.
            data(max0) = offset + 1.
            if max0 <= input_size.
                chunk0 = substring( val = input off = offset len = max0 - offset ).
            endif.
            if chunk0 is not initial and regex12->create_matcher( text = chunk0 )->match( ) = abap_true.
                address0 = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                address0 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::whitespace` ) ( `regex12` ) ) to expected.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_EOL.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'EOL' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'EOL' ] ).
            data(rule) = cache[ key = 'EOL' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'EOL' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_eof( ).
            if address0 = failure_node.
                offset = index1.
                data(index2) = offset.
                data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements0.
                data address1 type ref to zcl_sql_tree_node.
                clear address1.
                do.
                    data chunk0 type string.
                    clear chunk0.
                    data(max0) = offset + 1.
                    if max0 <= input_size.
                        chunk0 = substring( val = input off = offset len = max0 - offset ).
                    endif.
                    if chunk0 is not initial and regex13->create_matcher( text = chunk0 )->match( ) = abap_true.
                        address1 = new zcl_sql_tree_node(
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
                            append value #( ( `sql::EOL` ) ( `regex13` ) ) to expected.
                        endif.
                    endif.
                    if address1 <> failure_node.
                        append address1 to elements0.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements0 ) >= 0 and lines( elements0 ) <= 1.
                    address0 = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements0 ).
                    offset = offset.
                else.
                    address0 = failure_node.
                endif.
                if address0 = failure_node.
                    offset = index1.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_EOF.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'EOF' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'EOF' ] ).
            data(rule) = cache[ key = 'EOF' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'EOF' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            <>.
            if offset < input_size.
                address0 = new zcl_sql_tree_node(
                    text = substring( val = input off = offset len = offset + 1 - offset )
                    offset = offset
                    elements = value #( ) ).
                offset = offset + 1.
            else.
                address0 = failure_node.
                if offset > failure.
                    failure = offset.
                endif.
                if offset = failure.
                    append value #( ( `sql::EOF` ) ( `<any char>` ) ) to expected.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_proc_stmts.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'proc_stmts' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'proc_stmts' ] ).
            data(rule) = cache[ key = 'proc_stmts' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'proc_stmts' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data address1 type ref to zcl_sql_tree_node.
            clear address1.
            do.
                address1 = read_proc_stmt( ).
                if address1 <> failure_node.
                    append address1 to elements0.
                else.
                    exit.
                endif.
            enddo.
            if lines( elements0 ) >= 0.
                address0 = new zcl_sql_tree_node(
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
    
    method read_proc_stmt.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'proc_stmt' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'proc_stmt' ] ).
            data(rule) = cache[ key = 'proc_stmt' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'proc_stmt' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            and.
            address1 = read___( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                undefined = read_assign_stmt( ).
                if undefined = failure_node.
                    offset = index2.
                    undefined = read_return_stmt( ).
                    if undefined = failure_node.
                        offset = index2.
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
                address0 = new zcl_sql_tree_node_proc_stmt(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_assign_stmt.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'assign_stmt' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'assign_stmt' ] ).
            data(rule) = cache[ key = 'assign_stmt' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'assign_stmt' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_var_decl( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_kw_assign( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_proc_expr( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_assign_stmt(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_return_stmt.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'return_stmt' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'return_stmt' ] ).
            data(rule) = cache[ key = 'return_stmt' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'return_stmt' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_return( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_proc_expr( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_return_stmt(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_proc_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'proc_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'proc_expr' ] ).
            data(rule) = cache[ key = 'proc_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'proc_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_select_stmt( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_proc_join( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_proc_additive_expr( ).
                    if address0 = failure_node.
                        offset = index1.
                        address0 = read_proc_array( ).
                        if address0 = failure_node.
                            offset = index1.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_proc_additive_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'proc_additive_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'proc_additive_expr' ] ).
            data(rule) = cache[ key = 'proc_additive_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'proc_additive_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_proc_multiplicative_expr( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_additive_operator( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_proc_multiplicative_expr( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_proc_additive_expr(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_proc_additive_expr(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_proc_multiplicative_expr.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'proc_multiplicative_expr' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'proc_multiplicative_expr' ] ).
            data(rule) = cache[ key = 'proc_multiplicative_expr' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'proc_multiplicative_expr' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_proc_primary( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_multiplicative_operator( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_proc_primary( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_proc_multiplicative_expr(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_proc_multiplicative_expr(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_proc_join.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'proc_join' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'proc_join' ] ).
            data(rule) = cache[ key = 'proc_join' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'proc_join' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_var_decl( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_join_op( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_var_decl( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    undefined = read_on_clause( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_proc_join(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_proc_primary.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'proc_primary' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'proc_primary' ] ).
            data(rule) = cache[ key = 'proc_primary' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'proc_primary' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_literal( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_var_decl( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_proc_func_call( ).
                    if address0 = failure_node.
                        offset = index1.
                        address0 = read_param( ).
                        if address0 = failure_node.
                            offset = index1.
                            data(index2) = offset.
                            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
                            clear elements0.
                            data(address1) = failure_node.
                            address1 = read_lparen( ).
                            if address1 <> failure_node.
                                append address1 to elements0.
                                data(address2) = failure_node.
                                address2 = read___( ).
                                if address2 <> failure_node.
                                    append address2 to elements0.
                                    data(address3) = failure_node.
                                    undefined = read_proc_additive_expr( ).
                                    if address3 <> failure_node.
                                        append address3 to elements0.
                                        data(address4) = failure_node.
                                        address4 = read___( ).
                                        if address4 <> failure_node.
                                            append address4 to elements0.
                                            data(address5) = failure_node.
                                            address5 = read_rparen( ).
                                            if address5 <> failure_node.
                                                append address5 to elements0.
                                            else.
                                                clear elements0.
                                                offset = index2.
                                            endif.
                                        else.
                                            clear elements0.
                                            offset = index2.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index2.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index2.
                                endif.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                            if elements0 is initial.
                                address0 = failure_node.
                            else.
                                address0 = new zcl_sql_tree_node_proc_primary(
                                    text = substring( val = input off = index2 len = offset - index2 )
                                    offset = index2
                                    elements = elements0 ).
                                offset = offset.
                            endif.
                            if address0 = failure_node.
                                offset = index1.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_proc_func_call.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'proc_func_call' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'proc_func_call' ] ).
            data(rule) = cache[ key = 'proc_func_call' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'proc_func_call' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_ident( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_lparen( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            undefined = read_proc_primary_list( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address6) = failure_node.
                                address6 = read___( ).
                                if address6 <> failure_node.
                                    append address6 to elements0.
                                    data(address7) = failure_node.
                                    address7 = read_rparen( ).
                                    if address7 <> failure_node.
                                        append address7 to elements0.
                                    else.
                                        clear elements0.
                                        offset = index1.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index1.
                                endif.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_proc_func_call(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_proc_primary_list.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'proc_primary_list' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'proc_primary_list' ] ).
            data(rule) = cache[ key = 'proc_primary_list' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'proc_primary_list' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            undefined = read_proc_primary( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data address3 type ref to zcl_sql_tree_node.
                clear address3.
                do.
                    data(index3) = offset.
                    data elements2 type zcl_sql_tree_node=>tree_node_list_tab.
                    clear elements2.
                    data(address4) = failure_node.
                    address4 = read___( ).
                    if address4 <> failure_node.
                        append address4 to elements2.
                        data(address5) = failure_node.
                        address5 = read_comma( ).
                        if address5 <> failure_node.
                            append address5 to elements2.
                            data(address6) = failure_node.
                            address6 = read___( ).
                            if address6 <> failure_node.
                                append address6 to elements2.
                                data(address7) = failure_node.
                                address7 = read_proc_primary( ).
                                if address7 <> failure_node.
                                    append address7 to elements2.
                                else.
                                    clear elements2.
                                    offset = index3.
                                endif.
                            else.
                                clear elements2.
                                offset = index3.
                            endif.
                        else.
                            clear elements2.
                            offset = index3.
                        endif.
                    else.
                        clear elements2.
                        offset = index3.
                    endif.
                    if elements2 is initial.
                        undefined = failure_node.
                    else.
                        undefined = new zcl_sql_tree_node_proc_primary_list(
                            text = substring( val = input off = index3 len = offset - index3 )
                            offset = index3
                            elements = elements2 ).
                        offset = offset.
                    endif.
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        exit.
                    endif.
                enddo.
                if lines( elements1 ) >= 0.
                    undefined = new zcl_sql_tree_node(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                else.
                    undefined = failure_node.
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
                address0 = new zcl_sql_tree_node_proc_primary_list(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_proc_array.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'proc_array' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'proc_array' ] ).
            data(rule) = cache[ key = 'proc_array' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'proc_array' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_lbrake( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_proc_primary_list( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            address5 = read_rbrake( ).
                            if address5 <> failure_node.
                                append address5 to elements0.
                            else.
                                clear elements0.
                                offset = index1.
                            endif.
                        else.
                            clear elements0.
                            offset = index1.
                        endif.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_proc_array(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_var_decl.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'var_decl' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'var_decl' ] ).
            data(rule) = cache[ key = 'var_decl' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'var_decl' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            address1 = read_kw_var_pre( ).
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                undefined = read_ident_name( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    undefined = read_mem_chain( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                    else.
                        clear elements0.
                        offset = index1.
                    endif.
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
                address0 = new zcl_sql_tree_node_var_decl(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_mem_chain.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'mem_chain' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'mem_chain' ] ).
            data(rule) = cache[ key = 'mem_chain' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'mem_chain' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data address1 type ref to zcl_sql_tree_node.
            clear address1.
            do.
                data(index2) = offset.
                data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                clear elements1.
                data(address2) = failure_node.
                if address2 <> failure_node.
                    append address2 to elements1.
                    data(address3) = failure_node.
                    address3 = read_ident_name( ).
                    if address3 <> failure_node.
                        append address3 to elements1.
                    else.
                        clear elements1.
                        offset = index2.
                    endif.
                else.
                    clear elements1.
                    offset = index2.
                endif.
                if elements1 is initial.
                    undefined = failure_node.
                else.
                    undefined = new zcl_sql_tree_node_mem_chain(
                        text = substring( val = input off = index2 len = offset - index2 )
                        offset = index2
                        elements = elements1 ).
                    offset = offset.
                endif.
                if address1 <> failure_node.
                    append address1 to elements0.
                else.
                    exit.
                endif.
            enddo.
            if lines( elements0 ) >= 0.
                undefined = new zcl_sql_tree_node(
                    text = substring( val = input off = index1 len = offset - index1 )
                    offset = index1
                    elements = elements0 ).
                offset = offset.
            else.
                undefined = failure_node.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_data_type.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'data_type' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'data_type' ] ).
            data(rule) = cache[ key = 'data_type' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'data_type' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            address0 = read_character_string_type( ).
            if address0 = failure_node.
                offset = index1.
                address0 = read_numeric_type( ).
                if address0 = failure_node.
                    offset = index1.
                    address0 = read_datetime_type( ).
                    if address0 = failure_node.
                        offset = index1.
                        address0 = read_json_type( ).
                        if address0 = failure_node.
                            offset = index1.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_character_string_type.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'character_string_type' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'character_string_type' ] ).
            data(rule) = cache[ key = 'character_string_type' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'character_string_type' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            data(index2) = offset.
            data elements0 type zcl_sql_tree_node=>tree_node_list_tab.
            clear elements0.
            data(address1) = failure_node.
            data(index3) = offset.
            undefined = read_kw_char( ).
            if undefined = failure_node.
                offset = index3.
                undefined = read_kw_varchar( ).
                if undefined = failure_node.
                    offset = index3.
                endif.
            endif.
            if address1 <> failure_node.
                append address1 to elements0.
                data(address2) = failure_node.
                address2 = read___( ).
                if address2 <> failure_node.
                    append address2 to elements0.
                    data(address3) = failure_node.
                    address3 = read_lparen( ).
                    if address3 <> failure_node.
                        append address3 to elements0.
                        data(address4) = failure_node.
                        address4 = read___( ).
                        if address4 <> failure_node.
                            append address4 to elements0.
                            data(address5) = failure_node.
                            data(index4) = offset.
                            data elements1 type zcl_sql_tree_node=>tree_node_list_tab.
                            clear elements1.
                            data address6 type ref to zcl_sql_tree_node.
                            clear address6.
                            do.
                                data chunk0 type string.
                                clear chunk0.
                                data(max0) = offset + 1.
                                if max0 <= input_size.
                                    chunk0 = substring( val = input off = offset len = max0 - offset ).
                                endif.
                                if chunk0 is not initial and regex14->create_matcher( text = chunk0 )->match( ) = abap_true.
                                    address6 = new zcl_sql_tree_node(
                                        text = substring( val = input off = offset len = offset + 1 - offset )
                                        offset = offset
                                        elements = value #( ) ).
                                    offset = offset + 1.
                                else.
                                    address6 = failure_node.
                                    if offset > failure.
                                        failure = offset.
                                    endif.
                                    if offset = failure.
                                        append value #( ( `sql::character_string_type` ) ( `regex14` ) ) to expected.
                                    endif.
                                endif.
                                if address6 <> failure_node.
                                    append address6 to elements1.
                                else.
                                    exit.
                                endif.
                            enddo.
                            if lines( elements1 ) >= 0 and lines( elements1 ) <= 1.
                                undefined = new zcl_sql_tree_node(
                                    text = substring( val = input off = index4 len = offset - index4 )
                                    offset = index4
                                    elements = elements1 ).
                                offset = offset.
                            else.
                                undefined = failure_node.
                            endif.
                            if address5 <> failure_node.
                                append address5 to elements0.
                                data(address7) = failure_node.
                                address7 = read___( ).
                                if address7 <> failure_node.
                                    append address7 to elements0.
                                    data(address8) = failure_node.
                                    address8 = read_rparen( ).
                                    if address8 <> failure_node.
                                        append address8 to elements0.
                                        data(address9) = failure_node.
                                        address9 = read___( ).
                                        if address9 <> failure_node.
                                            append address9 to elements0.
                                        else.
                                            clear elements0.
                                            offset = index2.
                                        endif.
                                    else.
                                        clear elements0.
                                        offset = index2.
                                    endif.
                                else.
                                    clear elements0.
                                    offset = index2.
                                endif.
                            else.
                                clear elements0.
                                offset = index2.
                            endif.
                        else.
                            clear elements0.
                            offset = index2.
                        endif.
                    else.
                        clear elements0.
                        offset = index2.
                    endif.
                else.
                    clear elements0.
                    offset = index2.
                endif.
            else.
                clear elements0.
                offset = index2.
            endif.
            if elements0 is initial.
                address0 = failure_node.
            else.
                address0 = new zcl_sql_tree_node_character_string_type(
                    text = substring( val = input off = index2 len = offset - index2 )
                    offset = index2
                    elements = elements0 ).
                offset = offset.
            endif.
            if address0 = failure_node.
                offset = index1.
                undefined = read_kw_char( ).
                if address0 = failure_node.
                    offset = index1.
                    undefined = read_kw_varchar( ).
                    if address0 = failure_node.
                        offset = index1.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_numeric_type.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'numeric_type' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'numeric_type' ] ).
            data(rule) = cache[ key = 'numeric_type' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'numeric_type' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            undefined = read_kw_numeric( ).
            if undefined = failure_node.
                offset = index1.
                undefined = read_kw_decimal( ).
                if undefined = failure_node.
                    offset = index1.
                    undefined = read_kw_int( ).
                    if undefined = failure_node.
                        offset = index1.
                        undefined = read_kw_integer( ).
                        if undefined = failure_node.
                            offset = index1.
                            undefined = read_kw_smallint( ).
                            if undefined = failure_node.
                                offset = index1.
                            endif.
                        endif.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_datetime_type.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'datetime_type' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'datetime_type' ] ).
            data(rule) = cache[ key = 'datetime_type' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'datetime_type' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            data(index1) = offset.
            undefined = read_kw_date( ).
            if undefined = failure_node.
                offset = index1.
                undefined = read_kw_time( ).
                if undefined = failure_node.
                    offset = index1.
                    undefined = read_kw_timestamp( ).
                    if undefined = failure_node.
                        offset = index1.
                    endif.
                endif.
            endif.
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    method read_json_type.
        data(address0) = failure_node.
        data(index0) = offset.
        append value #( key = 'json_type' value = value #( ) ) to cache.
        if line_exists( cache[ key = 'json_type' ] ).
            data(rule) = cache[ key = 'json_type' ]-value.
        endif.
        if rule is initial.
            append value #( key = 'json_type' value = rule ) to cache.
        endif.
        if line_exists( rule[ key = offset ] ).
            address0 = rule[ key = offset ]-value->node.
            offset = rule[ key = offset ]-value->tail.
        else.
            undefined = read_kw_json( ).
            append value #( key = index0 value = new cache_record( node = address0 tail = offset ) ) to rule.
        endif.
        result = address0.
    endmethod.
    
    

  method parse.
    data(parser) = new zcl_sql_parser( input = input actions = actions ).
    result = parser->parse3( ).
  endmethod.

  method parse2.
    result = parse( input = input ).
  endmethod.

  method parse3.
    data(tree) = read_start( ).
    if tree <> failure_node and offset = input_size.
      result = tree.
      return.
    endif.
    if expected is initial.
      failure = offset.
      append value stringtab( ( `sql` ) ( `<EOF>` ) ) to expected.
    endif.
    raise exception type zcx_sql_parser_error
        exporting message = format_error( input = input offset = failure expected = expected ).
  endmethod.

endclass.
