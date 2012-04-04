
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
window.add(label);
window.open();

// TODO: write your module tests here
var tiapphance = require('com.obscure.TiApphance');
Ti.API.info("module is => " + tiapphance);

tiapphance.startNewSession("a3f78c237a2f540892dfff409ec83a60952518a8", tiapphance.MODE_QA);
label.text = 'started session';

tiapphance.APHExtendedLog(tiapphance.LEVEL_INFO, 'sometag', String.format('the time is %s', (new Date()).toString()));
label.text = 'logged';