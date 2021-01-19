// List custom user preferences
const userPrefs = Services.prefs.getChildList('')
    .filter((p) => Services.prefs.prefHasUserValue(p))
    .map((p) => {
        switch (Services.prefs.getPrefType(p)) {
            case Services.prefs.PREF_STRING:
                return `user_pref("${p}", "${Services.prefs.getStringPref(p).replace(/"/g, '\\"')}");`;
            case Services.prefs.PREF_INT:
                return `user_pref("${p}", ${Services.prefs.getIntPref(p).toString()});`;
            case Services.prefs.PREF_BOOL:
                return `user_pref("${p}", ${Services.prefs.getBoolPref(p).toString()});`;
            default:
                return result.push(`//user_pref("${p}", ???);`);
        }
    });

console.log(userPrefs.join('\n'));
