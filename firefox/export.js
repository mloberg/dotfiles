var result = [];
var prefs = Services.prefs.getChildList('');

for (const i in prefs) {
    var pref = prefs[i];
    if (!Services.prefs.prefHasUserValue(pref)) {
        continue;
    }
    var p = pref.replace(/"/g, '\\"');
	switch (Services.prefs.getPrefType(pref)) {
		case 32:
			var v = Services.prefs.getStringPref(pref).replace(/"/g, '\\"');
			result.push(`user_pref("${p}", "${v}");`);
			break;
		case 64:
			var v = Services.prefs.getIntPref(pref).toString();
			result.push(`user_pref("${p}", ${v});`);
			break;
		case 128:
			var v = Services.prefs.getBoolPref(pref).toString();
			result.push(`user_pref("${p}", ${v});`);
			break;
		default:
			result.push(`//user_pref("${p}", ???);`);
	}
}

console.log(result.join('\n'));
