Color.registerSpace!({
	name: Space::HWB
	parser(that, args) { // {{{
		if args.length == 1 {
			if args[0] is String {
				const color = args[0].toLowerCase().replace(/[^a-z0-9,.()#%]/g, '')

				let match
				// hwb(120, 100%, 50%)
				if match ?= /^hwba?\((\d{1,3}),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HWB
					that._hue = $caster.hue(match[1])
					that._whiteness = $caster.percentage(match[2])
					that._blackness = $caster.percentage(match[3])
					that._alpha = $caster.alpha(match[4], match[5])
					return true
				}
				// hwb(120deg, 100%, 50%)
				else if match ?= /^hwba?\(([0-9.]+)(deg|grad|rad|turn),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HWB
					that._hue = $caster.hue(match[1] + match[2])
					that._whiteness = $caster.percentage(match[3])
					that._blackness = $caster.percentage(match[4])
					that._alpha = $caster.alpha(match[5], match[6])
					return true
				}
				// hwb(yellow, 100%, 50%)
				else if match ?= /^hwba?\((red|orange|yellow|green|blue|purple),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HWB
					that._hue = $caster.namedHue(match[1])
					that._whiteness = $caster.percentage(match[2])
					that._blackness = $caster.percentage(match[3])
					that._alpha = $caster.alpha(match[4], match[5])
					return true
				}
				// hwb(yellow green, 100%, 50%)
				else if match ?= /^hwba?\((red|orange|yellow|green|blue|purple|(?:(?:reddish|orangish|yellowish|greenish|bluish|purplish)(?:\([0-9.]+\%\))?))(red|orange|yellow|green|blue|purple),([0-9.]+\%),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HWB
					that._hue = $caster.namedHue(match[1], match[2])
					that._whiteness = $caster.percentage(match[3])
					that._blackness = $caster.percentage(match[4])
					that._alpha = $caster.alpha(match[5], match[6])
					return true
				}
			}
			else if args[0] is Object {
				if args[0].h? && args[0].w? && args[0].b? {
					that._space = Space::HWB
					that._alpha = $caster.alpha(args[0].a)
					that._hue = $caster.hue(args[0].h)
					that._whiteness = $caster.percentage(args[0].w)
					that._blackness = $caster.percentage(args[0].b)
					return true
				}
				else if args[0].hue? && args[0].whiteness? && args[0].blackness? {
					that._space = Space::HWB
					that._alpha = $caster.alpha(args[0].alpha)
					that._hue = $caster.hue(args[0].hue)
					that._whiteness = $caster.percentage(args[0].whiteness)
					that._blackness = $caster.percentage(args[0].blackness)
					return true
				}
			}
		}
		else if args.length >= 3 {
			that._space = Space::HWB
			that._hue = $caster.hue(args[0])
			that._whiteness = $caster.percentage(args[1])
			that._blackness = $caster.percentage(args[2])
			that._alpha = args.length >= 4 ? $caster.alpha(args[3]) : 1
			return true
		}
	} // }}}
	formatter(that) { // {{{
		if that._alpha == 1 {
			return 'hwb(' + that._hue + ', ' + that._whiteness + '%, ' + that._blackness + '%)'
		}
		else {
			return 'hwba(' + that._hue + ', ' + that._whiteness + '%, ' + that._blackness + '%, ' + that._alpha + ')'
		}
	} // }}}
	converters: {
		from: {
			[Space::SRGB](red, green, blue, that) { // {{{
				const r = red / 255
				const g = green / 255
				const b = blue / 255

				const w = Math.min(r, g, b)
				const v = Math.max(r, g, b)

				if v == w {
					that._hue = 0
					that._whiteness = w
					that._blackness = 1 - v
				}
				else {
					const f = r == w ? g - b : g == w ? b - r : r - g
					const i = r == w ? 3 : g == w ? 5 : 1

					that._hue = Math.round(((i - f) / (v - w)) * 60)
					that._whiteness = Math.round(w * 100)
					that._blackness = Math.round(b * 100)
				}

				return that
			} // }}}
		}
		to: {
			[Space::SRGB](hue, whiteness, blackness, that) { // {{{
				const h = hue / 360
				const w = whiteness / 100
				const bk = blackness / 100

				const v = 1 - bk
				const i = Math.floor(h * 6)
				let f = h * 6 - i
				if i & i {
					f = 1 - f
				}
				const n = w + f * (v - w)

				let r, g, b
				switch i % 6 {
					0 => {
						r = v
						g = n
						b = w
					}
					1 => {
						r = n
						g = v
						b = w
					}
					2 => {
						r = w
						g = v
						b = n
					}
					3 => {
						r = w
						g = n
						b = v
					}
					4 => {
						r = n
						g = w
						b = v
					}
					5 => {
						r = v
						g = w
						b = n
					}
				}

				that._red = Math.round(r * 255)
				that._green = Math.round(g * 255)
				that._blue = Math.round(b * 255)

				return that
			} // }}}
		}
	}
	components: {
		hue: {
			family: Space::HSB
		}
		whiteness: {
			max: 100,
			round: 1
		}
		blackness: {
			max: 100,
			round: 1
		}
	}
})