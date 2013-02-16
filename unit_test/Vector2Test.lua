function test_should_create_new_table_with_x_and_y()
	-- when:
	local v = Vector2.new(10, 20)
	
	-- then:
	assert_table(v)
	assert_equal(10, v.x, "x is not the expected.")
	assert_equal(20, v.y, "y is not the expected.")
end

function test_should_create_new_table_with_default_x_and_y()
	-- when:
	local v = Vector2.new()
	
	-- then:
	assert_table(v)
	assert_equal(0, v.x, "x is not the expected.")
	assert_equal(0, v.y, "y is not the expected.")
end

function test_should_create_new_table_with_one_value_for_x_and_y()
	-- when:
	local v = Vector2.new(10)
	
	-- then:
	assert_table(v)
	assert_equal(10, v.x, "x is not the expected.")
	assert_equal(10, v.y, "y is not the expected.")
end

function test_zero_vector()
	assert_table(Vector2.zero)
	assert_equal(0, Vector2.zero.x, "x is not the expected.")
	assert_equal(0, Vector2.zero.y, "y is not the expected.")
end

function test_one_vector()
	assert_table(Vector2.one)
	assert_equal(1, Vector2.one.x, "x is not the expected.")
	assert_equal(1, Vector2.one.y, "y is not the expected.")
end

function test_eq_metamethod()
	assert_true(Vector2.new(10, 20) == Vector2.new(10, 20), "The vectors (10, 20) should be equal.")
	assert_true(Vector2.zero == Vector2.new(0, 0), "The vector zero should be equal to the new vector (0, 0).")
	assert_true(Vector2.one == Vector2.new(1, 1), "The vector one should be equal to the new vector (1, 1).")
	assert_false(Vector2.new(10, 20) == Vector2.new(10, 30), "The vectors (10, 20) and (10, 30) should not be equal.")
end

function test_tostring_metamethod()
	assert_equal("Vector2(10, 20)", tostring(Vector2.new(10, 20)), "The Vector2 as string is not the expected.")
end