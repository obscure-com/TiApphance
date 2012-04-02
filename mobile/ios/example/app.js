
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
window.add(label);
window.open();

// TODO: write your module tests here
var tiapphance = require('com.obscure.TiApphance');
Ti.API.info("module is => " + tiapphance);

tiapphance.startNewSession("YOUR_APPHANCE_API_KEY_HERE", tiapphance.MODE_QA);
label.text = 'started session';
