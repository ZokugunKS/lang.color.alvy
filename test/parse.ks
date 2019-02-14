#![bin]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('parse', func() {
	describe('hsl', func() {
		it('hsl(90, 100%, 50%)', func() { // {{{
			const c = new Color('hsl(90, 100%, 50%)')

			expect(c.red()).equal(128)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsla(90, 100%, 50%, 70%)', func() { // {{{
			const c = new Color('hsla(90, 100%, 50%, 70%)')

			expect(c.red()).equal(128)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(0.7)
		}) // }}}

		it('hsla(90, 100%, 50%, 0.7)', func() { // {{{
			const c = new Color('hsla(90, 100%, 50%, 0.7)')

			expect(c.red()).equal(128)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(0.7)
		}) // }}}

		it('hsl(90deg, 100%, 50%)', func() { // {{{
			const c = new Color('hsl(90deg, 100%, 50%)')

			expect(c.red()).equal(128)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsl(100grad, 100%, 50%)', func() { // {{{
			const c = new Color('hsl(100grad, 100%, 50%)')

			expect(c.red()).equal(128)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsl(0.25turn, 100%, 50%)', func() { // {{{
			const c = new Color('hsl(0.25turn, 100%, 50%)')

			expect(c.red()).equal(128)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsl(1.57rad, 100%, 50%)', func() { // {{{
			const c = new Color('hsl(1.57rad, 100%, 50%)')

			expect(c.red()).equal(128)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsl(yellow, 100%, 50%)', func() { // {{{
			const c = new Color('hsl(yellow, 100%, 50%)')

			expect(c.red()).equal(255)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsl(yellow green, 100%, 50%)', func() { // {{{
			const c = new Color('hsl(yellow green, 100%, 50%)')

			expect(c.red()).equal(128)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsl(greenish blue, 100%, 50%)', func() { // {{{
			const c = new Color('hsl(greenish blue, 100%, 50%)')

			expect(c.red()).equal(0)
			expect(c.green()).equal(115)
			expect(c.blue()).equal(255)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsl(greenish(10%) blue, 100%, 50%)', func() { // {{{
			const c = new Color('hsl(greenish(10%) blue, 100%, 50%)')

			expect(c.red()).equal(0)
			expect(c.green()).equal(47)
			expect(c.blue()).equal(255)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsl(325,6.3%,37.6%)', func() { // {{{
			const c = new Color('hsl(325,6.3%,37.6%)')

			expect(c.hex()).to.equal('#665a61')
		}) // }}}

		it('hsl(325,5.5%,38.4%)', func() { // {{{
			const c = new Color('hsl(325,5.5%,38.4%)')

			expect(c.hex()).to.equal('#675d63')
		}) // }}}

		it('hsl(325,6%,38%)', func() { // {{{
			const c = new Color('hsl(325,6%,38%)')

			expect(c.hex()).to.equal('#675b62')
		}) // }}}

		it('#665a61', func() { // {{{
			const c = new Color('#665a61')

			expect(c.format('hsl')).to.equal('hsl(325, 6.3%, 37.6%)')
		}) // }}}
	})

	describe('hsb', func() {
		it('hsb(90, 100%, 50%)', func() { // {{{
			const c = new Color('hsb(90, 100%, 50%)')

			expect(c.red()).equal(64)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsba(90, 100%, 50%, 70%)', func() { // {{{
			const c = new Color('hsba(90, 100%, 50%, 70%)')

			expect(c.red()).equal(64)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(0.7)
		}) // }}}

		it('hsba(90, 100%, 50%, 0.7)', func() { // {{{
			const c = new Color('hsba(90, 100%, 50%, 0.7)')

			expect(c.red()).equal(64)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(0.7)
		}) // }}}

		it('hsb(90deg, 100%, 50%)', func() { // {{{
			const c = new Color('hsb(90deg, 100%, 50%)')

			expect(c.red()).equal(64)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsb(100grad, 100%, 50%)', func() { // {{{
			const c = new Color('hsb(100grad, 100%, 50%)')

			expect(c.red()).equal(64)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsb(0.25turn, 100%, 50%)', func() { // {{{
			const c = new Color('hsb(0.25turn, 100%, 50%)')

			expect(c.red()).equal(64)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsb(1.57rad, 100%, 50%)', func() { // {{{
			const c = new Color('hsb(1.57rad, 100%, 50%)')

			expect(c.red()).equal(64)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsb(yellow, 100%, 50%)', func() { // {{{
			const c = new Color('hsb(yellow, 100%, 50%)')

			expect(c.red()).equal(128)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsb(yellow green, 100%, 50%)', func() { // {{{
			const c = new Color('hsb(yellow green, 100%, 50%)')

			expect(c.red()).equal(64)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsb(greenish blue, 100%, 50%)', func() { // {{{
			const c = new Color('hsb(greenish blue, 100%, 50%)')

			expect(c.red()).equal(0)
			expect(c.green()).equal(57)
			expect(c.blue()).equal(128)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsb(greenish(10%) blue, 100%, 50%)', func() { // {{{
			const c = new Color('hsb(greenish(10%) blue, 100%, 50%)')

			expect(c.red()).equal(0)
			expect(c.green()).equal(23)
			expect(c.blue()).equal(128)
			expect(c.alpha()).equal(1)
		}) // }}}
	})

	describe('hwb', func() {
		it('hwb(60, 20%, 40%)', func() { // {{{
			const c = new Color('hwb(60, 20%, 40%)')

			expect(c.red()).equal(153)
			expect(c.green()).equal(153)
			expect(c.blue()).equal(51)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hwb(0, 0%, 0%)', func() { // {{{
			const c = new Color('hwb(0, 0%, 0%)')

			expect(c.red()).equal(255)
			expect(c.green()).equal(0)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hwb(240, 100%, 0%)', func() { // {{{
			const c = new Color('hwb(240, 100%, 0%)')

			expect(c.red()).equal(255)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(255)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hwba(60, 20%, 40%, 70%)', func() { // {{{
			const c = new Color('hwba(60, 20%, 40%, 70%)')

			expect(c.red()).equal(153)
			expect(c.green()).equal(153)
			expect(c.blue()).equal(51)
			expect(c.alpha()).equal(0.7)
		}) // }}}

		it('hwba(60, 20%, 40%, 0.7)', func() { // {{{
			const c = new Color('hwba(60, 20%, 40%, 0.7)')

			expect(c.red()).equal(153)
			expect(c.green()).equal(153)
			expect(c.blue()).equal(51)
			expect(c.alpha()).equal(0.7)
		}) // }}}

		it('hwb(90deg, 100%, 50%)', func() { // {{{
			const c = new Color('hwb(90deg, 100%, 50%)')

			expect(c.red()).equal(191)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(255)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hwb(100grad, 100%, 50%)', func() { // {{{
			const c = new Color('hwb(100grad, 100%, 50%)')

			expect(c.red()).equal(191)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(255)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hwb(0.25turn, 100%, 50%)', func() { // {{{
			const c = new Color('hwb(0.25turn, 100%, 50%)')

			expect(c.red()).equal(191)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(255)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hwb(1.57rad, 100%, 50%)', func() { // {{{
			const c = new Color('hwb(1.57rad, 100%, 50%)')

			expect(c.red()).equal(191)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(255)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hwb(yellow, 100%, 50%)', func() { // {{{
			const c = new Color('hwb(yellow, 100%, 50%)')

			expect(c.red()).equal(128)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(255)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hwb(yellow green, 100%, 50%)', func() { // {{{
			const c = new Color('hwb(yellow green, 100%, 50%)')

			expect(c.red()).equal(191)
			expect(c.green()).equal(128)
			expect(c.blue()).equal(255)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hwb(greenish blue, 100%, 50%)', func() { // {{{
			const c = new Color('hwb(greenish blue, 100%, 50%)')

			expect(c.red()).equal(255)
			expect(c.green()).equal(198)
			expect(c.blue()).equal(128)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hwb(greenish(10%) blue, 100%, 50%)', func() { // {{{
			const c = new Color('hwb(greenish(10%) blue, 100%, 50%)')

			expect(c.red()).equal(255)
			expect(c.green()).equal(232)
			expect(c.blue()).equal(128)
			expect(c.alpha()).equal(1)
		}) // }}}
	})

	describe('hsi', func() {
		it('hsi(60, 57%, 119)', func() { // {{{
			const c = new Color('hsi(60, 57%, 119)')

			expect(c.red()).equal(153)
			expect(c.green()).equal(153)
			expect(c.blue()).equal(51)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsi(0, 100%, 85)', func() { // {{{
			const c = new Color('hsi(0, 100%, 85)')

			expect(c.red()).equal(255)
			expect(c.green()).equal(0)
			expect(c.blue()).equal(0)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsi(0, 0%, 255)', func() { // {{{
			const c = new Color('hsi(0, 0%, 255)')

			expect(c.red()).equal(255)
			expect(c.green()).equal(255)
			expect(c.blue()).equal(255)
			expect(c.alpha()).equal(1)
		}) // }}}

		it('hsia(60, 57%, 119, 70%)', func() { // {{{
			const c = new Color('hsia(60, 57%, 119, 70%)')

			expect(c.red()).equal(153)
			expect(c.green()).equal(153)
			expect(c.blue()).equal(51)
			expect(c.alpha()).equal(0.7)
		}) // }}}

		it('hsia(60, 57%, 119, 0.7)', func() { // {{{
			const c = new Color('hsia(60, 57%, 119, 0.7)')

			expect(c.red()).equal(153)
			expect(c.green()).equal(153)
			expect(c.blue()).equal(51)
			expect(c.alpha()).equal(0.7)
		}) // }}}
	})
})