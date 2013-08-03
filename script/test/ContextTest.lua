local ContextTest = {}

function ContextTest.setup()
	StartComponent = {}
end

function ContextTest.teardown()
	StartComponent = nil
end

function ContextTest.test_should_create_new_context()
	-- when:
	context = vega.Context.new()
	
	-- then:
	assert_table(context)
	assert_true(context.executing, "The executing flag should be true.")
	assert_equal(StartComponent, context.component, "component is not the expected.")
	assert_table(context.contentmanager, "Should create a contentmanager table.")
	assert_table(context.input, "Should create an input table.")
end

return ContextTest