Color.registerSpace!({
	name: Space::HSI
	parser(that, args) { // {{{
		if args.length == 1 {
			if args[0] is String {
				const color = args[0].toLowerCase().replace(/[^a-z0-9,.()#%]/g, '')

				let match
				// hsi(60, 100%, 170)
				if match ?= /^hsia?\((\d{1,3}),([0-9.]+\%),(\d{1,3})(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HSI
					that._hue = $caster.hue(match[1])
					that._saturation = $caster.percentage(match[2])
					that._intensity = $caster.ff(match[3])
					that._alpha = $caster.alpha(match[4], match[5])
					return true
				}
				// hsi(60deg, 100%, 170)
				else if match ?= /^hsia?\(([0-9.]+)(deg|grad|rad|turn),(\d{1,3}),([0-9.]+\%)(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HSI
					that._hue = $caster.hue(match[1] + match[2])
					that._saturation = $caster.percentage(match[3])
					that._intensity = $caster.ff(match[4])
					that._alpha = $caster.alpha(match[5], match[6])
					return true
				}
				// hsi(yellow, 100%, 50%)
				else if match ?= /^hsia?\((red|orange|yellow|green|blue|purple),([0-9.]+\%),(\d{1,3})(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HSI
					that._hue = $caster.namedHue(match[1])
					that._saturation = $caster.percentage(match[2])
					that._intensity = $caster.ff(match[3])
					that._alpha = $caster.alpha(match[4], match[5])
					return true
				}
				// hwb(yellow green, 100%, 50%)
				else if match ?= /^hwba?\((red|orange|yellow|green|blue|purple|(?:(?:reddish|orangish|yellowish|greenish|bluish|purplish)(?:\([0-9.]+\%\))?))(red|orange|yellow|green|blue|purple),([0-9.]+\%),(\d{1,3})(?:,([0-9.]+)(\%)?)?\)$/.exec(color) {
					that._space = Space::HSI
					that._hue = $caster.namedHue(match[1], match[2])
					that._saturation = $caster.percentage(match[3])
					that._intensity = $caster.ff(match[4])
					that._alpha = $caster.alpha(match[5], match[6])
					return true
				}
			}
			else if args[0] is Object {
				if args[0].h? && args[0].s? && args[0].i? {
					that._space = Space::HSI
					that._alpha = $caster.alpha(args[0].a)
					that._hue = $caster.hue(args[0].h)
					that._saturation = $caster.percentage(args[0].s)
					that._intensity = $caster.ff(args[0].i)
					return true
				}
				else if args[0].hue? && args[0].saturation? && args[0].intensity? {
					that._space = Space::HSI
					that._alpha = $caster.alpha(args[0].alpha)
					that._hue = $caster.hue(args[0].hue)
					that._saturation = $caster.percentage(args[0].saturation)
					that._intensity = $caster.ff(args[0].intensity)
					return true
				}
			}
		}
		else if args.length >= 3 {
			that._space = Space::HSI
			that._hue = $caster.hue(args[0])
			that._saturation = $caster.percentage(args[1])
			that._intensity = $caster.ff(args[2])
			that._alpha = args.length >= 4 ? $caster.alpha(args[3]) : 1
			return true
		}
	} // }}}
	formatter(that) { // {{{
		if that._alpha == 1 {
			return 'hsi(' + that._hue + ', ' + that._saturation + '%, ' + that._intensity + ')'
		}
		else {
			return 'hsia(' + that._hue + ', ' + that._saturation + '%, ' + that._intensity + ', ' + that._alpha + ')'
		}
	} // }}}
	converters: {
		from: {
			[Space::SRGB](red, green, blue, that) { // {{{
				that._intensity = (red + green + blue) / 3
				that._saturation = (100 * (1 - Math.min(red, green, blue) * 255 / that._intensity)).limit(0, 100).round()

				const r = red / 255
				const g = green / 255
				const b = blue / 255

				let h = Math.acos((((r - g) + (r - b)) / 2) / (Math.sqrt((r - g) * (r - g) + (r - b) * (g - b))))

				if b > g {
					h = 2 * Math.PI - h
				}

				h /= (2 * Math.PI)

				that._hue = (h * 360).limit(0, 359).round()

				return that
			} // }}}
		}
		to: {
			[Space::SRGB](hue, saturation, intensity, that) { // {{{
				const s = saturation / 100
				const i = intensity / 255

				let r, g, b, ph2
				if hue <= 120 {
					ph2 = Math.PI * hue * 2 / 360
					b = i * (1 - s)
					r = i * (1 + s * Math.cos(ph2) / Math.cos(Math.PI / 3 - ph2))
					g = 3 * i - r - b
				}
				else if hue <= 240 {
					ph2 = Math.PI * (hue - 120) * 2 / 360
					r = i * (1 - s)
					g = i * (1 + s * Math.cos(ph2) / Math.cos(Math.PI / 3 - ph2))
					b = 1 - r - g
				}
				else {
					ph2 = Math.PI * (hue - 240) * 2 / 360
					g = i * (1 - s)
					b = i * (1 + s * Math.cos(ph2) / Math.cos(Math.PI / 3 - ph2))
					r = 1 - b - r
				}

				that._red = (r * 255).limit(0, 255).round()
				that._green = (g * 255).limit(0, 255).round()
				that._blue = (b * 255).limit(0, 255).round()

				return that
			} // }}}
		}
	}
	components: {
		hue: {
			family: Space::HSB
		}
		saturation: {
			family: Space::HSB
		}
		intensity: {
			max: 255
		}
	}
})