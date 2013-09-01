local matrixtest = {}

function matrixtest.test_should_return_identity_matrix()
	-- when:
	local identitymatrix = vega.matrix.identity()

	-- then:
	assert_equal(1, identitymatrix[1][1], "Matrix[1][1] is not the expected.")
	assert_equal(0, identitymatrix[2][1], "Matrix[2][1] is not the expected.")
	assert_equal(0, identitymatrix[3][1], "Matrix[3][1] is not the expected.")
	assert_equal(0, identitymatrix[1][2], "Matrix[1][2] is not the expected.")
	assert_equal(1, identitymatrix[2][2], "Matrix[2][2] is not the expected.")
	assert_equal(0, identitymatrix[3][2], "Matrix[3][2] is not the expected.")
	assert_equal(0, identitymatrix[1][3], "Matrix[1][3] is not the expected.")
	assert_equal(0, identitymatrix[2][3], "Matrix[2][3] is not the expected.")
	assert_equal(1, identitymatrix[3][3], "Matrix[3][3] is not the expected.")
end

function matrixtest.test_should_multiply_matrixes()
	-- given:
	local m1 = {
		{ 1, 2, 3 },
		{ 4, 5, 6 },
		{ 7, 8, 9 }
	}
	local m2 = {
		{ 10, 20, 30 },
		{ 40, 50, 60 },
		{ 70, 80, 90 }
	}

	-- when:
	local result = vega.matrix.multiply(m1, m2)

	-- then:
	assert_equal(300, result[1][1], "Matrix[1][1] is not the expected.")
	assert_equal(660, result[2][1], "Matrix[2][1] is not the expected.")
	assert_equal(1020, result[3][1], "Matrix[3][1] is not the expected.")
	assert_equal(360, result[1][2], "Matrix[1][2] is not the expected.")
	assert_equal(810, result[2][2], "Matrix[2][2] is not the expected.")
	assert_equal(1260, result[3][2], "Matrix[3][2] is not the expected.")
	assert_equal(420, result[1][3], "Matrix[1][3] is not the expected.")
	assert_equal(960, result[2][3], "Matrix[2][3] is not the expected.")
	assert_equal(1500, result[3][3], "Matrix[3][3] is not the expected.")
end

function matrixtest.test_should_create_translation_matrix()
	-- given:
	local vector = { x = 10, y = 20 }

	-- when:
	local matrix = vega.matrix.translation(vector)

	-- then:
	assert_equal(1, matrix[1][1], "Matrix[1][1] is not the expected.")
	assert_equal(0, matrix[2][1], "Matrix[2][1] is not the expected.")
	assert_equal(0, matrix[3][1], "Matrix[3][1] is not the expected.")
	assert_equal(0, matrix[1][2], "Matrix[1][2] is not the expected.")
	assert_equal(1, matrix[2][2], "Matrix[2][2] is not the expected.")
	assert_equal(0, matrix[3][2], "Matrix[3][2] is not the expected.")
	assert_equal(10, matrix[1][3], "Matrix[1][3] is not the expected.")
	assert_equal(20, matrix[2][3], "Matrix[2][3] is not the expected.")
	assert_equal(1, matrix[3][3], "Matrix[3][3] is not the expected.")
end

function matrixtest.test_should_create_translation_matrix_using_vector_with_numeric_indices()
	-- given:
	local vector = { 10, 20 }

	-- when:
	local matrix = vega.matrix.translation(vector)

	-- then:
	assert_equal(1, matrix[1][1], "Matrix[1][1] is not the expected.")
	assert_equal(0, matrix[2][1], "Matrix[2][1] is not the expected.")
	assert_equal(0, matrix[3][1], "Matrix[3][1] is not the expected.")
	assert_equal(0, matrix[1][2], "Matrix[1][2] is not the expected.")
	assert_equal(1, matrix[2][2], "Matrix[2][2] is not the expected.")
	assert_equal(0, matrix[3][2], "Matrix[3][2] is not the expected.")
	assert_equal(10, matrix[1][3], "Matrix[1][3] is not the expected.")
	assert_equal(20, matrix[2][3], "Matrix[2][3] is not the expected.")
	assert_equal(1, matrix[3][3], "Matrix[3][3] is not the expected.")
end

function matrixtest.test_should_create_rotation_matrix()
	-- when:
	local matrix = vega.matrix.rotation(30)

	-- then:
	assert_equal(0.866, matrix[1][1], 0.001, "Matrix[1][1] is not the expected.")
	assert_equal(-0.5, matrix[2][1], 0.001, "Matrix[2][1] is not the expected.")
	assert_equal(0, matrix[3][1], "Matrix[3][1] is not the expected.")
	assert_equal(0.5, matrix[1][2], 0.001, "Matrix[1][2] is not the expected.")
	assert_equal(0.866, matrix[2][2], 0.001, "Matrix[2][2] is not the expected.")
	assert_equal(0, matrix[3][2], "Matrix[3][2] is not the expected.")
	assert_equal(0, matrix[1][3], "Matrix[1][3] is not the expected.")
	assert_equal(0, matrix[2][3], "Matrix[2][3] is not the expected.")
	assert_equal(1, matrix[3][3], "Matrix[3][3] is not the expected.")
end

function matrixtest.test_should_create_scale_matrix()
	-- given:
	local vector = { x = 10, y = 20 }

	-- when:
	local matrix = vega.matrix.scale(vector)

	-- then:
	assert_equal(10, matrix[1][1], "Matrix[1][1] is not the expected.")
	assert_equal(0, matrix[2][1], "Matrix[2][1] is not the expected.")
	assert_equal(0, matrix[3][1], "Matrix[3][1] is not the expected.")
	assert_equal(0, matrix[1][2], "Matrix[1][2] is not the expected.")
	assert_equal(20, matrix[2][2], "Matrix[2][2] is not the expected.")
	assert_equal(0, matrix[3][2], "Matrix[3][2] is not the expected.")
	assert_equal(0, matrix[1][3], "Matrix[1][3] is not the expected.")
	assert_equal(0, matrix[2][3], "Matrix[2][3] is not the expected.")
	assert_equal(1, matrix[3][3], "Matrix[3][3] is not the expected.")
end

function matrixtest.test_should_create_scale_matrix_using_vector_with_numeric_indices()
	-- given:
	local vector = { 10, 20 }

	-- when:
	local matrix = vega.matrix.scale(vector)

	-- then:
	assert_equal(10, matrix[1][1], "Matrix[1][1] is not the expected.")
	assert_equal(0, matrix[2][1], "Matrix[2][1] is not the expected.")
	assert_equal(0, matrix[3][1], "Matrix[3][1] is not the expected.")
	assert_equal(0, matrix[1][2], "Matrix[1][2] is not the expected.")
	assert_equal(20, matrix[2][2], "Matrix[2][2] is not the expected.")
	assert_equal(0, matrix[3][2], "Matrix[3][2] is not the expected.")
	assert_equal(0, matrix[1][3], "Matrix[1][3] is not the expected.")
	assert_equal(0, matrix[2][3], "Matrix[2][3] is not the expected.")
	assert_equal(1, matrix[3][3], "Matrix[3][3] is not the expected.")
end

return matrixtest