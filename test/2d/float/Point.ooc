use ooc-unit

PointTest: class extends Fixture {
	init: func () {
		super("Point")
		this add("0.0 is equal to 0.0", func() { expect(0.0f, is equal to(0.0f)) })
		this add("1.0 is equal to 1.0", func() { expect(1.0f, is equal to(1.0f)) })
		this add("2.0 is equal to 2", func() { expect(2.0f, is equal to(2.0f)) })
		this add("9.0 is equal to 9", func() { expect(9.0f, is equal to(9.0f)) })
		this add("10.0 is equal to 10", func() { expect(10.0f, is equal to(10.0f)) })
		this add("100.0 is equal to 100", func() { expect(100.0f, is equal to(100.0f)) })
		this add("-1.0 is equal to -1", func() { expect(-1.0f, is equal to(-1.0f)) })
		this add("4.2 is equal to 4.2", func() { expect(4.2f, is equal to(4.2f)) })
		this add("-13.37 is equal to -13.37", func() { expect(-13.37f, is equal to(-13.37f)) })
		isNotEqualTo42 := is not equal to(4.2f)
		this add("0.0 is not equal to 4.2", func() { expect(0.0f, isNotEqualTo42) })
		this add("0.0 is equal to -0.0", func() { expect(0.0f, is equal to(-0.0f)) })
	}
}
PointTest new() run()
