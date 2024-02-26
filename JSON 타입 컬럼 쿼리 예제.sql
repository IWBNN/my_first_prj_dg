CREATE TABLE example_table (
                               id INT PRIMARY KEY,
                               small_integer SMALLINT,
                               large_integer BIGINT,
                               birth_date DATE,
                               decimal_number DECIMAL(10, 2),
                               floating_point FLOAT,
                               double_precision DOUBLE,
                               fixed_length_string CHAR(10),
                               variable_length_string VARCHAR(255),
                               long_text TEXT,
                               binary_data BLOB,
                               long_binary_data LONGBLOB,
                               json_data JSON
);

INSERT INTO example_table2 (id, json_data) VALUES (1, '{"name": "John", "age": 30, "arr": [10, 20, 30]}');
INSERT INTO example_table2 (id, json_data) VALUES (2, '{"name": "Jenny", "arr": [1, 2, 3]}');

select json_data from example_table2;
SELECT json_data->>'$.name' AS name FROM example_table2 WHERE id = 1;
SELECT json_data->>'$.name' AS name FROM example_table2;

SELECT
    json_data -> '$.arr',
    json_data -> '$.arr[0]',
    json_data -> '$.arr[1]',
    json_data -> '$.arr[2]'
FROM example_table2;

-- Class -> Entity 매핑
    -- filed = attribute
-- Object -> Column 매핑
    -- Object 내부 field = JSON 타입의 key

SELECT json_data->>'$.name' AS name FROM example_table2;
SELECT json_data->'$.name' AS name FROM example_table2;