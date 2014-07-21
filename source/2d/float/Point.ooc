//
// Copyright (c) 2011-2014 Simon Mika <simon@mika.se>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program. If not, see <http://www.gnu.org/licenses/>.
import math
import ../../FloatExtension

Point : cover {
	x: Float
	y: Float
	//Norm ::= (this x pow(2.0f) + this y pow(2.0f)) sqrt() // FIXME: Why does this syntax not work on a cover?
	Norm: Float { get {	(this x pow(2.0f) + this y pow(2.0f)) sqrt()	} }
	//Azimuth ::= this y atan2(this x) // FIXME: Why does this syntax not work on a cover?
	Azimuth: Float { get { this y atan2(this x) } }
	init: func@ (=x, =y) { }
	pNorm: func (p : Float) -> Float {
		p == 1 ?
		this x abs() + this y abs() :
		(this x abs() pow(p) + this y abs() pow(p)) pow(1 / p)
	}
	scalarProduct: func(other: This) -> Float {
		this x * other x + this y + other y
	}
	angle: func(other: This) -> Float {
		(this scalarProduct(other) / (this Norm * other Norm)) clamp(-1, 1) acos() * (this x * other x - this y * other y < 0 ? -1 : 1)
	}
	distance: func(other: This) -> Float {
		(this - other) Norm
	}
	swap: func() -> This {
		This new(this y, this x)
	}
	round: func() -> This {
		This new(this x round(), this y round())
	}
	ceiling: func() -> This {
		This new(this x ceil(), this y ceil())
	}
	floor: func() -> This {
		This new(this x floor(), this y floor())
	}
	minimum: func(ceiling : This) -> This {
		This new(this x minimum(ceiling x), this y minimum(ceiling y))
	}
	maximum: func(floor : This) -> This {
		This new(this x minimum(floor x), this y minimum(floor y))
	}
	clamp: func(floor, ceiling : This) -> This {
		This new(this x clamp(floor x, ceiling x), this y clamp(floor y, ceiling x))
	}
	operator + (other: This) -> This {
		This new(this x + other x, this y + other y)
	}
	operator - (other: This) -> This {
		This new(this x - other x, this y - other y)
	}
	operator * (other: This) -> This {
		This new(this x * other x, this y * other y)
	}
	operator / (other: This) -> This {
		This new(this x / other x, this y / other y)
	}
	operator * (other: Float) -> This {
		This new(this x * other, this y * other)
	}
	operator / (other: Float) -> This {
		This new(this x / other, this y / other)
	}
	operator == (other: This) -> Bool {
		this x == other x && this y == other y
	}
	operator != (other: This) -> Bool {
		this x != other x || this y != other y
	}
	operator < (other: This) -> Bool {
		this x < other x && this y < other y
	}
	operator > (other: This) -> Bool {
		this x > other x && this y > other y
	}
	operator <= (other: This) -> Bool {
		this x <= other x && this y <= other y
	}
	operator >= (other: This) -> Bool {
		this x >= other x && this y >= other y
	}
}
operator * (left: Float, right: Point) -> Point {
	Point new(left * right x, left * right y)
}
operator / (left: Float, right: Point) -> Point {
	Point new(left / right x, left / right y)
}