const $hue = {
	bases: {
		red: 0,
		orange: 30,
		yellow: 60,
		green: 120,
		blue: 240,
		purple: 300
	},
	splashes: {
		reddish: 0,
		orangish: 30,
		yellowish: 60,
		greenish: 130,
		bluish: 240,
		purplish: 300
	}
}

const $rad2degree = 360 / (2 * Math.PI)

const $caster = {
	alpha(n?, percentage = null) { // {{{
		n = parseFloat(n)

		if n is NaN {
			return 1
		}

		return (?percentage ? n / 100 : n).limit(0, 1).round(3)
	} // }}}
	ff(n) => parseFloat(n).limit(0, 255).round()
	hue(hue) { // {{{
		if hue is String {
			let match

			// 120
			if match ?= /^(\d{1,3})$/.exec(hue) {
				hue = match[1]
			}
			// 120deg
			else if match ?= /^([0-9.]+)(deg|grad|rad|turn)$/.exec(hue) {
				if match[2] == 'deg' {
					hue = match[1]
				}
				else if match[2] == 'grad' {
					hue = match[1] * 0.9 // 360 / 400
				}
				else if match[2] == 'rad' {
					hue = match[1] * $rad2degree
				}
				else if match[2] == 'turn' {
					hue = match[1] * 360
				}
			}
			// yellow
			else if match ?= /^(red|orange|yellow|green|blue|purple)$/.exec(hue) {
				return $caster.namedHue(match[1])
			}
			// yellow green
			else if match ?= /^(red|orange|yellow|green|blue|purple|(?:(?:reddish|orangish|yellowish|greenish|bluish|purplish)(?:\([0-9.]+\%\))?))(red|orange|yellow|green|blue|purple)$/.exec(hue) {
				return $caster.namedHue(match[1], match[2])
			}
		}

		return parseFloat(hue).mod(360).round()
	} // }}}
	namedHue(hue1: String, hue2 = null) { // {{{
		if hue2 != null {
			if $hue.bases[hue1]? {
				return (($hue.bases[hue1] + $hue.bases[hue2]) / 2).limit(0, 359).round()
			}
			else {
				/* const splash = $hue.splashes[hue1.before('(')] */
				const splash = $hue.splashes[hue1.before('(') || hue1]
				const pourcent = (hue1.replace(/[a-z\(\)\%]/gi, '').toInt() || 25) / 100
				const base = $hue.bases[hue2]
				const d = splash - base

				return (base + (d * pourcent)).limit(0, 359).round()
			}
		}
		else {
			return $hue.bases[hue1]
		}
	}, // }}}
	percentage(n) => parseFloat(n).limit(0, 100).round(1)
}