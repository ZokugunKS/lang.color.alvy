#![bin]
#![error(off)]

extern {
	describe:	func
	it:			func
}

import {
	'chai'		for expect
	'..'
}

describe('measure', func() {
	it('contrast(white, hsla(200,0%,0%,0.7))', func() { // {{{
		const c = new Color('white').contrast(Color.from('hsla(200,0%,0%,0.7)'))

		expect(c.ratio).to.equal(8.45)
		expect(c.error).to.equal(0)
	}) // }}}
})