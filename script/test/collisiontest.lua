local collisiontest = {}

function collisiontest.test_rectangle_should_collide_with_point_at_begining()
	-- given:
	local rect = {
		position = {
			x = 10,
			y = 11
		},
		size = {
			x = 5,
			y = 6
		}
	}
	local point = {
		x = 10,
		y = 11
	}

	-- when:
	local collides = vega.collision.rectcollideswithpoint(rect, point)

	-- then:
	assert_true(collides)
end

function collisiontest.test_rectangle_should_collide_with_point_at_end()
	-- given:
	local rect = {
		position = {
			x = 10,
			y = 11
		},
		size = {
			x = 5,
			y = 6
		}
	}
	local point = {
		x = 15,
		y = 17
	}

	-- when:
	local collides = vega.collision.rectcollideswithpoint(rect, point)

	-- then:
	assert_true(collides)
end

function collisiontest.test_rectangle_should_collide_with_point_at_middle()
	-- given:
	local rect = {
		position = {
			x = 10,
			y = 11
		},
		size = {
			x = 5,
			y = 6
		}
	}
	local point = {
		x = 12,
		y = 14
	}

	-- when:
	local collides = vega.collision.rectcollideswithpoint(rect, point)

	-- then:
	assert_true(collides)
end

function collisiontest.test_rectangle_should_not_collide_with_point_at_left()
	-- given:
	local rect = {
		position = {
			x = 10,
			y = 11
		},
		size = {
			x = 5,
			y = 6
		}
	}
	local point = {
		x = 9,
		y = 11
	}

	-- when:
	local collides = vega.collision.rectcollideswithpoint(rect, point)

	-- then:
	assert_false(collides)
end

function collisiontest.test_rectangle_should_not_collide_with_point_at_right()
	-- given:
	local rect = {
		position = {
			x = 10,
			y = 11
		},
		size = {
			x = 5,
			y = 6
		}
	}
	local point = {
		x = 16,
		y = 11
	}

	-- when:
	local collides = vega.collision.rectcollideswithpoint(rect, point)

	-- then:
	assert_false(collides)
end

function collisiontest.test_rectangle_should_not_collide_with_point_above()
	-- given:
	local rect = {
		position = {
			x = 10,
			y = 11
		},
		size = {
			x = 5,
			y = 6
		}
	}
	local point = {
		x = 10,
		y = 18
	}

	-- when:
	local collides = vega.collision.rectcollideswithpoint(rect, point)

	-- then:
	assert_false(collides)
end

function collisiontest.test_rectangle_should_not_collide_with_point_below()
	-- given:
	local rect = {
		position = {
			x = 10,
			y = 11
		},
		size = {
			x = 5,
			y = 6
		}
	}
	local point = {
		x = 10,
		y = 10
	}

	-- when:
	local collides = vega.collision.rectcollideswithpoint(rect, point)

	-- then:
	assert_false(collides)
end

function collisiontest.test_rectangle_should_collide_with_rectangle()
	-- given:
	local rect1 = {
		position = {
			x = 10,
			y = 20,
		},
		size = {
			x = 100,
			y = 200,
		}
	}
	local rect2 = {
		position = {
			x = 0,
			y = 0
		},
		size = {
			x = 10,
			y = 20
		}
	}
	local rect3 = {
		position = {
			x = 110,
			y = 0
		},
		size = {
			x = 1,
			y = 20
		}
	}
	local rect4 = {
		position = {
			x = 0,
			y = 220
		},
		size = {
			x = 10,
			y = 1
		}
	}
	local rect5 = {
		position = {
			x = 110,
			y = 220
		},
		size = {
			x = 1,
			y = 1
		}
	}

	-- when:
	local rect1collideswithrect2 = vega.collision.rectcollideswithrect(rect1, rect2)
	local rect1collideswithrect3 = vega.collision.rectcollideswithrect(rect1, rect3)
	local rect1collideswithrect4 = vega.collision.rectcollideswithrect(rect1, rect4)
	local rect1collideswithrect5 = vega.collision.rectcollideswithrect(rect1, rect5)

	-- then:
	assert_true(rect1collideswithrect2, "The rectangle should collide with rect2.")
	assert_true(rect1collideswithrect3, "The rectangle should collide with rect3.")
	assert_true(rect1collideswithrect4, "The rectangle should collide with rect4.")
	assert_true(rect1collideswithrect5, "The rectangle should collide with rect5.")
end

function collisiontest.test_rectangle_should_not_collide_with_rectangle()
	-- given:
	local rect1 = {
		position = {
			x = 10,
			y = 20,
		},
		size = {
			x = 100,
			y = 200,
		}
	}
	local rect2 = {
		position = {
			x = 0,
			y = 110
		},
		size = {
			x = 9,
			y = 1
		}
	}
	local rect3 = {
		position = {
			x = 60,
			y = 0
		},
		size = {
			x = 1,
			y = 19
		}
	}
	local rect4 = {
		position = {
			x = 111,
			y = 110,
		},
		size = {
			x = 1,
			y = 1
		}
	}
	local rect5 = {
		position = {
			x = 60,
			y = 221,
		},
		size = {
			x = 1,
			y = 1
		}
	}
	
	-- when:
	local rect1collideswithrect2 = vega.collision.rectcollideswithrect(rect1, rect2)
	local rect1collideswithrect3 = vega.collision.rectcollideswithrect(rect1, rect3)
	local rect1collideswithrect4 = vega.collision.rectcollideswithrect(rect1, rect4)
	local rect1collideswithrect5 = vega.collision.rectcollideswithrect(rect1, rect5)

	-- then:
	assert_false(rect1collideswithrect2, "The rectangle should not collide with rect2.")
	assert_false(rect1collideswithrect3, "The rectangle should not collide with rect3.")
	assert_false(rect1collideswithrect4, "The rectangle should not collide with rect4.")
	assert_false(rect1collideswithrect5, "The rectangle should not collide with rect5.")
end

function collisiontest.test_drawable_should_collide_with_point()
	-- given:
	local drawable = vega.drawable {
		position = { x = 10, y = 20 },
		size = { x = 100, y = 200 },
		scale = { x = 2, y = 4 }
	}
	local point = {
		x = 210,
		y = 820
	}

	-- when:
	local collides = vega.collision.drawablecollideswithpoint(drawable, point)

	-- then:
	assert_true(collides, "The drawable should collide with the point.")
end

function collisiontest.test_drawable_should_not_collide_with_point()
	-- given:
	local drawable = vega.drawable {
		position = { x = 10, y = 20 },
		size = { x = 100, y = 200 },
		scale = { x = 2, y = 4 }
	}
	local point = {
		x = 211,
		y = 821
	}

	-- when:
	local collides = vega.collision.drawablecollideswithpoint(drawable, point)

	-- then:
	assert_false(collides, "The drawable should not collide with the point.")
end

function collisiontest.test_rotated_drawable_should_collide_with_point()
	-- given:
	local drawable = vega.drawable {
		size = { x = 100, y = 100 },
		origin = { x = 50, y = 50 },
		rotation = 45
	}
	local collidedpoint = {
		x = 50,
		y = 0
	}
	local notcollidedpoint = {
		x = 50,
		y = 50
	}

	-- when:
	local collideswithpoint1 = vega.collision.drawablecollideswithpoint(drawable, collidedpoint)
	local collideswithpoint2 = vega.collision.drawablecollideswithpoint(drawable, notcollidedpoint)

	-- then:
	assert_true(collideswithpoint1, "The drawable should collide with the first point.")
	assert_false(collideswithpoint2, "The drawable should not collide with the second point.")
end

function collisiontest.test_drawable_should_collide_with_point_from_another_layer()
	-- given:
	local drawablelayer = vega.layer {
		camera = vega.camera {
			size = { x = 100, y = 100 },
		}
	}
	local pointlayer = vega.layer {
		camera = vega.camera {
			size = { x = 200, y = 200 },
		}
	}
	local drawable = vega.drawable {
		position = { x = 0, y = 0 },
		size = { x = 10, y = 10 },
	}
	local collidedpoint = {
		x = 20,
		y = 0
	}
	local notcollidedpoint = {
		x = 21,
		y = 0
	}

	-- when:
	local collideswithpoint1 = vega.collision.drawablecollideswithpoint(drawable, collidedpoint, drawablelayer, pointlayer)
	local collideswithpoint12 = vega.collision.drawablecollideswithpoint(drawable, notcollidedpoint, drawablelayer, pointlayer)

	-- then:
	assert_true(collideswithpoint1, "The drawable should collide with the first point.")
	assert_false(collideswithpoint2, "The drawable should not collide with the second point.")
end

function collisiontest.test_drawable_should_collide_with_display_point()
	-- given:
	local drawablelayer = vega.layer {
		camera = vega.camera {
			position = { x = 50, y = 50 },
			size = { x = 100, y = 100 },
		}
	}
	local display = {
		size = { x = 200, y = 200 },
	}
	local drawable = vega.drawable {
		position = { x = 0, y = 0 },
		size = { x = 10, y = 10 },
	}
	local collidedpoint = {
		x = 20,
		y = 0
	}
	local notcollidedpoint = {
		x = 21,
		y = 0
	}

	-- when:
	local collideswithpoint1 = vega.collision.drawablecollideswithdisplaypoint(drawable, collidedpoint, drawablelayer, display)
	local collideswithpoint12 = vega.collision.drawablecollideswithdisplaypoint(drawable, notcollidedpoint, drawablelayer, display)

	-- then:
	assert_true(collideswithpoint1, "The drawable should collide with the first point.")
	assert_false(collideswithpoint2, "The drawable should not collide with the second point.")
end

function collisiontest.test_drawable_should_collide_with_mouse()
	-- given:
	local drawablelayer = vega.layer {
		camera = vega.camera {
			position = { x = 50, y = 50 },
			size = { x = 100, y = 100 },
		}
	}
	local display = {
		size = { x = 200, y = 200 },
	}
	local drawable = vega.drawable {
		position = { x = 0, y = 0 },
		size = { x = 10, y = 10 },
	}
	local mouseposition = {
		x = 20,
		y = 0
	}
	local context = {
		input = {
			mouse = {
				position = mouseposition
			}
		},
		output = {
			display = display
		}
	}

	-- when:
	local collides = vega.collision.drawablecollideswithmouse(drawable, drawablelayer, context)

	-- then:
	assert_true(collides, "The drawable should collide with the mouse.")
end

function collisiontest.test_drawable_should_not_collide_with_mouse()
	-- given:
	local drawablelayer = vega.layer {
		camera = vega.camera {
			position = { x = 50, y = 50 },
			size = { x = 100, y = 100 },
		}
	}
	local display = {
		size = { x = 200, y = 200 },
	}
	local drawable = vega.drawable {
		position = { x = 0, y = 0 },
		size = { x = 10, y = 10 },
	}
	local mouseposition = {
		x = 21,
		y = 0
	}
	local context = {
		input = {
			mouse = {
				position = mouseposition
			}
		},
		output = {
			display = display
		}
	}

	-- when:
	local collides = vega.collision.drawablecollideswithmouse(drawable, drawablelayer, context)

	-- then:
	assert_false(collides, "The drawable should not collide with the mouse.")
end

return collisiontest